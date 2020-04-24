module Apexcharts.Chart.Fill where
  
import Apexcharts

import Apexcharts.Commons (class Color, class Download, class FillClass, class Pan, class Reset, class SelectionClass)
import Data.Functor.Contravariant (cmap)
import Data.Options (Option, Options, opt)
import Data.Options as Opt


data Fill


instance fillColor :: Color Fill String where
    color = opt "color"

instance opacityFill :: Opacity Fill Number where
    opacity = opt "opacity"
