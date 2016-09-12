module Tasks exposing (..)


import Messages exposing (..)
import Decoders.Posts exposing (..)
import Http
import Task


fetchPosts : Cmd Msg
fetchPosts =
  let
    url = "/api/posts"

  in
    Task.perform FetchFailed PostsReceived (Http.get decodePosts url)


fetchPost : Int -> Cmd Msg
fetchPost postId =
  let
    url = "/api/post/" ++ (toString postId)

  in
    Task.perform FetchFailed PostReceived (Http.get decodePost url)
