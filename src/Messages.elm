module Messages exposing (..)


import Models exposing (Post)
import Http


type alias PostId =
  Int


type Msg
  = ShowHome
  | ShowPost PostId
  | PostsReceived (List Post)
  | PostReceived Post
  | FetchFailed Http.Error
