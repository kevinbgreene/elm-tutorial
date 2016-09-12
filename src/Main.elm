module Main exposing (..)


import Navigation
import Messages exposing (..)
import Routing.Parsers exposing (urlParser)
import Routing.Routes exposing (Route(..))
import View exposing (view)
import Models exposing (State, Post, newState)
import Tasks exposing (..)
import Update exposing (..)


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
      ( newState route, fetchPosts )

    PostRoute postId ->
      ( newState route, fetchPost postId )

    _ ->
      ( newState route, Cmd.none )


-- SUBSCRIPTIONS


subscriptions : State -> Sub Msg
subscriptions state =
  Sub.none
