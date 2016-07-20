module Messages exposing (..)


type alias PostId =
  Int


type Msg
  = ShowHome
  | ShowPost PostId
