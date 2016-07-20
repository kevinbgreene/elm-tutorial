module Test.Routing.Routes exposing (tests)


import ElmTest exposing (Test, suite, test, assertEqual)
import Routing.Routes exposing (..)


tests : Test
tests =
    suite "Routing.Routes.reverse"
        [ test "HomeRoute should reverse to '/'"
            <| assertEqual "/" (reverse HomeRoute)

        , test "NotFound should reverse to '/'"
            <| assertEqual "/" (reverse NotFound)

        , test "PostRoute 89 should reverse to '/post/89'"
            <| assertEqual "/post/89" (reverse (PostRoute 89))
        ]
