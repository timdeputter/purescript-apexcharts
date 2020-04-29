module Examples.Scatteredchart where

import Prelude

import Apexcharts (createChart, render)
import Apexcharts.Chart as C
import Apexcharts.Chart.Zoom as Z
import Apexcharts.Common as CC
import Apexcharts.Series as SE
import Apexcharts.Xaxis as X
import Apexcharts.Yaxis as Y
import Data.Options ((:=))
import Effect (Effect)
  
main :: Effect Unit
main = render $ createChart "#scatteredchart" (
      SE.series := [
         (SE.name := "SAMPLE A" <> SE.data' := [
            [16.4, 5.4], [21.7, 2.0], [25.4, 3.0], [19.0, 2.0], [10.9, 1.0], [13.6, 3.2], 
            [10.9, 7.4], [10.9, 0.0], [10.9, 8.2], [16.4, 0.0], [16.4, 1.8], 
            [13.6, 0.3], [13.6, 0.0], [29.9, 0.0], [27.1, 2.3], [16.4, 0.0], [13.6, 3.7],
            [10.9, 5.2], [16.4, 6.5], [10.9, 0.0], [24.5, 7.1], [10.9, 0.0], [8.1, 4.7], [19.0, 0.0], 
            [21.7, 1.8], [27.1, 0.0], [24.5, 0.0], [27.1, 0.0], [29.9, 1.5], [27.1, 0.8], [22.1, 2.0]
         ]),
         (SE.name := "SAMPLE B" <> SE.data' := [
           [36.4, 13.4], [1.7, 11.0], [5.4, 8.0], [9.0, 17.0], [1.9, 4.0], [3.6, 12.2], [1.9, 14.4], [1.9, 9.0], 
           [1.9, 13.2], [1.4, 7.0], [6.4, 8.8], [3.6, 4.3], [1.6, 10.0], [9.9, 2.0], [7.1, 15.0], [1.4, 0.0],
           [3.6, 13.7], [1.9, 15.2], [6.4, 16.5], [0.9, 10.0], [4.5, 17.1], [10.9, 10.0], [0.1, 14.7], [9.0, 10.0], 
           [12.7, 11.8], [2.1, 10.0], [2.5, 10.0], [27.1, 10.0], [2.9, 11.5], [7.1, 10.8], [2.1, 12.0]
         ])
      ]
      <> C.chart := (C.type' := CC.Scatter <> C.height := 350 <> Z.zoom := (Z.enabled := true <> Z.type' := Z.XY))       
      <> X.xaxis := (X.tickAmount := 10.0)
      <> Y.yaxis := (Y.tickAmount := 10.0)
   )