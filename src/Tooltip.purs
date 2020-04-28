
module Apexcharts.Tooltip where


import Apexcharts
import Data.Functor.Contravariant (cmap)
import Data.Options (Option, Options, opt)
import Data.Options as Opt

data Tooltip

tooltip :: Option Apexoptions (Options Tooltip)
tooltip = cmap Opt.options (opt "tooltip")

enabled :: Option Tooltip Boolean
enabled = opt "enabled"

enabledOnSeries :: Option Tooltip (Array Number)
enabledOnSeries = opt "enabledOnSeries"

shared :: Option Tooltip Boolean
shared = opt "shared"

followCursor :: Option Tooltip Boolean
followCursor = opt "followCursor"

intersect :: Option Tooltip Boolean
intersect = opt "intersect"

inverseOrder :: Option Tooltip Boolean
inverseOrder = opt "inverseOrder"

fillSeriesColor :: Option Tooltip Boolean
fillSeriesColor = opt "fillSeriesColor"

theme :: Option Tooltip Boolean
theme = opt "theme"

