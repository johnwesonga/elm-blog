module Msgs exposing (..)

import Models exposing (..)
import RemoteData exposing (WebData)


type Msg
    = NoOp
    | OnFetchPosts (WebData (List Post))
    | Cancel
    | AddPost
