module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)


-- MODEL --


type alias Model =
    { posts : List Post
    , title : String
    , body : String
    , tags : String
    }


type alias Post =
    { id : Int
    , title : String
    , body : String
    , tags : String
    }


initModel : Model
initModel =
    { posts = []
    , title = ""
    , body = ""
    , tags = ""
    }



-- UPDATE --


type Msg
    = NoOp
    | AddPost
    | Cancel
    | SetTitle String
    | SetBody String
    | EditPost Post


update : Msg -> Model -> Model
update msg model =
    case msg of
        NoOp ->
            model

        AddPost ->
            save model

        Cancel ->
            { model | title = "", body = "", tags = "" }

        SetTitle title ->
            Debug.log "SetTitle updated model"
                { model | title = title }

        SetBody body ->
            Debug.log "SetBody updated model"
                { model | body = body }

        EditPost post ->
            { model | title = post.title }


save : Model -> Model
save model =
    let
        post =
            Post (List.length model.posts) model.title model.body model.tags

        newPost =
            post :: model.posts
    in
        { model
            | posts = newPost
            , title = ""
            , body = ""
            , tags = ""
        }



-- VIEW --


blogPostForm : Model -> Html Msg
blogPostForm model =
    Html.form [ onSubmit AddPost ]
        [ label [ for "title-field" ] [ text "Title: " ]
        , input
            [ type_ "text"
            , placeholder "Add Title"
            , onInput SetTitle
            , value model.title
            ]
            []
        , label [ for "body-field" ] [ text "Body: " ]
        , textarea [ cols 50, rows 30, value model.body, onInput SetBody ] [ text "" ]
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



-- blogPostList : Model -> Html Msg
-- blogPostList model =


view : Model -> Html Msg
view model =
    div
        [ class "" ]
        [ h1 [] [ text "My Blog" ]
        , blogPostForm model
        ]


main : Program Never Model Msg
main =
    Html.beginnerProgram
        { model = initModel
        , view = view
        , update = update
        }
