module View exposing (..)

import Html exposing (Html, div, text, h1)
import Msgs exposing (Msg)
import Models exposing (Model)
import Posts.List


view : Model -> Html Msg
view model =
    div []
        [ h1 [] [ text "My Blog" ]
        , page model
        ]


page : Model -> Html Msg
page model =
    Posts.List.view model.posts
