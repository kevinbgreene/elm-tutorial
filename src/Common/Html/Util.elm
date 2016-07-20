module Common.Html.Util exposing (linkAttrs)


import Common.Events.Util exposing (onClick)
import Html exposing (Attribute)
import Html.Attributes exposing (class, href)


type alias Url =
  String

type alias ClassName =
  String


linkAttrs : ClassName -> msg -> Url -> List (Attribute msg)
linkAttrs name message path =
  [ onClick message
  , href path
  , class name
  ]
