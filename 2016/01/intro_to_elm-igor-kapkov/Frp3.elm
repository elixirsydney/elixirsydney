module Frp3 (..) where

import Graphics.Element exposing (..)
import Mouse


main : Signal Element
main =
  Signal.map show lastPositions


lastPositions : Signal (List ( Int, Int ))
lastPositions =
  Signal.map (List.take 3) allPositions


allPositions : Signal (List ( Int, Int ))
allPositions =
  Signal.foldp (\clk count -> clk :: count) [] positionAfterClick


positionAfterClick : Signal ( Int, Int )
positionAfterClick =
  Signal.sampleOn Mouse.clicks Mouse.position
