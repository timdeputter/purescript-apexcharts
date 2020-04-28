
module Apexcharts.Chart.Zoom where


import Apexcharts.Chart (Chart)
import Data.Functor.Contravariant (cmap)
import Data.Options (Option, Options, opt)
import Data.Options as Opt

data Zoom

data ZoomType = X | Y | XY

zoomTypeToString :: ZoomType -> String
zoomTypeToString = case _ of
    X -> "x"
    Y -> "y"
    XY -> "xy"

zoom :: Option Chart (Options Zoom)
zoom = cmap Opt.options (opt "zoom")

enabled :: Option Zoom Boolean
enabled = opt "enabled"

type' :: Option Zoom ZoomType
type' = cmap zoomTypeToString (opt "type")

autoScaleYaxis :: Option Zoom Boolean
autoScaleYaxis = opt "autoScaleYaxis"

