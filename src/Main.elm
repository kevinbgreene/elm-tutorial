import Html exposing (Html, Attribute, div, text, a, header)
import Html.Attributes exposing (class, href)
import Html.Events exposing (Options, onWithOptions)
import Navigation
import String
import Json.Decode as Json
import UrlParser exposing (Parser, (</>), format, int, oneOf, s, string)


main : Program Never
main =
  Navigation.program urlParser
    { init = init
    , view = view
    , update = update
    , urlUpdate = urlUpdate
    , subscriptions = subscriptions
    }


-- MODEL


type alias State =
  { route : Route
  }


initialState : Route -> State
initialState route =
  { route = route
  }


init : Route -> (State, Cmd Msg)
init route =
    ( initialState route, Cmd.none )


-- ROUTES


type alias PostId =
  Int


type Route
  = HomeRoute
  | PostsRoute
  | PostRoute PostId
  | NotFound


-- PARSING


parse : Navigation.Location -> Route
parse {pathname} =
  let
    path =
      if String.startsWith "/" pathname then
        String.dropLeft 1 pathname
      else
        pathname

  in
    case UrlParser.parse identity routeParser path of
      Err err -> NotFound

      Ok route -> route


urlParser : Navigation.Parser Route
urlParser =
  Navigation.makeParser parse

postsParser : Parser a a
postsParser =
  s "posts"

postParser : Parser (Int -> a) a
postParser =
  s "post" </> int

homeParser : Parser a a
homeParser =
  oneOf
    [ (s "index.html")
    , (s "")
    ]

routeParser : Parser (Route -> a) a
routeParser =
  oneOf
    [ format PostsRoute postsParser
    , format PostRoute postParser
    , format HomeRoute homeParser
    ]


-- UPDATE


type alias Url =
  String


type Msg
  = ShowHome
  | ShowPosts
  | ShowPost PostId


update : Msg -> State -> (State, Cmd Msg)
update msg state =
  case msg of
    ShowHome -> (state, Navigation.newUrl "/")

    ShowPosts -> (state, Navigation.newUrl "/posts")

    ShowPost postId -> (state, Navigation.newUrl ("/post/" ++ toString postId))


urlUpdate : Route -> State -> (State, Cmd Msg)
urlUpdate route state =
  ({ state | route = route }, Cmd.none)


-- VIEW


view : State -> Html Msg
view state =
  div [ class "page-wrap" ]
    [ viewHeader
    , viewBody state
    ]



viewHeader : Html Msg
viewHeader =
  header
    [ class "main-header"
    ]
    [ a (linkAttrs ShowHome "/") [ text "Home" ]
    , a (linkAttrs ShowPosts "/posts") [ text "Posts" ]
    ]

linkAttrs : Msg -> String -> List (Attribute Msg)
linkAttrs message link =
  [ onClick message
  , href link
  , class "nav-link"
  ]

viewBody : State -> Html Msg
viewBody state =
  div [ class "body-wrap" ] [ bodyContent state ]

bodyContent : State -> Html Msg
bodyContent state =
  case state.route of
    HomeRoute -> div [] [ text "Home Page" ]

    PostsRoute -> div [] [ text "Posts List" ]

    PostRoute postId -> div [] [ text ("Post Detail " ++ toString postId) ]

    _ -> div [] [ text "Not Found" ]


noBubble : Options
noBubble =
  { stopPropagation = True
  , preventDefault = True
  }


onClick : Msg -> Attribute Msg
onClick message =
  onWithOptions "click" noBubble (Json.succeed message)


-- SUBSCRIPTIONS


subscriptions : State -> Sub Msg
subscriptions state =
  Sub.none
