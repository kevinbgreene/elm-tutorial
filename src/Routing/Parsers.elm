module Routing.Parsers exposing (urlParser, parse)


import UrlParser exposing (Parser, (</>), format, int, oneOf, s, string)
import Navigation
import String
import Routing.Routes exposing (..)


urlParser : Navigation.Parser Route
urlParser =
  Navigation.makeParser parse


parse : Navigation.Location -> Route
parse {pathname} =
  let
    path =
      if String.startsWith "/" pathname then
        String.dropLeft 1 pathname
      else
        pathname

  in
    case UrlParser.parse identity routeParser path of
      Err err -> NotFound

      Ok route -> route


-- PAGE PARSERS


routeParser : Parser (Route -> a) a
routeParser =
  oneOf
    [ format PostRoute postParser
    , format HomeRoute homeParser
    ]


postParser : Parser (Int -> a) a
postParser =
  s "post" </> int


homeParser : Parser a a
homeParser =
  oneOf
    [ (s "index.html")
    , (s "")
    ]
