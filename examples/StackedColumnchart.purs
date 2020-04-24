module Examples.StackedColumnchart where

import Apexcharts (StackType(..), categories, createChart, data', fill, name, render, series, type', xaxis)
import Prelude (Unit, ($), (<>))

import Apexcharts.Chart (ChartType(..), chart, stackType, stacked)

import Apexcharts.Fill as F
import Data.Options ((:=))
import Effect (Effect)
  
main :: Effect Unit
main = render $ createChart "#chart" (
        chart := (type' := Bar <> stacked := true <> stackType := HundredPercent)
        <> series := [
          name := "PRODUCT A"
          <> data' := [44, 55, 41, 67, 22, 43, 21, 49],
          name := "PRODUCT B"
          <> data' := [13, 23, 20, 8, 13, 27, 33, 12],
          name := "PRODUCT C"
          <> data' := [11, 17, 15, 15, 21, 14, 15, 13]
        ]
        <> xaxis := (
          categories := ["2011 Q1", "2011 Q2", "2011 Q3", "2011 Q4", 
            "2012 Q1", "2012 Q2", "2012 Q3", "2012 Q4"
          ]
        )
        <> fill := F.opacity := 1.0
    )
