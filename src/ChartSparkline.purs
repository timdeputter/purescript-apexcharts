
module Apexcharts.Chart.Sparkline where


import Apexcharts.Chart (Chart)
import Data.Functor.Contravariant (cmap)
import Data.Options (Option, Options, opt)
import Data.Options as Opt

data Sparkline

sparkline :: Option Chart (Options Sparkline)
sparkline = cmap Opt.options (opt "sparkline")

enabled :: Option Sparkline Boolean
enabled = opt "enabled"

