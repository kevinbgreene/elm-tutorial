module Models exposing (..)


import Routing.Routes exposing (Route)


type alias State =
  { route : Route
  , posts : Maybe (List Post)
  }


type alias Post =
  { id : Int
  , author : String
  , title : String
  , body : String
  }


newState : Route -> State
newState route =
  { route = route
  , posts = Nothing
  }
