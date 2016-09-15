module Messages exposing (..)


import Models exposing (Post)
import Http


type alias PostId =
  Int


type Msg
  = ShowHome
  | ShowPost PostId
  | ShowNewPost
  | ShowEditPost PostId
  | UpdatePostTitle String
  | UpdatePostBody String
  | PostsReceived (List Post)
  | PostReceived Post
  | FetchFailed Http.Error
