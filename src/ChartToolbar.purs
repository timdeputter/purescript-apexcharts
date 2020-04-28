
module Apexcharts.Chart.Toolbar where


import Apexcharts.Chart (Chart)
import Data.Functor.Contravariant (cmap)
import Data.Options (Option, Options, opt)
import Data.Options as Opt

data Toolbar

toolbar :: Option Chart (Options Toolbar)
toolbar = cmap Opt.options (opt "toolbar")

show :: Option Toolbar Boolean
show = opt "show"

offsetX :: Option Toolbar Number
offsetX = opt "offsetX"

offsetY :: Option Toolbar Number
offsetY = opt "offsetY"

autoSelected :: Option Toolbar String
autoSelected = opt "autoSelected"

