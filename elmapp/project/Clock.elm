module Main exposing (main)

import Html exposing (..)
import Date
import Time

main =
  program
    { init = init
    , view = view
    , update = update
    , subscriptions = subscriptions
    }

type alias Model = Maybe Date.Date

init: (Model, Cmd Msg)
init =
  ( Nothing
  , Cmd.none
  )

type Msg
  = Tick Time.Time

subscriptions : Model -> Sub Msg
subscriptions model =
  Time.every (100 * Time.millisecond) Tick

update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
  case msg of
    Tick t ->
      (Just (Date.fromTime t), Cmd.none)

view : Model -> Html Msg
view model =
  div [] <| -- everything to the right/indented is the 2nd arg
    case model of
      Just d ->
        [ text <| toString (Date.hour d)
        , text ":"
        , text <| String.padLeft 2 '0' (toString (Date.minute d))
        , text ":"
        , text <| String.padLeft 2 '0' (toString (Date.second d))
        ]

      Nothing ->
        [ text "don't know yet!" ]
