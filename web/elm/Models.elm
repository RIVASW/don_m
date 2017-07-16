module Models exposing (..)

import RemoteData exposing(WebData)

type alias Item =
  { name : String
  , price : Float
  , id : Int
  }

type alias Subitem =
  { name : String
  , itemId : Int
  , id : Int
  }

type alias PriceItemIndex =
  { itemId : Int
  , subitemId : Maybe Int
  }

type alias PriceItem =
  { name : String
  , index : PriceItemIndex
  }

type alias Model =
  { items : WebData (List Item)
  , subitems : WebData (List Subitem)
  , dailyList : List PriceItemIndex
  , price : WebData (List PriceItem)
  }

initialModel: Model
initialModel =
  { items = RemoteData.Loading
      --[ { name = "макаронс", price = 60, id = 1 }
      --, { name = "капкейки", price = 100, id = 2 }
      --, { name = "трайфлы", price = 120, id = 3 }
      --, { name = "маффины", price = 40, id = 4 }
      --, { name = "ягодные тарты", price = 120, id = 5 }
      --, { name = "мини-чизкейки малиновые и шоколадные", price = 160, id = 6 }
      --, { name = "мини-чизкейки классические", price = 150, id = 7 }
      --, { name = "картошка медовая и классическая", price = 60, id = 8 }
      --]
  , subitems = RemoteData.Loading
      --[ { name = "дорблю-груша", itemId = 1, id = 1 }
      --, { name = "баунти", itemId = 1, id = 2 }
      --, { name = "кокос", itemId = 1, id = 3 }
      --, { name = "малиновый чизкейк", itemId = 1, id = 4 }
      --, { name = "смородина", itemId = 1, id = 5 }
      --, { name = "лимон", itemId = 1, id = 6 }
      --, { name = "пинаколада", itemId = 1, id = 7 }
      --, { name = "лимон-пралине", itemId = 1, id = 8 }
      --, { name = "шоколадные", itemId = 2, id = 9 }
      --, { name = "красный бархат", itemId = 2, id = 10 }
      --, { name = "ванильные", itemId = 2, id = 11 }
      --, { name = "наполеон", itemId = 3, id = 12 }
      --, { name = "сникерс и тирамису", itemId = 3, id = 13 }
      --]
  , dailyList = []
  , price = RemoteData.Loading
  }
