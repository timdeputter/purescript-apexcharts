
module Apexcharts.Yaxis.Crosshairs.Stroke where


import Apexcharts.Yaxis.Crosshairs (Crosshairs)
import Data.Functor.Contravariant (cmap)
import Data.Options (Option, Options, opt)
import Data.Options as Opt

data Stroke

stroke :: Option Crosshairs (Options Stroke)
stroke = cmap Opt.options (opt "stroke")

color :: Option Stroke String
color = opt "color"

width :: Option Stroke Number
width = opt "width"

dashArray :: Option Stroke Number
dashArray = opt "dashArray"

