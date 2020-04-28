
module Apexcharts.Yaxis.AxisBorder where


import Apexcharts.Yaxis (Yaxis)
import Data.Functor.Contravariant (cmap)
import Data.Options (Option, Options, opt)
import Data.Options as Opt

data AxisBorder

axisBorder :: Option Yaxis (Options AxisBorder)
axisBorder = cmap Opt.options (opt "axisBorder")

show :: Option AxisBorder Boolean
show = opt "show"

color :: Option AxisBorder String
color = opt "color"

offsetX :: Option AxisBorder Number
offsetX = opt "offsetX"

offsetY :: Option AxisBorder Number
offsetY = opt "offsetY"

