
module Apexcharts.Chart.Locales.Options.Toolbar where


import Apexcharts.Chart.Locales.Options (Options)
import Data.Functor.Contravariant (cmap)
import Data.Options (Option, opt)
import Data.Options as Opt

data Toolbar

toolbar :: Option Options (Opt.Options Toolbar)
toolbar = cmap Opt.options (opt "toolbar")

download :: Option Toolbar String
download = opt "download"

selection :: Option Toolbar String
selection = opt "selection"

selectionZoom :: Option Toolbar String
selectionZoom = opt "selectionZoom"

zoomIn :: Option Toolbar String
zoomIn = opt "zoomIn"

zoomOut :: Option Toolbar String
zoomOut = opt "zoomOut"

pan :: Option Toolbar String
pan = opt "pan"

reset :: Option Toolbar String
reset = opt "reset"

