module Models exposing (..)


import Routing.Routes exposing (Route)


type alias State =
  { route : Route
  }


newState : Route -> State
newState route =
  { route = route
  }
