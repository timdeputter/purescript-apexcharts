
module Apexcharts.Yaxis.Crosshairs where


import Apexcharts.Yaxis (Yaxis)
import Data.Functor.Contravariant (cmap)
import Data.Options (Option, Options, opt)
import Data.Options as Opt

data Crosshairs

crosshairs :: Option Yaxis (Options Crosshairs)
crosshairs = cmap Opt.options (opt "crosshairs")

show :: Option Crosshairs Boolean
show = opt "show"

position :: Option Crosshairs String
position = opt "position"

