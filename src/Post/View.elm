module Post.View exposing (view)


import Html exposing (Html, div, text)
import Messages exposing (Msg)


type alias PostId =
  Int


view : PostId -> Html Msg
view postId =
  div [] [ text ("Post " ++ (toString postId)) ]
