module Examples.Stackedchart where

import Prelude

import Apexcharts (colors, createChart, render)
import Apexcharts.Chart as C
import Apexcharts.Common as CC
import Apexcharts.DataLabels as DL
import Apexcharts.Fill as F
import Apexcharts.Fill.Gradient as FG
import Apexcharts.Stroke (Curve(..))
import Apexcharts.Stroke as S
import Apexcharts.Series as SE
import Apexcharts.Xaxis as X
import Data.Options ((:=))
import Effect (Effect)
  
main :: Effect Unit
main =  
  let 
    xaxis' = X.categories := [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
    chart' = C.type' := CC.Area <> C.height := 350.0 <> C.stacked := true
    series' = [
      SE.name := "STOCK A" <> SE.data' := [31, 40, 28, 51, 42, 109, 100, 80, 340, 123],
      SE.name := "STOCK B" <> SE.data' := [75, 543, 75, 97, 42, 4, 7, 43, 11, 34,235]
    ]
    dataLabels' = DL.enabled := false  
    stroke' = S.curve := Smooth
    
  in render $ createChart "#chart" (
        C.chart := chart' <> SE.series := series' <> S.stroke := stroke' 
        <> DL.dataLabels := dataLabels' 
        <> X.xaxis := xaxis' 
        <> colors := ["#008FFB", "#00E396", "#CED4DC"]
        <> F.fill := (F.type' := F.Gradient <> FG.gradient := (FG.opacityFrom := 0.6 <> FG.opacityTo := 0.8))
    )
