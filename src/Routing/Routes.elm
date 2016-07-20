module Routing.Routes exposing (Route(..), reverse)


type alias PostId =
  Int


type Route
  = HomeRoute
  | PostRoute PostId
  | NotFound


reverse : Route -> String
reverse route =
  case route of

    PostRoute postId ->
      "/post/" ++ (toString postId)

    _ ->
      "/"
