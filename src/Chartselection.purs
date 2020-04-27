module Apexcharts.Chart.Selection where



import Apexcharts.Chart (Chart)
import Apexcharts.Chart.Fill (Fill)
import Apexcharts.Commons (OrientationType, orientationTypeToString)
import Data.Functor.Contravariant (cmap)
import Data.Options (Option, Options, opt)
import Data.Options as Opt


data Selection
data SelectionAxis
data Stroke



selection :: Option Chart (Options Selection) 
selection = cmap Opt.options (opt "selection")

enabled :: Option Selection Boolean
enabled = opt "enabled"

type' :: Option Selection OrientationType 
type' = cmap orientationTypeToString (opt "type")

fill :: Option Selection (Options Fill)
fill = cmap Opt.options (opt "fill")

xaxis :: Option Selection (Options SelectionAxis)
xaxis = cmap Opt.options (opt "xaxis")

yaxis :: Option Selection (Options SelectionAxis)
yaxis = cmap Opt.options (opt "yaxis")


selectionStroke :: Option Selection (Options Stroke)
selectionStroke = cmap Opt.options (opt "stroke")  



color :: Option Stroke String
color = opt "color"

opacity :: Option Stroke Number
opacity = opt "opacity"

width :: Option Stroke Number
width = opt "width"

class DashArray a where
  dashArray :: Option Stroke a

instance dashArrayNum :: DashArray Number where
  dashArray = opt "dashArray"  

instance dashArrayArray :: DashArray (Array Number) where
  dashArray = opt "dashArray"  


min :: Option SelectionAxis Number
min = opt "min"

max :: Option SelectionAxis Number
max = opt "max"
