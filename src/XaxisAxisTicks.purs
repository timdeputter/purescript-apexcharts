
module Apexcharts.Xaxis.AxisTicks where


import Apexcharts.Xaxis (Xaxis)
import Data.Functor.Contravariant (cmap)
import Data.Options (Option, Options, opt)
import Data.Options as Opt

data AxisTicks

axisTicks :: Option Xaxis (Options AxisTicks)
axisTicks = cmap Opt.options (opt "axisTicks")

show :: Option AxisTicks Boolean
show = opt "show"

borderType :: Option AxisTicks String
borderType = opt "borderType"

color :: Option AxisTicks String
color = opt "color"

height :: Option AxisTicks Number
height = opt "height"

offsetX :: Option AxisTicks Number
offsetX = opt "offsetX"

offsetY :: Option AxisTicks Number
offsetY = opt "offsetY"

