module Update exposing (..)

import Msgs exposing(Msg)
import Models exposing(Model, PriceItemIndex, PriceItem)
import RemoteData exposing(WebData)
import Price.Build
import Http

update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
  case msg of
    Msgs.Toggle index ->
      updateDailyList index model

    Msgs.OnFetchItems response ->
      maybeUpdatePrice { model | items = response }

    Msgs.OnFetchSubitems response ->
      maybeUpdatePrice { model | subitems = response }

updateDailyList : PriceItemIndex -> Model -> (Model, Cmd Msg)
updateDailyList index model =
  case (List.member index model.dailyList) of
    True -> removeFromDailyList index model
    False -> addToDailyList index model

addToDailyList : PriceItemIndex -> Model -> (Model, Cmd Msg)
addToDailyList index model =
  ( { model | dailyList = index :: model.dailyList }
  , Cmd.none
  )

removeFromDailyList : PriceItemIndex -> Model -> (Model, Cmd Msg)
removeFromDailyList index model =
  ( { model | dailyList = List.filter (\ current -> current /= index) model.dailyList }
  , Cmd.none
  )

maybeUpdatePrice : Model -> (Model, Cmd Msg)
maybeUpdatePrice model =
  ( { model | price = maybeBuildPrice model }
  , Cmd.none
  )

maybeBuildPrice : Model -> WebData (List PriceItem)
maybeBuildPrice model =
  RemoteData.map2 Price.Build.build model.subitems model.items

