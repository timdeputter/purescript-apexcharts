module Examples.Donutchart where

import Prelude

import Apexcharts (createChart, render)
import Apexcharts.Chart as C
import Apexcharts.Common as CC
import Apexcharts.Series as SE

import Data.Options ((:=))
import Effect (Effect)
  
main :: Effect Unit
main = render $ createChart "#donutchart" (
        C.chart := (C.type' := CC.Donut)
        <> SE.series := [44, 55, 41, 17, 15]
  )
