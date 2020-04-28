
module Apexcharts.Stroke where


import Apexcharts
import Data.Functor.Contravariant (cmap)
import Data.Options (Option, Options, opt)
import Data.Options as Opt

data Stroke

stroke :: Option Apexoptions (Options Stroke)
stroke = cmap Opt.options (opt "stroke")

show :: Option Stroke Boolean
show = opt "show"

curve :: Option Stroke String
curve = opt "curve"

lineCap :: Option Stroke String
lineCap = opt "lineCap"

colors :: Option Stroke Undefined
colors = opt "colors"

width :: Option Stroke Number
width = opt "width"

dashArray :: Option Stroke Number
dashArray = opt "dashArray"

