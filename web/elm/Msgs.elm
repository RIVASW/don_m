module Msgs exposing (..)

import Models exposing(Item, Subitem, PriceItemIndex)
import RemoteData exposing (WebData)

type Msg
  = Toggle PriceItemIndex
  | OnFetchItems (WebData (List Item))
  | OnFetchSubitems (WebData (List Subitem))
