module Route exposing (..)

import Navigation
import UrlParser exposing (parsePath, oneOf, map, top, s, (</>), string)


type Route
    = Home
    | Users
    | Quest


type alias Model =
    Maybe Route


pathParser : UrlParser.Parser (Route -> a) a
pathParser =
    oneOf
        [ map Home top
        , map Quest (s "quest")
        , map Users (s "users")
        ]


init : Maybe Route -> List (Maybe Route)
init location =
    case location of
        Nothing ->
            [ Just Quest ]

        something ->
            [ something ]


urlFor : Route -> String
urlFor loc =
    case loc of
        Home ->
            "/"

        Users ->
            "/users"

        Quest ->
            "/quest"


locFor : Navigation.Location -> Maybe Route
locFor path =
    parsePath pathParser path
