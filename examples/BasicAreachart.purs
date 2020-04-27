module Examples.BasicAreachart where

import Prelude

import Apexcharts (createChart, render)
import Apexcharts.Axis (AxisType(..))
import Apexcharts.Axis as A
import Apexcharts.Chart (ChartType(..))
import Apexcharts.Chart as C
import Apexcharts.Chart.Zoom as Z
import Apexcharts.Commons (height)
import Apexcharts.DataLabels as DL
import Apexcharts.Mainstroke (Curve(..))
import Apexcharts.Mainstroke as S
import Apexcharts.Series as SE
import Data.Options ((:=))
import Effect (Effect)
  
main :: Effect Unit
main = render $ createChart "#chart" (
        C.chart := (C.type' := Area <> height := 350.0 <> Z.zooming := (Z.enabled := false)) 
        <> SE.series := [SE.name := "STOCK ABC" <> SE.data' := [31, 40, 28, 51, 42, 109, 100]]
        <> S.stroke := S.curve := Smooth
        <> DL.dataLabels := (DL.enabled := false) 
        <> A.xaxis := (A.type' := Datetime <> A.categories := ["2018-09-19T00:00:00.000Z", "2018-09-19T01:30:00.000Z", 
          "2018-09-19T02:30:00.000Z", "2018-09-19T03:30:00.000Z", "2018-09-19T04:30:00.000Z", 
          "2018-09-19T05:30:00.000Z", "2018-09-19T06:30:00.000Z"])
    )