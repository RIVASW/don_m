module Main exposing (..)

import Html exposing (program)
import Html.Attributes exposing (class)
import Models exposing (Model, initialModel)
import View exposing (view)
import Update exposing (update)
import Msgs exposing (Msg)
import Commands exposing(fetchItems, fetchSubitems)

init : (Model, Cmd Msg)
init =
    (initialModel, Cmd.batch [ fetchItems, fetchSubitems ])

subscriptions: Model -> Sub Msg
subscriptions model =
  Sub.none

main =
  program
    { init = init
    , view = view
    , update = update
    , subscriptions = subscriptions
    }
