module Price.List exposing (..)

import Models exposing(PriceItem, PriceItemIndex)
import Msgs exposing(Msg)
import Html exposing (Html, div, h3, text)
import Html.Attributes exposing (class)
import Html.Events exposing(onClick)
import RemoteData exposing(WebData)

view : WebData (List PriceItem) -> List PriceItemIndex -> List (Html Msg)
view price dailyList =
  case price of
    RemoteData.NotAsked ->
      [ text "Initialising." ]

    RemoteData.Loading ->
      [ text "Loading..." ]

    RemoteData.Failure err ->
      [ text ("Error: " ++ toString err) ]

    RemoteData.Success items ->
      viewItems items dailyList

viewItems: List PriceItem -> List PriceItemIndex -> List (Html Msg)
viewItems items dailyList =
  let
    selected item = List.any (\ index -> item.index == index) dailyList
  in
    List.map (\ item -> priceItem (selected item) item) items

priceItem : Bool -> PriceItem -> Html Msg
priceItem selected item =
  let
    className =
      case selected of
        True -> "rectangle-box selected"
        False -> "rectangle-box"
  in
    div [ class className, onClick (Msgs.Toggle item.index) ]
        [ div [ class "rectangle-content" ]
              [ div []
                    [ h3 [] [ text item.name ] ]
              ]
        ]
