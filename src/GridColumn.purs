
module Apexcharts.Grid.Column where


import Apexcharts.Grid (Grid)
import Data.Functor.Contravariant (cmap)
import Data.Options (Option, Options, opt)
import Data.Options as Opt

data Column

column :: Option Grid (Options Column)
column = cmap Opt.options (opt "column")

colors :: Option Column (Array String)
colors = opt "colors"

opacity :: Option Column Number
opacity = opt "opacity"

