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
type Msg = AddPoints Int

initialModel : Model
initialModel =
  0

view : Model -> Html Msg

-- first arg is empty list
-- second arg is a list of html args
view model =
  div
    []
    [ button [ onClick (AddPoints 1) ] [ text "free" ]
    , button [ onClick (AddPoints 2) ] [ text "paint" ]
    , button [ onClick (AddPoints 3) ] [ text "downtown" ]
    , text (toString model)
    ]

update : Msg -> Model -> Model
update msg model =
  case msg of
    AddPoints int ->
      model + int
