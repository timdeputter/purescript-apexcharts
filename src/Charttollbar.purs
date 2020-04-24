module Apexcharts.Chart.Toolbar where



import Apexcharts.Chart (Chart)

import Data.Functor.Contravariant (cmap)
import Data.Options (Option, Options, opt)
import Data.Options as Opt


data ChartToolbar


toolbar :: Option Chart (Options ChartToolbar)
toolbar = cmap Opt.options (opt "toolbar")

offsetX :: Option ChartToolbar Number
offsetX = opt "offsetX"

offsetY :: Option ChartToolbar Number
offsetY = opt "offsetY"

download :: Option ChartToolbar Boolean 
download = opt "download"


show :: Option ChartToolbar Boolean
show = opt "show"
