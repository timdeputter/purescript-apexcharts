module Apexcharts.Chart.Zoom where

import Apexcharts

import Apexcharts.Chart (class AutoScale, Chart)
import Apexcharts.Chart.Fill (Fill)
import Apexcharts.Commons (class FillClass)
import Data.Functor.Contravariant (cmap)
import Data.Options (Option, Options, opt)
import Data.Options as Opt

data Zoom
data Stroke


zoomStroke :: Option Zoom (Options Stroke)
zoomStroke = cmap Opt.options (opt "stroke")  

zooming :: Option Chart (Options Zoom) 
zooming = cmap Opt.options (opt "zoom")

instance enableZoom :: Enabled Zoom where
  enabled = opt "enabled"      

instance typeZoom :: Type Zoom OrientationType where
    type' = cmap orientationTypeToString (opt "type")

instance zoomAutoscale :: AutoScale Zoom Boolean where
    autoScaleYaxis = opt "autoScaleYaxis"

instance zoomFill :: FillClass Zoom Fill where
    fill = cmap Opt.options (opt "fill")
