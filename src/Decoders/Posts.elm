module Decoders.Posts exposing (..)


import Json.Decode as Json
import Models exposing (Post)


decodePost : Json.Decoder Post
decodePost =
    Json.object4 Post
        (Json.at ["id"] Json.int)
        (Json.at ["author"] Json.string)
        (Json.at ["title"] Json.string)
        (Json.at ["body"] Json.string)


decodePosts : Json.Decoder (List Post)
decodePosts =
  Json.list decodePost
