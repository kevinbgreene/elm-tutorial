module View.NotFound exposing (view)


import Html exposing (Html, div, text)
import Messages exposing (Msg)


view : Html Msg
view =
  div [] [ text "Not Found" ]
