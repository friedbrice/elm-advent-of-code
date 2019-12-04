import Day01
import Day02
import Day03
import Day04
import Day05
import Day06
import Day07
import Day08
import Day09
import Day10
import Day11
import Day12
import Day13
import Day14
import Day15
import Day16
import Day17
import Day18
import Day19
import Day20
import Day21
import Day22
import Day23
import Day24
import Day25

import Html exposing (..)

import Bootstrap.CDN as CDN
import Bootstrap.Grid as Grid
import Bootstrap.Grid.Row as Row
import Bootstrap.Grid.Col as Col

import Browser
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)

type Day
  = D01 | D02 | D03 | D04 | D05
  | D06 | D07 | D08 | D09 | D10
  | D11 | D12 | D13 | D14 | D15
  | D16 | D17 | D18 | D19 | D20
  | D21 | D22 | D23 | D24 | D25

type Message = SetDay Day | SetInput String | Solve

type alias Model =
  { day : Day
  , input : String
  , output1 : String
  , output2 : String
  }

main = Browser.sandbox
  { init = Model D01 "<INPUT>" "<OUTPUT_1>" "<OUTPUT_2>"
  , update = update
  , view = view
  }

update : Message -> Model -> Model
update action state = case action of
  SetDay newDay -> { state | day = newDay }
  SetInput newInput -> { state | input = newInput }
  Solve ->
    let
      (newOutput1, newOutput2) = dispatch state.day state.input
    in
    { state | output1 = newOutput1, output2 = newOutput2 }

dispatch : Day -> String -> (String, String)
dispatch day = case day of
  D01 -> Day01.solve
  D02 -> Day02.solve
  D03 -> Day03.solve
  D04 -> Day04.solve
  D05 -> Day05.solve
  D06 -> Day06.solve
  D07 -> Day07.solve
  D08 -> Day08.solve
  D09 -> Day09.solve
  D10 -> Day10.solve
  D11 -> Day11.solve
  D12 -> Day12.solve
  D13 -> Day13.solve
  D14 -> Day14.solve
  D15 -> Day15.solve
  D16 -> Day16.solve
  D17 -> Day17.solve
  D18 -> Day18.solve
  D19 -> Day19.solve
  D20 -> Day20.solve
  D21 -> Day21.solve
  D22 -> Day22.solve
  D23 -> Day23.solve
  D24 -> Day24.solve
  D25 -> Day25.solve

view : Model -> Html Message
view model = div []
  [
    CDN.stylesheet
  ,
    Grid.row
      [ Row.centerXs ]
      [ Grid.col [ Col.xs9 ] (heading model) ]
  ,
    Grid.row
      [ Row.centerXs ]
      [
        Grid.col [ Col.xs2 ] (sidebar model)
      ,
        Grid.col [ Col.xs7 ]
        [
          Grid.row [] [ Grid.col [] (inputPane model) ]
        ,
          Grid.row [] [ Grid.col [] (output1Pane model) ]
        ,
          Grid.row [] [ Grid.col [] (output2Pane model) ]
        ]
      ]
  ]

heading : Model -> List (Html Message)
heading _ = [ h1 [] [ text "Advent of Code 2019 - Elm" ] ]

sidebar : Model -> List (Html Message)
sidebar model =
  [
    Html.map SetDay <| radiolist "day" model.day
      [ ( "Day 1", D01)
      , ( "Day 2", D02)
      , ( "Day 3", D03)
      , ( "Day 4", D04)
      , ( "Day 5", D05)
      , ( "Day 6", D06)
      , ( "Day 7", D07)
      , ( "Day 8", D08)
      , ( "Day 9", D09)
      , ("Day 10", D10)
      , ("Day 11", D11)
      , ("Day 12", D12)
      , ("Day 13", D13)
      , ("Day 14", D14)
      , ("Day 15", D15)
      , ("Day 16", D16)
      , ("Day 17", D17)
      , ("Day 18", D18)
      , ("Day 19", D19)
      , ("Day 20", D20)
      , ("Day 21", D21)
      , ("Day 22", D22)
      , ("Day 23", D23)
      , ("Day 24", D24)
      , ("Day 25", D25)
      ]
  ,
    Html.button [ onClick Solve ] [ text "Solve!" ]
  ]

inputPane : Model -> List (Html Message)
inputPane model =
  [
    div [] [ strong [] [ text "Input:" ] ]
  ,
    textarea
      [ cols 40, rows 12, onInput SetInput ]
      [ text model.input ]
  ]

output1Pane : Model -> List (Html Message)
output1Pane model =
  [
    div [] [ strong [] [ text "Part 1 Solution:" ] ]
  ,
    textarea
      [ cols 40, rows 4, readonly True ]
      [ text model.output1 ]
  ]

output2Pane : Model -> List (Html Message)
output2Pane model =
  [
    div [] [ strong [] [ text "Part 2 Solution:" ] ]
  ,
    textarea
      [ cols 40, rows 4, readonly True ]
      [ text model.output2 ]
  ]

radiolist : String -> a -> List (String, a) -> Html a
radiolist fieldName selected options =
  let
    mkbutton (label, option) =
      div []
        [ input
          [ type_ "radio"
          , name fieldName
          , onClick option
          , checked (option == selected)
          ]
          []
        , text label
        ]
  in
  div [] (List.map mkbutton options)
