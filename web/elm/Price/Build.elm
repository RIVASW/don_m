module Price.Build exposing (..)

import Models exposing(Item, Subitem, PriceItem)

build : List Subitem -> List Item -> List PriceItem
build subitems items =
  let
    selectSubitems item =List.filter (\ { itemId } -> itemId == item.id) subitems
  in
    List.concatMap (\ item -> priceItems item (selectSubitems item)) items

priceItems : Item -> List Subitem -> List PriceItem
priceItems item subitems =
  case subitems of
    [] -> [ priceItem item Nothing ]
    _ -> List.map (\ subitem -> (priceItem item (Just subitem))) subitems

priceItem : Item -> Maybe Subitem -> PriceItem
priceItem item maybeSubitem =
  case maybeSubitem of
    Nothing -> { name = item.name
               , index = { itemId = item.id, subitemId = Nothing }
               }
    Just subitem -> { name = (String.concat [ item.name, ": ", subitem.name])
                    , index = { itemId = item.id, subitemId = Just subitem.id }
                    }
