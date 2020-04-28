
module Apexcharts.PlotOptions.Heatmap where


import Apexcharts.PlotOptions (PlotOptions)
import Data.Functor.Contravariant (cmap)
import Data.Options (Option, Options, opt)
import Data.Options as Opt

data Heatmap

heatmap :: Option PlotOptions (Options Heatmap)
heatmap = cmap Opt.options (opt "heatmap")

radius :: Option Heatmap Number
radius = opt "radius"

enableShades :: Option Heatmap Boolean
enableShades = opt "enableShades"

shadeIntensity :: Option Heatmap Number
shadeIntensity = opt "shadeIntensity"

reverseNegativeShade :: Option Heatmap Boolean
reverseNegativeShade = opt "reverseNegativeShade"

distributed :: Option Heatmap Boolean
distributed = opt "distributed"

useFillColorAsStroke :: Option Heatmap Boolean
useFillColorAsStroke = opt "useFillColorAsStroke"

