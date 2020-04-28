
module Apexcharts.Tooltip.Marker where


import Apexcharts.Tooltip (Tooltip)
import Data.Functor.Contravariant (cmap)
import Data.Options (Option, Options, opt)
import Data.Options as Opt

data Marker

marker :: Option Tooltip (Options Marker)
marker = cmap Opt.options (opt "marker")

show :: Option Marker Boolean
show = opt "show"

