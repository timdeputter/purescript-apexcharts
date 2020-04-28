
module Apexcharts.Grid.Row where


import Apexcharts.Grid (Grid)
import Data.Functor.Contravariant (cmap)
import Data.Options (Option, Options, opt)
import Data.Options as Opt

data Row

row :: Option Grid (Options Row)
row = cmap Opt.options (opt "row")

colors :: Option Row (Array String)
colors = opt "colors"

opacity :: Option Row Number
opacity = opt "opacity"

