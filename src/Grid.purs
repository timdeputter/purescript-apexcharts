
module Apexcharts.Grid where

import Prelude

import Apexcharts
import Data.Functor.Contravariant (cmap)
import Data.Options (Option, Options, opt)
import Data.Options as Opt

data Grid

grid :: Option Apexoptions (Options Grid)
grid = cmap Opt.options (opt "grid")

show :: Option Grid Boolean
show = opt "show"

borderColor :: Option Grid String
borderColor = opt "borderColor"

strokeDashArray :: Option Grid Number
strokeDashArray = opt "strokeDashArray"

position :: Option Grid String
position = opt "position"

