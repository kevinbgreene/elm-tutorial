import Html exposing (Html, input, label, div, text)
import Html.App as App
import Html.Events exposing (onInput)


main =
  App.beginnerProgram { model = model, view = view, update = update }


-- MODEL

type alias Model = String

model : Model
model =
  "Hello World"


-- UPDATE

type Msg = UpdateName String

update : Msg -> Model -> Model
update msg model =
  case msg of
    UpdateName name ->
      "Hello " ++ name


-- VIEW

view : Model -> Html Msg
view model =
  div []
    [ label [] [ text "Your Name: " ]
    , input [ onInput UpdateName ] []
    , div [] [ text model ]
    ]
