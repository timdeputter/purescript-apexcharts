module Examples.Timelinechart where

import Prelude

import Apexcharts (createChart, render)
import Apexcharts.Chart as C
import Apexcharts.Grid as G
import Apexcharts.Grid.Row as GR
import Apexcharts.PlotOptions as P
import Apexcharts.PlotOptions.Bar as PB
import Apexcharts.Series as SE
import Apexcharts.Xaxis as X
import Data.Options ((:=))
import Effect (Effect)
  
main :: Effect Unit
main = render $ createChart "#timelinechart" (
        SE.series := [SE.data' := [
            (SE.x := "Analysis" <> SE.y := [1551225600000.0, 1551657600000.0] <> SE.fillColor := "#008FFB"),
            (SE.x := "Design" <> SE.y := [1551657600000.0, 1552003200000.0] <> SE.fillColor := "#00E396"),
            (SE.x := "Coding" <> SE.y := [1551916800000.0, 1552176000000.0] <> SE.fillColor := "#775DD0"),
            (SE.x := "Testing" <> SE.y := [1552003200000.0, 1552348800000.0] <> SE.fillColor := "#FEB019"),
            (SE.x := "Deployment" <> SE.y := [1552348800000.0, 1552780800000.0] <> SE.fillColor := "#FF4560")
          ]
        ]
        <> C.chart := (C.height := 350 <> C.type' := C.RangeBar)
        <> P.plotOptions := (
          PB.bar := (
            PB.horizontal := true 
            <> PB.distributed := true 
          )
        )
        <> X.xaxis := (
          X.type' := X.Datetime
        )
        <> G.grid := (
          GR.row := (
            GR.colors := ["#f3f4f5", "#fff"]
            <> GR.opacity := 1.0
          )
        )
    )