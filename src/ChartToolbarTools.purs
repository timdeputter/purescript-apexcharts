
module Apexcharts.Chart.Toolbar.Tools where


import Apexcharts.Chart.Toolbar (Toolbar)
import Data.Functor.Contravariant (cmap)
import Data.Options (Option, Options, opt)
import Data.Options as Opt

data Tools

tools :: Option Toolbar (Options Tools)
tools = cmap Opt.options (opt "tools")

download :: Option Tools Boolean
download = opt "download"

selection :: Option Tools Boolean
selection = opt "selection"

zoom :: Option Tools Boolean
zoom = opt "zoom"

zoomin :: Option Tools Boolean
zoomin = opt "zoomin"

zoomout :: Option Tools Boolean
zoomout = opt "zoomout"

pan :: Option Tools Boolean
pan = opt "pan"

reset :: Option Tools Number
reset = opt "reset"

