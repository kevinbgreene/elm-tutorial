module View exposing (view)


import Html exposing (Html, div)
import Html.Attributes exposing (class)
import Messages exposing (Msg)
import Models exposing (State)
import View.Header as HeaderView
import View.Body as BodyView


view : State -> Html Msg
view state =
  div [ class "page-wrap" ]
    [ HeaderView.view
    , BodyView.view state
    ]
