
module Apexcharts.Grid.Xaxis where


import Apexcharts.Grid (Grid)
import Data.Functor.Contravariant (cmap)
import Data.Options (Option, Options, opt)
import Data.Options as Opt

data Xaxis

xaxis :: Option Grid (Options Xaxis)
xaxis = cmap Opt.options (opt "xaxis")

