module Test.Decoders.Posts exposing (tests)


import ElmTest exposing (Test, suite, test, assertEqual)
import Json.Decode as Json
import Decoders.Posts exposing (..)
import Models exposing (Post)


tests : Test
tests =
    suite "Decoders.Posts.decodePost"
        [ test "Should return Ok for valid JSON"
            <| assertEqual expectedSuccess (Json.decodeString decodePost validResponse)

        , test "Should return Error for unexpected JSON"
            <| assertEqual expectedError (Json.decodeString decodePost invalidResponse)
        ]


expectedSuccess : Result x Post
expectedSuccess =
  Ok
    { id = 1
    , author = "Test Author"
    , title = "Test Title"
    , body = "Test Body"
    }

expectedError : Result String a
expectedError =
  Err "Expecting an object with a field named `id` but instead got: {}"


validResponse : String
validResponse =
  """
    { "id" : 1
    , "author" : "Test Author"
    , "title" : "Test Title"
    , "body" : "Test Body"
    }
  """

invalidResponse : String
invalidResponse =
  "{}"
