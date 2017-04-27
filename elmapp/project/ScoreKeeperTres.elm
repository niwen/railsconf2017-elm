module Main exposing (main)

import Html exposing (..)
import Html.Events exposing (onClick)

main =
  beginnerProgram
      { model = initialModel
      , view = view
      , update = update
      }

type alias Model = List Int
type Msg
  = AddPoints Int
  | Undo

initialModel : Model
initialModel =
  []

view : Model -> Html Msg

-- first arg is empty list
-- second arg is a list of html args
view model =
  div
    []
    [ button [ onClick (AddPoints 1) ] [ text "free" ]
    , button [ onClick (AddPoints 2) ] [ text "paint" ]
    , button [ onClick (AddPoints 3) ] [ text "downtown" ]
    , text (toString (List.sum model))
    , button [ onClick Undo ] [ text "whoops!" ]
    ]

update : Msg -> Model -> Model
update msg model =
  case msg of
    AddPoints int ->
      int :: model
    Undo ->
      List.drop 1 model
