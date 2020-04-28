
module Apexcharts.Chart.Toolbar where


import Apexcharts.Chart (Chart)
import Data.Functor.Contravariant (cmap)
import Data.Options (Option, Options, opt)
import Data.Options as Opt

data Toolbar


data AutoSelected = Zoom
    | Selection
    | Pan

autoSelectedToString :: AutoSelected -> String
autoSelectedToString = case _ of
    Zoom -> "zoom"
    Selection -> "selection"
    Pan -> "pan"

toolbar :: Option Chart (Options Toolbar)
toolbar = cmap Opt.options (opt "toolbar")

show :: Option Toolbar Boolean
show = opt "show"

offsetX :: Option Toolbar Number
offsetX = opt "offsetX"

offsetY :: Option Toolbar Number
offsetY = opt "offsetY"

autoSelected :: Option Toolbar AutoSelected
autoSelected = cmap autoSelectedToString (opt "autoSelected")

