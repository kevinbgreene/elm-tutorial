module View.Header exposing (view)


import Common.Events.Util exposing (onClick)
import Common.Html.Util exposing (linkAttrs)
import Html exposing (Html, Attribute, text, a, header, nav)
import Html.Attributes exposing (class, href)
import Routing.Routes as Routing
import Routing.Routes exposing (..)
import Messages exposing (Msg(..))


view : Html Msg
view =
  header[ class "main-header" ] [ headerNav ]


headerNav : Html Msg
headerNav =
  let
    homePath =
      Routing.reverse HomeRoute

  in
    nav [ class "header-nav" ]
      [ a (headerLinkAttrs ShowHome homePath) [ text "Home" ] ]


headerLinkAttrs : Msg -> String -> List (Attribute Msg)
headerLinkAttrs =
  linkAttrs "nav-link"
