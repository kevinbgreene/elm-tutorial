module View.Body exposing (view)


import Html exposing (Html, Attribute, h2, ul, li, div, text, a, header)
import Html.Attributes exposing (class, href)
import Routing.Routes as Routing
import Routing.Routes exposing (..)
import Post.View as PostView
import View.NotFound as NotFoundView
import Messages exposing (Msg(..))
import Models exposing (State)
import Common.Html.Util exposing (linkAttrs)


view : State -> Html Msg
view state =
  div [ class "body-wrap" ] [ bodyContent state ]


bodyContent : State -> Html Msg
bodyContent state =
  case state.route of
    HomeRoute ->
      postListView

    PostRoute postId ->
      PostView.view postId

    _ ->
      NotFoundView.view


postListView : Html Msg
postListView =
  ul [ class "post-list" ]
    [ li [ class "post-entry" ]
      [ a (postLinkAttrs (ShowPost 89) (Routing.reverse (PostRoute 89)))
        [ h2 [ class "post-header" ]
            [ text "4 Reasons Why You Should't Punch Your Boss" ]
        ]
      ]
    ]

postLinkAttrs : Msg -> String -> List (Attribute Msg)
postLinkAttrs = linkAttrs "post-link"
