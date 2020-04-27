module Apexcharts.Chart.Zoom where



import Apexcharts.Chart (Chart)
import Apexcharts.Chart.Fill (Fill)
import Apexcharts.Commons (OrientationType, orientationTypeToString)
import Data.Functor.Contravariant (cmap)
import Data.Options (Option, Options, opt)
import Data.Options as Opt

data Zoom
data Stroke


zoomStroke :: Option Zoom (Options Stroke)
zoomStroke = cmap Opt.options (opt "stroke")  

zooming :: Option Chart (Options Zoom) 
zooming = cmap Opt.options (opt "zoom")

enabled :: Option Zoom Boolean
enabled = opt "enabled"      

type' :: Option Zoom OrientationType
type' = cmap orientationTypeToString (opt "type")

autoScaleYaxis :: Option Zoom Boolean
autoScaleYaxis = opt "autoScaleYaxis"

fill :: Option Zoom (Options Fill)
fill = cmap Opt.options (opt "fill")

color :: Option Stroke String
color = opt "color"

opacity :: Option Stroke Number
opacity = opt "opacity"

width :: Option Stroke Number
width = opt "width"