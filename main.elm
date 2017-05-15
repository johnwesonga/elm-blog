module Main exposing (..)

import Html exposing (..)
import Models exposing (..)
import Update exposing (..)
import Msgs exposing (..)
import Models exposing (..)
import Commands exposing (..)
import View exposing (..)


-- VIEW --


init : ( Model, Cmd Msg )
init =
    ( initialModel, fetchPosts )


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none


main : Program Never Model Msg
main =
    program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }
