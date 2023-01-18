module Examples.Piechart where

import Prelude

import Apexcharts (createChart, labels, render)
import Apexcharts.Chart as C
import Apexcharts.Common as CC
import Apexcharts.Series as SE

import Data.Options ((:=))
import Effect (Effect)
  
main :: Effect Unit
main = render =<< createChart "#piechart" (
        C.chart := (C.type' := CC.Pie <> C.height := 380.0)
        <> SE.series := [44, 55, 13, 43, 22]
        <> labels := ["Team A", "Team B", "Team C", "Team D", "Team E"]
  )

