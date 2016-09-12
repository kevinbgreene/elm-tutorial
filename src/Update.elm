module Update exposing (..)


import Navigation
import Models exposing (State, Post)
import Messages exposing (Msg(..))
import Routing.Parsers exposing (urlParser)
import Routing.Routes exposing (..)
import Routing.Routes as Routing
import Tasks exposing (..)


update : Msg -> State -> (State, Cmd Msg)
update msg state =

  case msg of

    FetchFailed err ->
      let
        newState =
          { state | error = Just "An error occurred retrieving data" }

      in
        (newState, Cmd.none)

    PostsReceived posts ->
      let
        newState =
          { state | posts = Just posts, loading = False }

      in
        (newState, Cmd.none)

    PostReceived post ->
      let
        newState =
          { state | current = Just post, loading = False }

      in
        (newState, Cmd.none)

    ShowHome ->
      let
        newCmd =
          Navigation.newUrl (Routing.reverse HomeRoute)

      in
        (state, newCmd)

    ShowPost postId ->
      let
        newCmd =
          Navigation.newUrl (Routing.reverse (PostRoute postId))

      in
        (state, newCmd)


urlUpdate : Route -> State -> (State, Cmd Msg)
urlUpdate route state =
  case route of
    HomeRoute ->
      let
        newState =
          { state | posts = Nothing, route = route, loading = True }

        newCmd =
          fetchPosts

      in
        (newState, newCmd)

    PostRoute postId ->
      let
        newState =
          { state | current = Nothing, route = route, loading = True }

        newCmd =
          fetchPost postId

      in
        (newState, newCmd)

    _ ->
      ({ state | route = route}, Cmd.none)
