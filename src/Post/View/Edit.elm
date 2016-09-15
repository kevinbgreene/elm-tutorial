module Post.View.Edit exposing (view)


import Models exposing (Post)
import Html exposing (Html, div, input, text, textarea)
import Html.Attributes exposing (class, placeholder, value)
import Html.Events exposing (onInput)
import Messages exposing (..)


view : Maybe Post -> Html Msg
view post =
  div [ class "post-editor" ]
    [ input
      [ onInput UpdatePostTitle
      , class "title-input-field"
      , placeholder "Enter title"
      , value (titleValue post)
      ] []
    , textarea
      [ onInput UpdatePostBody
      , class "body-input-field"
      , placeholder "Enter post body"
      ] (bodyContent post)
    ]


titleValue : Maybe Post -> String
titleValue maybePost =
  case maybePost of
    Just post ->
      post.title

    Nothing ->
      ""


bodyContent : Maybe Post -> List (Html Msg)
bodyContent maybePost =
  case maybePost of
    Just post ->
      [ text post.body ]

    Nothing ->
      []
