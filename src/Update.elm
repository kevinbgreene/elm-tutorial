module Update exposing (..)


import Navigation
import Models exposing (State, Post, newPost)
import Messages exposing (Msg(..))
import Routing.Parsers exposing (urlParser)
import Routing.Routes exposing (..)
import Routing.Routes as Routing
import Tasks exposing (..)
import Ports as Ports


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

    UpdatePostTitle title ->
      let
        newPost =
          updatePostTitle state.current title

        newState =
          { state | current = newPost }

        newCmd =
          Ports.save newPost

      in
        (newState, newCmd)

    UpdatePostBody body ->
      let
        newPost =
          updatePostBody state.current body

        newState =
          { state | current = newPost }

        newCmd =
          Ports.save newPost

      in
        (newState, newCmd)

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

    ShowNewPost ->
      let
        newCmd =
          Navigation.newUrl (Routing.reverse NewPostRoute)

      in
        (state, newCmd)

    ShowEditPost postId ->
      let
        newCmd =
          Navigation.newUrl (Routing.reverse (EditPostRoute postId))

      in
        (state, newCmd)


updatePostTitle : Maybe Post -> String -> Maybe Post
updatePostTitle maybePost title =
  case maybePost of
    Just post ->
      Just { post | title = title }

    Nothing ->
      Nothing

updatePostBody : Maybe Post -> String -> Maybe Post
updatePostBody maybePost body =
  case maybePost of
    Just post ->
      Just { post | body = body }

    Nothing ->
      Nothing

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

    EditPostRoute postId ->
      let
        newState =
          { state | current = Nothing, route = route, loading = True }

        newCmd =
          Ports.get postId

      in
        (newState, newCmd)


    NewPostRoute ->
      let
        newState =
          { state | current = Just newPost, route = route }

      in
        (newState, Cmd.none)

    _ ->
      ({ state | route = route}, Cmd.none)
