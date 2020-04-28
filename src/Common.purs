module Apexcharts.Common where
  

data FontWeightStr = 
    Normal 
    | Bold
    | Bolder
    | Lighter

data FontWeightNum = 
    N100
    | N200
    | N300
    | N400
    | N500
    | N600
    | N700
    | N800
    | N900


fontWeightToString :: FontWeightStr -> String
fontWeightToString = case _ of
    Normal  -> "normal" 
    Bold -> "bold"
    Bolder -> "bolder"
    Lighter -> "lighter"


fontWeightNumToInt :: FontWeightNum -> Int
fontWeightNumToInt = case _ of
    N100 -> 100
    N200 -> 200
    N300 -> 300
    N400 -> 400
    N500 -> 500
    N600 -> 600
    N700 -> 700
    N800 -> 800
    N900 -> 900