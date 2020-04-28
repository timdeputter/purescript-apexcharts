
module Apexcharts.PlotOptions.RadialBar.Track where


import Apexcharts.PlotOptions.RadialBar (RadialBar)
import Data.Functor.Contravariant (cmap)
import Data.Options (Option, Options, opt)
import Data.Options as Opt

data Track

track :: Option RadialBar (Options Track)
track = cmap Opt.options (opt "track")

show :: Option Track Boolean
show = opt "show"

startAngle :: Option Track Number
startAngle = opt "startAngle"

endAngle :: Option Track Number
endAngle = opt "endAngle"

background :: Option Track String
background = opt "background"

strokeWidth :: Option Track String
strokeWidth = opt "strokeWidth"

opacity :: Option Track Number
opacity = opt "opacity"

margin :: Option Track Number
margin = opt "margin"

