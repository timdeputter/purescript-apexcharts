
module Apexcharts.Tooltip.X where


import Apexcharts.Tooltip (Tooltip)
import Data.Functor.Contravariant (cmap)
import Data.Options (Option, Options, opt)
import Data.Options as Opt

data X

x :: Option Tooltip (Options X)
x = cmap Opt.options (opt "x")

show :: Option X Boolean
show = opt "show"

format :: Option X String
format = opt "format"

