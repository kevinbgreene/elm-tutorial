port module Ports exposing (..)


import Models exposing (Post)


-- PORTS


port save : Maybe Post -> Cmd msg


port get : Int -> Cmd msg


port load : (Post -> msg) -> Sub msg
