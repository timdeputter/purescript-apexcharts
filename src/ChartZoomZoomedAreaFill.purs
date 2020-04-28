
module Apexcharts.Chart.Zoom.ZoomedArea.Fill where


import Apexcharts.Chart.Zoom.ZoomedArea (ZoomedArea)
import Data.Functor.Contravariant (cmap)
import Data.Options (Option, Options, opt)
import Data.Options as Opt

data Fill

fill :: Option ZoomedArea (Options Fill)
fill = cmap Opt.options (opt "fill")

color :: Option Fill String
color = opt "color"

opacity :: Option Fill Number
opacity = opt "opacity"

