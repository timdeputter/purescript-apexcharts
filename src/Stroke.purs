module Apexcharts.Stroke where
  
import Prelude

import Apexcharts (Apexoptions)
import Data.Functor.Contravariant (cmap)
import Data.Options (Option, Options, opt)
import Data.Options as Opt


data Stroke


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


stroke :: Option Apexoptions (Options Stroke)
stroke = cmap Opt.options (opt "stroke")  

width :: Option Stroke Number
width = opt "width"

show :: Option Stroke Boolean
show = opt "show"

class DashArray a where
  dashArray :: Option Stroke a   
  
instance dashArrayStroke :: DashArray Number where
  dashArray = opt "dashArray"  

instance dashArrayStrokeArray :: DashArray (Array Number) where
  dashArray = opt "dashArray"  


class CurveClass a  where
  curve :: Option Stroke a

instance simpleCurve :: CurveClass Curve where
  curve = cmap curveToString (opt "curve")

instance arrayCurve :: CurveClass (Array Curve) where
  curve = cmap (map curveToString) (opt "curve")


colors :: Option Stroke (Array String)
colors = opt "colors"  

lineCap :: Option Stroke LineCap
lineCap = cmap lineCapToString (opt "lineCap")  
