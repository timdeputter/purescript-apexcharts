
module Apexcharts.Yaxis.Tooltip where


import Apexcharts.Yaxis (Yaxis)
import Data.Functor.Contravariant (cmap)
import Data.Options (Option, Options, opt)
import Data.Options as Opt

data Tooltip

tooltip :: Option Yaxis (Options Tooltip)
tooltip = cmap Opt.options (opt "tooltip")

enabled :: Option Tooltip Boolean
enabled = opt "enabled"

offsetX :: Option Tooltip Number
offsetX = opt "offsetX"

