
module Apexcharts.Markers.Hover where


import Apexcharts.Markers (Markers)
import Data.Functor.Contravariant (cmap)
import Data.Options (Option, Options, opt)
import Data.Options as Opt

data Hover

hover :: Option Markers (Options Hover)
hover = cmap Opt.options (opt "hover")

size :: Option Hover Number
size = opt "size"

sizeOffset :: Option Hover Number
sizeOffset = opt "sizeOffset"

