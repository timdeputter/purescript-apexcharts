module Examples.BasicBarchart where

import Prelude

import Apexcharts (createChart, render)
import Apexcharts.Chart as C
import Apexcharts.Common as CC
import Apexcharts.Series as SE
import Apexcharts.Xaxis as X
import Data.Options ((:=))
import Effect (Effect)
  
main :: Effect Unit
main =  render $ createChart "#chart" (
        C.chart := (C.type' := CC.Bar) 
        <> SE.series := [
          SE.name := "sales"
            <> SE.data' := [30,40,35,50,49,60,70,91,125]
        ]
        <> X.xaxis := (
          X.categories := [1991,1992,1993,1994,1995,1996,1997,1998,1999]
        )
    )