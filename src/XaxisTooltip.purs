
module Apexcharts.Xaxis.Tooltip where


import Apexcharts.Xaxis (Xaxis)
import Data.Functor.Contravariant (cmap)
import Data.Options (Option, Options, opt)
import Data.Options as Opt

data Tooltip

tooltip :: Option Xaxis (Options Tooltip)
tooltip = cmap Opt.options (opt "tooltip")

enabled :: Option Tooltip Boolean
enabled = opt "enabled"

offsetY :: Option Tooltip Number
offsetY = opt "offsetY"

