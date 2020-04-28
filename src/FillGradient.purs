
module Apexcharts.Fill.Gradient where


import Apexcharts.Fill (Fill)
import Data.Functor.Contravariant (cmap)
import Data.Options (Option, Options, opt)
import Data.Options as Opt

data Gradient

gradient :: Option Fill (Options Gradient)
gradient = cmap Opt.options (opt "gradient")

shade :: Option Gradient String
shade = opt "shade"

type' :: Option Gradient String
type' = opt "type"

shadeIntensity :: Option Gradient Number
shadeIntensity = opt "shadeIntensity"

gradientToColors :: Option Gradient (Array String)
gradientToColors = opt "gradientToColors"

inverseColors :: Option Gradient Boolean
inverseColors = opt "inverseColors"

opacityFrom :: Option Gradient Number
opacityFrom = opt "opacityFrom"

opacityTo :: Option Gradient Number
opacityTo = opt "opacityTo"

stops :: Option Gradient (Array Number)
stops = opt "stops"

