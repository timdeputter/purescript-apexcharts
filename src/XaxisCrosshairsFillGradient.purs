
module Apexcharts.Xaxis.Crosshairs.Fill.Gradient where


import Apexcharts.Xaxis.Crosshairs.Fill (Fill)
import Data.Functor.Contravariant (cmap)
import Data.Options (Option, Options, opt)
import Data.Options as Opt

data Gradient

gradient :: Option Fill (Options Gradient)
gradient = cmap Opt.options (opt "gradient")

colorFrom :: Option Gradient String
colorFrom = opt "colorFrom"

colorTo :: Option Gradient String
colorTo = opt "colorTo"

stops :: Option Gradient (Array Number)
stops = opt "stops"

opacityFrom :: Option Gradient Number
opacityFrom = opt "opacityFrom"

opacityTo :: Option Gradient Number
opacityTo = opt "opacityTo"

