module Apexcharts.Chart.Brush where




import Apexcharts.Chart (Chart)
import Data.Functor.Contravariant (cmap)
import Data.Options (Option, Options, opt)
import Data.Options as Opt



data Brush


brush :: Option Chart (Options Brush)
brush = cmap Opt.options (opt "brush")


enabled :: Option Brush Boolean
enabled = opt "enabled"


autoScaleYaxis :: Option Brush Boolean 
autoScaleYaxis = opt "autoScaleYaxis"

target :: Option Brush String
target = opt "target"



