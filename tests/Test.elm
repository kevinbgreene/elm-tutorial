import Test.Routing.Parsers as ParserTest
import Test.Routing.Routes as RoutesTest
import ElmTest exposing (Test, suite)
import ElmTest


main : Program Never
main =
    ElmTest.runSuite allTests


allTests : Test
allTests =
  suite
    "All Tests"
    [ ParserTest.tests
    , RoutesTest.tests
    ]
