module Commands exposing (..)

import Http
import Json.Decode as Decode
import Json.Decode.Pipeline exposing (decode, required)
import Msgs exposing (Msg)
import Models exposing(Item, Subitem)
import RemoteData exposing(WebData)

fetchItems : Cmd Msg
fetchItems =
  Http.get fetchItemsUrl itemsDecoder
    |> RemoteData.sendRequest
    |> Cmd.map Msgs.OnFetchItems

fetchItemsUrl : String
fetchItemsUrl =
  "http://localhost:4000/api/v1/items"

itemsDecoder : Decode.Decoder (List Item)
itemsDecoder =
  Decode.field "data" (Decode.list itemDecoder)

itemDecoder : Decode.Decoder Item
itemDecoder =
  decode Item
    |> required "name" Decode.string
    |> required "price" Decode.float
    |> required "id" Decode.int

fetchSubitems : Cmd Msg
fetchSubitems =
  Http.get fetchSubitemsUrl subitemsDecoder
    |> RemoteData.sendRequest
    |> Cmd.map Msgs.OnFetchSubitems

fetchSubitemsUrl : String
fetchSubitemsUrl =
  "http://localhost:4000/api/v1/subitems"

subitemsDecoder : Decode.Decoder (List Subitem)
subitemsDecoder =
  Decode.field "data" (Decode.list subitemDecoder)

subitemDecoder : Decode.Decoder Subitem
subitemDecoder =
  decode Subitem
    |> required "name" Decode.string
    |> required "item_id" Decode.int
    |> required "id" Decode.int
