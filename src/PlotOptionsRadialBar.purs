
module Apexcharts.PlotOptions.RadialBar where


import Apexcharts.PlotOptions (PlotOptions)
import Data.Functor.Contravariant (cmap)
import Data.Options (Option, Options, opt)
import Data.Options as Opt

data RadialBar

radialBar :: Option PlotOptions (Options RadialBar)
radialBar = cmap Opt.options (opt "radialBar")

inverseOrder :: Option RadialBar Boolean
inverseOrder = opt "inverseOrder"

startAngle :: Option RadialBar Number
startAngle = opt "startAngle"

endAngle :: Option RadialBar Number
endAngle = opt "endAngle"

offsetX :: Option RadialBar Number
offsetX = opt "offsetX"

offsetY :: Option RadialBar Number
offsetY = opt "offsetY"

