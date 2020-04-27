module Apexcharts.Chart.Toolbar.Tools where




import Apexcharts.Chart.Toolbar (ChartToolbar)

import Data.Functor.Contravariant (cmap)
import Data.Options (Option, Options, opt)
import Data.Options as Opt

data Tools

tools :: Option ChartToolbar (Options Tools)
tools = cmap Opt.options (opt "tools")


zoomin :: Option Tools Boolean
zoomin = opt "zoomin"

zoomout :: Option Tools Boolean
zoomout = opt "zoomout"

selection :: Option Tools Boolean
selection = opt "selection"

download :: Option Tools Boolean
download = opt "download"

pan :: Option Tools Boolean
pan = opt "pan"

reset :: Option Tools Boolean
reset = opt "reset"

zoom :: Option Tools Boolean
zoom = opt "zoom"