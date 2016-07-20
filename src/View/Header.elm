module View.Header exposing (view)


import Common.Events.Util exposing (onClick)
import Common.Html.Util exposing (linkAttrs)
import Html exposing (Html, Attribute, text, a, header)
import Html.Attributes exposing (class, href)
import Routing.Routes as Routing
import Routing.Routes exposing (..)
import Messages exposing (Msg(..))


view : Html Msg
view =
  let
    homePath =
      Routing.reverse HomeRoute

  in
    header
      [ class "main-header"
      ]
      [ a (headerLinkAttrs ShowHome homePath) [ text "Home" ]
      ]


headerLinkAttrs : Msg -> String -> List (Attribute Msg)
headerLinkAttrs = linkAttrs "nav-link"
