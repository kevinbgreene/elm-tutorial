#!/bin/sh

elm-package install -y
elm-make --yes Test.elm --output=test.js
node -r ./mock-document.js ./test.js
