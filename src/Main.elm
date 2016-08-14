module Main exposing (..)


import Navigation
import Messages exposing (..)
import Routing.Parsers exposing (urlParser)
import Routing.Routes exposing (Route)
import View exposing (view)
import Models exposing (State, Post, newState)
import Update exposing (..)
import Decoders.Posts exposing (..)
import Http
import Task


main : Program Never
main =
  Navigation.program urlParser
    { init = init
    , view = view
    , update = update
    , urlUpdate = urlUpdate
    , subscriptions = subscriptions
    }


fetchPosts : String -> Cmd Msg
fetchPosts url =
  Task.perform FetchFail FetchSucceed (Http.get decodePosts url)


init : Route -> (State, Cmd Msg)
init route =
    let
      url =
        "http://localhost:3000/api/posts"

    in
      ( newState route, fetchPosts url )


-- SUBSCRIPTIONS


subscriptions : State -> Sub Msg
subscriptions state =
  Sub.none
