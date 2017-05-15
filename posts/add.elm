module Posts.Add exposing (..)

import Html exposing (..)
import Msgs exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Models exposing (..)


blogPostForm : Model -> Html Msg
blogPostForm model =
    Html.form [ onSubmit AddPost ]
        [ label [ for "title-field" ] [ text "Title: " ]
        , input
            [ type_ "text"
            , placeholder "Add Title"
            ]
            []
        , label [ for "body-field" ] [ text "Body: " ]
        , textarea [ cols 50, rows 30, value model.body ] [ text "" ]
        , label [ for "tags-field" ] [ text "Tags: " ]
        , input
            [ type_ "text"
            , placeholder "Add Tags"
            , value model.tags
            ]
            []
        , button [ type_ "submit" ] [ text "Save" ]
        , button [ type_ "button", onClick Cancel ] [ text "Cancel" ]
        ]
