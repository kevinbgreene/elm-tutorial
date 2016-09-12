module Models exposing (..)


import Routing.Routes exposing (Route)


type alias State =
  { route : Route
  , loading : Bool
  , error : Maybe String
  , posts : Maybe (List Post)
  , current : Maybe Post
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
  , loading = False
  , error = Nothing
  , posts = Nothing
  , current = Nothing
  }
