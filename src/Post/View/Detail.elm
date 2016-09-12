module Post.View.Detail exposing (view)


import Models exposing (Post)
import Html exposing (Html, div, h2, text)
import Html.Attributes exposing (class)
import Messages exposing (Msg)


view : Maybe Post -> Html Msg
view maybePost =
  case maybePost of
    Just post ->
      div [ class "post-content" ]
        [ h2 [ class "post-header" ] [ text post.title ]
        , div [ class "post-author" ] [ text ("by: " ++ post.author) ]
        , div [ class "post-body" ] [ text post.body ]
        ]

    Nothing ->
      div [] [ text "Loading" ]
