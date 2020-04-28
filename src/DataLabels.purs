
module Apexcharts.DataLabels where


import Apexcharts (Apexoptions)
import Data.Functor.Contravariant (cmap)
import Data.Options (Option, Options, opt)
import Data.Options as Opt

data DataLabels


data TextAnchor = Start
    | Middle
    | End


textAnchorToString :: TextAnchor -> String
textAnchorToString = case _ of
    Start -> "start"
    Middle -> "middle"
    End -> "end"

dataLabels :: Option Apexoptions (Options DataLabels)
dataLabels = cmap Opt.options (opt "dataLabels")

enabled :: Option DataLabels Boolean
enabled = opt "enabled"

enabledOnSeries :: Option DataLabels (Array Number)
enabledOnSeries = opt "enabledOnSeries"

textAnchor :: Option DataLabels TextAnchor
textAnchor = cmap textAnchorToString (opt "textAnchor")

distributed :: Option DataLabels Boolean
distributed = opt "distributed"

offsetX :: Option DataLabels Number
offsetX = opt "offsetX"

offsetY :: Option DataLabels Number
offsetY = opt "offsetY"

