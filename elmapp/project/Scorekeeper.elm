module Main exposing (main)

import Html exposing (..)
import Html.Events exposing (onClick)

main =
  beginnerProgram
      { model = initialModel
      , view = view
      , update = update
      }

type alias Model = Int
type Msg
  = FreeThrow
  | JumpShot
  | ThreePointer

initialModel : Model
initialModel =
  0

view : Model -> Html Msg

-- first arg is empty list
-- second arg is a list of html args
view model =
  div
    []
    [ button [ onClick FreeThrow ] [ text "free" ]
    , button [ onClick JumpShot ] [ text "paint" ]
    , button [ onClick ThreePointer ] [ text "downtown" ]
    , text (toString model)
    ]

update : Msg -> Model -> Model
update msg model =
  case msg of
    FreeThrow ->
      model + 1
    JumpShot ->
      model + 2
    ThreePointer ->
      model + 3
