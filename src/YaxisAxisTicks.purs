
module Apexcharts.Yaxis.AxisTicks where


import Apexcharts.Yaxis (Yaxis)
import Data.Functor.Contravariant (cmap)
import Data.Options (Option, Options, opt)
import Data.Options as Opt

data AxisTicks

axisTicks :: Option Yaxis (Options AxisTicks)
axisTicks = cmap Opt.options (opt "axisTicks")

show :: Option AxisTicks Boolean
show = opt "show"

borderType :: Option AxisTicks String
borderType = opt "borderType"

color :: Option AxisTicks String
color = opt "color"

width :: Option AxisTicks Number
width = opt "width"

offsetX :: Option AxisTicks Number
offsetX = opt "offsetX"

offsetY :: Option AxisTicks Number
offsetY = opt "offsetY"

