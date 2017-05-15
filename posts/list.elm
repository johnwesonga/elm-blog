module Posts.List exposing (..)

import Html exposing (..)
import Msgs exposing (Msg)
import Models exposing (Post)
import RemoteData exposing (WebData)


view : WebData (List Post) -> Html Msg
view response =
    div []
        [ maybeList response
        ]


maybeList : WebData (List Post) -> Html Msg
maybeList response =
    case response of
        RemoteData.NotAsked ->
            text ""

        RemoteData.Loading ->
            text "Loading..."

        RemoteData.Success posts ->
            postsList posts

        RemoteData.Failure error ->
            text (toString error)


postsList : List Post -> Html Msg
postsList posts =
    posts
        |> List.sortBy .title
        |> List.map post
        |> ul []


post : Post -> Html Msg
post post =
    li []
        [ text post.title
        , text post.body
        ]
