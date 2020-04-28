
module Apexcharts.NoData where


import Apexcharts (Apexoptions)
import Data.Functor.Contravariant (cmap)
import Data.Options (Option, Options, opt)
import Data.Options as Opt

data NoData

noData :: Option Apexoptions (Options NoData)
noData = cmap Opt.options (opt "noData")

text :: Option NoData String
text = opt "text"

align :: Option NoData String
align = opt "align"

verticalAlign :: Option NoData String
verticalAlign = opt "verticalAlign"

offsetX :: Option NoData Number
offsetX = opt "offsetX"

offsetY :: Option NoData Number
offsetY = opt "offsetY"

