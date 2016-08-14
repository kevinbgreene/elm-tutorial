module Update exposing (..)


import Navigation
import Models exposing (State, Post)
import Messages exposing (Msg(..))
import Routing.Parsers exposing (urlParser)
import Routing.Routes exposing (..)
import Routing.Routes as Routing


update : Msg -> State -> (State, Cmd Msg)
update msg state =
  case msg of

    FetchSucceed posts ->
      ({ state | posts = Just posts }, Cmd.none)

    FetchFail err ->
      (state, Cmd.none)

    ShowHome ->
      (state, Navigation.newUrl (Routing.reverse HomeRoute))

    ShowPost postId ->
      let
        postPath =
          Routing.reverse (PostRoute postId)

      in
        (state, Navigation.newUrl postPath)


urlUpdate : Route -> State -> (State, Cmd Msg)
urlUpdate route state =
  ({ state | route = route }, Cmd.none)
