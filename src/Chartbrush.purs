module Apexcharts.Chart.Brush where



import Apexcharts (class Enabled)
import Apexcharts.Chart (class AutoScale, Chart)
import Data.Functor.Contravariant (cmap)
import Data.Options (Option, Options, opt)
import Data.Options as Opt



data Brush


brush :: Option Chart (Options Brush)
brush = cmap Opt.options (opt "brush")


instance enableBrush :: Enabled Brush where
  enabled = opt "enabled"


instance brushAutoscale :: AutoScale Brush Boolean where
    autoScaleYaxis = opt "autoScaleYaxis"

target :: Option Brush String
target = opt "target"



