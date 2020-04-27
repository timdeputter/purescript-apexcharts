module Apexcharts.Commons where


data OrientationType = X | Y | XY

orientationTypeToString :: OrientationType -> String
orientationTypeToString = case _ of
    X -> "x"
    Y -> "y"
    XY -> "xy"

