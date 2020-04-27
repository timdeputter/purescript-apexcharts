module Apexcharts.Mainstroke where
  
import Prelude

import Apexcharts (class DashArray, Apexoptions)

import Data.Functor.Contravariant (cmap)
import Data.Options (Option, Options, opt)
import Data.Options as Opt


data MainStroke

data LineCap = Butt | Square | Round

lineCapToString :: LineCap -> String
lineCapToString = case _ of
  Butt -> "butt"
  Square -> "square"
  Round -> "round"


data Curve = Smooth | Straight | Stepline

curveToString :: Curve -> String
curveToString = case _ of
  Smooth -> "smooth"
  Straight -> "straight"
  Stepline -> "stepline"


stroke :: Option Apexoptions (Options MainStroke)
stroke = cmap Opt.options (opt "stroke")  

width :: Option MainStroke Number
width = opt "width"

show :: Option MainStroke Boolean
show = opt "show"

instance dashArrayMainstroke :: DashArray MainStroke Number where
  dashArray = opt "dashArray"  

instance dashArrayMainstrokeArray :: DashArray MainStroke (Array Number) where
  dashArray = opt "dashArray"  

class CurveClass a  where
  curve :: Option MainStroke a

instance simpleCurve :: CurveClass Curve where
  curve = cmap curveToString (opt "curve")

instance arrayCurve :: CurveClass (Array Curve) where
  curve = cmap (map curveToString) (opt "curve")

colors :: Option MainStroke (Array String)
colors = opt "colors"  

lineCap :: Option MainStroke LineCap
lineCap = cmap lineCapToString (opt "lineCap")  
