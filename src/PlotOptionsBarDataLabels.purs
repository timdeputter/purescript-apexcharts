
module Apexcharts.PlotOptions.Bar.DataLabels where


import Apexcharts.PlotOptions.Bar (Bar)
import Data.Functor.Contravariant (cmap)
import Data.Options (Option, Options, opt)
import Data.Options as Opt

data DataLabels

dataLabels :: Option Bar (Options DataLabels)
dataLabels = cmap Opt.options (opt "dataLabels")

position :: Option DataLabels String
position = opt "position"

maxItems :: Option DataLabels Number
maxItems = opt "maxItems"

hideOverflowingLabels :: Option DataLabels Boolean
hideOverflowingLabels = opt "hideOverflowingLabels"

orientation :: Option DataLabels String
orientation = opt "orientation"

