
module Apexcharts.Theme where


import Apexcharts
import Data.Functor.Contravariant (cmap)
import Data.Options (Option, Options, opt)
import Data.Options as Opt

data Theme

theme :: Option Apexoptions (Options Theme)
theme = cmap Opt.options (opt "theme")

mode :: Option Theme String
mode = opt "mode"

palette :: Option Theme String
palette = opt "palette"

