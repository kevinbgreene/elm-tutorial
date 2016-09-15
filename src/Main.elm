module Main exposing (..)


import Navigation
import Messages exposing (..)
import Routing.Parsers exposing (urlParser)
import Routing.Routes exposing (Route(..))
import View exposing (view)
import Models exposing (State, Post, newPost, newState)
import Tasks exposing (..)
import Update exposing (..)
import Ports as Ports


main : Program Never
main =
  Navigation.program urlParser
    { init = init
    , view = view
    , update = update
    , urlUpdate = urlUpdate
    , subscriptions = subscriptions
    }


init : Route -> (State, Cmd Msg)
init route =
  case route of
    HomeRoute ->
      ( newState route Nothing, fetchPosts )

    PostRoute postId ->
      ( newState route Nothing, fetchPost postId )

    NewPostRoute ->
      ( newState route (Just newPost), Cmd.none )

    EditPostRoute postId ->
      ( newState route Nothing, Ports.get postId )

    _ ->
      ( newState route Nothing, Cmd.none )


-- SUBSCRIPTIONS


subscriptions : State -> Sub Msg
subscriptions state =
  Ports.load PostReceived
