
module Apexcharts.Chart.Zoom where


import Apexcharts.Chart (Chart)
import Data.Functor.Contravariant (cmap)
import Data.Options (Option, Options, opt)
import Data.Options as Opt

data Zoom

zoom :: Option Chart (Options Zoom)
zoom = cmap Opt.options (opt "zoom")

enabled :: Option Zoom Boolean
enabled = opt "enabled"

type' :: Option Zoom String
type' = opt "type"

autoScaleYaxis :: Option Zoom Boolean
autoScaleYaxis = opt "autoScaleYaxis"

