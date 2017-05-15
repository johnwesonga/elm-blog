module Commands exposing (..)

import Http
import Json.Decode as Decode
import Json.Decode.Pipeline exposing (decode, required)
import Msgs exposing (Msg)
import Models exposing (..)
import RemoteData


fetchPosts : Cmd Msg
fetchPosts =
    Http.get fetchPostsUrl postsDecoder
        |> RemoteData.sendRequest
        |> Cmd.map Msgs.OnFetchPosts


fetchPostsUrl : String
fetchPostsUrl =
    "http://localhost:4000/posts"


postsDecoder : Decode.Decoder (List Post)
postsDecoder =
    Decode.list postDecoder


postDecoder : Decode.Decoder Post
postDecoder =
    decode Post
        |> required "id" Decode.int
        |> required "title" Decode.string
        |> required "body" Decode.string
        |> required "tags" Decode.string
