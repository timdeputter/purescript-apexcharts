
module Apexcharts.Chart.Zoom.ZoomedArea.Stroke where


import Apexcharts.Chart.Zoom.ZoomedArea (ZoomedArea)
import Data.Functor.Contravariant (cmap)
import Data.Options (Option, Options, opt)
import Data.Options as Opt

data Stroke

stroke :: Option ZoomedArea (Options Stroke)
stroke = cmap Opt.options (opt "stroke")

color :: Option Stroke String
color = opt "color"

opacity :: Option Stroke Number
opacity = opt "opacity"

width :: Option Stroke Number
width = opt "width"

