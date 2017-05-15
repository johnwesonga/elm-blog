module Models exposing (..)

import RemoteData exposing (WebData)


-- MODEL --
-- type alias Model =
--     { posts : List Post
--     , title : String
--     , body : String
--     , tags : String
--     }


type alias Post =
    { id : Int
    , title : String
    , body : String
    , tags : String
    }



-- initModel : Model
-- initModel =
--     { posts = []
--     , title = ""
--     , body = ""
--     , tags = ""
--     }


type alias Model =
    { posts : WebData (List Post)
    , title : String
    }


initialModel : Model
initialModel =
    { posts = RemoteData.Loading
    , title = ""
    }
