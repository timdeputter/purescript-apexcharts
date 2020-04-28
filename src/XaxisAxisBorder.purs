
module Apexcharts.Xaxis.AxisBorder where


import Apexcharts.Xaxis (Xaxis)
import Data.Functor.Contravariant (cmap)
import Data.Options (Option, Options, opt)
import Data.Options as Opt

data AxisBorder

axisBorder :: Option Xaxis (Options AxisBorder)
axisBorder = cmap Opt.options (opt "axisBorder")

show :: Option AxisBorder Boolean
show = opt "show"

color :: Option AxisBorder String
color = opt "color"

height :: Option AxisBorder Number
height = opt "height"

width :: Option AxisBorder String
width = opt "width"

offsetX :: Option AxisBorder Number
offsetX = opt "offsetX"

offsetY :: Option AxisBorder Number
offsetY = opt "offsetY"

