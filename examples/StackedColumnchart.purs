module Examples.StackedColumnchart where

import Apexcharts (createChart, render)

import Apexcharts.Chart as C
import Apexcharts.Fill as F
import Apexcharts.Series as SE
import Apexcharts.Xaxis as X
import Data.Options ((:=))
import Effect (Effect)
import Prelude (Unit, ($), (<>))
  
main :: Effect Unit
main = render $ createChart "#chart" (
        C.chart := (C.type' := C.Bar <> C.stacked := true <> C.stackType := C.HundertPercent)
        <> SE.series := [
          SE.name := "PRODUCT A"
          <> SE.data' := [44, 55, 41, 67, 22, 43, 21, 49],
          SE.name := "PRODUCT B"
          <> SE.data' := [13, 23, 20, 8, 13, 27, 33, 12],
          SE.name := "PRODUCT C"
          <> SE.data' := [11, 17, 15, 15, 21, 14, 15, 13]
        ]
        <> X.xaxis := (
          X.categories := ["2011 Q1", "2011 Q2", "2011 Q3", "2011 Q4", 
            "2012 Q1", "2012 Q2", "2012 Q3", "2012 Q4"
          ]
        )
        <> F.fill := F.opacity := 1.0
    )
