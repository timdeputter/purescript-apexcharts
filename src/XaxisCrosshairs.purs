
module Apexcharts.Xaxis.Crosshairs where


import Apexcharts.Xaxis (Xaxis)
import Data.Functor.Contravariant (cmap)
import Data.Options (Option, Options, opt)
import Data.Options as Opt

data Crosshairs

crosshairs :: Option Xaxis (Options Crosshairs)
crosshairs = cmap Opt.options (opt "crosshairs")

show :: Option Crosshairs Boolean
show = opt "show"

width :: Option Crosshairs Number
width = opt "width"

position :: Option Crosshairs String
position = opt "position"

opacity :: Option Crosshairs Number
opacity = opt "opacity"

