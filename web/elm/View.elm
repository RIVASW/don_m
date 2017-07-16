module View exposing (..)

import Html exposing (Html, div)
import Html.Attributes exposing (class)
import Models exposing (Model)
import Msgs exposing (Msg)
import Price.List

view : Model -> Html Msg
view { dailyList, price } =
  div [ class "col-md-12" ]
      [ div [ class "col-md-4" ] []
      , div [ class "col-md-4" ] (Price.List.view price dailyList)
      , div [ class "col-md-4" ] []
      ]

