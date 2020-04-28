
module Apexcharts.Tooltip.Z where


import Apexcharts.Tooltip (Tooltip)
import Data.Functor.Contravariant (cmap)
import Data.Options (Option, Options, opt)
import Data.Options as Opt

data Z

z :: Option Tooltip (Options Z)
z = cmap Opt.options (opt "z")

title :: Option Z String
title = opt "title"

