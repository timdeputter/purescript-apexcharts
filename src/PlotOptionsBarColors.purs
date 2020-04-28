
module Apexcharts.PlotOptions.Bar.Colors where


import Apexcharts.PlotOptions.Bar (Bar)
import Data.Functor.Contravariant (cmap)
import Data.Options (Option, Options, opt)
import Data.Options as Opt

data Colors

colors :: Option Bar (Options Colors)
colors = cmap Opt.options (opt "colors")

backgroundBarColors :: Option Colors (Array String)
backgroundBarColors = opt "backgroundBarColors"

backgroundBarOpacity :: Option Colors Number
backgroundBarOpacity = opt "backgroundBarOpacity"

backgroundBarRadius :: Option Colors Number
backgroundBarRadius = opt "backgroundBarRadius"

