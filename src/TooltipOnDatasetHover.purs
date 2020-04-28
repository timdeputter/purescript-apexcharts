
module Apexcharts.Tooltip.OnDatasetHover where


import Apexcharts.Tooltip (Tooltip)
import Data.Functor.Contravariant (cmap)
import Data.Options (Option, Options, opt)
import Data.Options as Opt

data OnDatasetHover

onDatasetHover :: Option Tooltip (Options OnDatasetHover)
onDatasetHover = cmap Opt.options (opt "onDatasetHover")

highlightDataSeries :: Option OnDatasetHover Boolean
highlightDataSeries = opt "highlightDataSeries"

