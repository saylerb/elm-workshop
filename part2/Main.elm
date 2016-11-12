module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import String
import List
import Char
import Regex


model =
    { result =
        { id = 1
        , name = "TheSeamau5/elm-checkerboardgrid-tutorial"
        , stars = 66
        }
    }


main =
    let
        elmHubHeader =
            header []
                [ h1 [] [ text "ElmHub" ]
                , span [ class "tagline" ] [ text "Like GitHub, but for Elm things." ]
                ]
    in
        div [ class "content" ]
            [ elmHubHeader
            , ul [ class "results" ]
                [ li []
                    [ span [ class "star-count" ] [ text (toString model.result.stars) ]
                    , a [ href "https://github.com/" ] [ text (formatName model.result.name) ]
                    ]
                ]
            ]


formatName : String -> String
formatName name =
    removePrefix name
        |> String.split "-"
        |> List.map capitalize
        |> String.join " "


removePrefix : String -> String
removePrefix =
    Regex.replace Regex.All (Regex.regex "^[^\\/]*\\/") (\_ -> "")


capitalize : String -> String
capitalize string =
    case String.uncons string of
        Nothing ->
            ""

        Just ( head, tail ) ->
            String.cons (Char.toUpper head) tail
