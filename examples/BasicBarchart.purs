module Examples.BasicBarchart where

import Prelude

import Apexcharts (ChartType(..), categories, chart, createChart, data', name, render, series, type', xaxis)
import Data.Options ((:=))
import Effect (Effect)
  
main :: Effect Unit
main =  render $ createChart "#chart" (
        chart := (type' := Bar) 
        <> series := [
          name := "sales"
          <> data' := [30,40,35,50,49,60,70,91,125]
        ]
        <> xaxis := (
          categories := [1991,1992,1993,1994,1995,1996,1997,1998,1999]
        )
    )