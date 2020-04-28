
module Apexcharts.Tooltip.Items where


import Apexcharts.Tooltip (Tooltip)
import Data.Functor.Contravariant (cmap)
import Data.Options (Option, Options, opt)
import Data.Options as Opt

data Items

items :: Option Tooltip (Options Items)
items = cmap Opt.options (opt "items")

display :: Option Items String
display = opt "display"

