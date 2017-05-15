module Update exposing (..)

import Models exposing (..)
import Msgs exposing (..)


-- type Msg
--     = NoOp
--     | AddPost
--     | Cancel
--     | SetTitle String
--     | SetBody String
--     | EditPost Post
--     | OnFetchPosts (WebData (List Post))
-- update : Msg -> Model -> Model
-- update msg model =
--     case msg of
--         NoOp ->
--             model
--         AddPost ->
--             save model
--         Cancel ->
--             { model | title = "", body = "", tags = "" }
--         SetTitle title ->
--             Debug.log "SetTitle updated model"
--                 { model | title = title }
--         SetBody body ->
--             Debug.log "SetBody updated model"
--                 { model | body = body }
--         EditPost post ->
--             { model | title = post.title }
--         OnFetchPosts response ->
--             { model | posts = response }
-- save : Model -> Model
-- save model =
--     let
--         post =
--             Post (List.length model.posts) model.title model.body model.tags
--         newPost =
--             post :: model.posts
--     in
--         { model
--             | posts = newPost
--             , title = ""
--             , body = ""
--             , tags = ""
--         }


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp ->
            model ! []

        OnFetchPosts response ->
            ( { model | posts = response }, Cmd.none )

        Cancel ->
            model ! []

        AddPost ->
            model ! []
