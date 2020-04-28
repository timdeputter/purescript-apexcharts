
module Apexcharts.DataLabels.Background where


import Apexcharts.DataLabels (DataLabels)
import Data.Functor.Contravariant (cmap)
import Data.Options (Option, Options, opt)
import Data.Options as Opt

data Background

background :: Option DataLabels (Options Background)
background = cmap Opt.options (opt "background")

enabled :: Option Background Boolean
enabled = opt "enabled"

foreColor :: Option Background String
foreColor = opt "foreColor"

padding :: Option Background Number
padding = opt "padding"

borderRadius :: Option Background Number
borderRadius = opt "borderRadius"

borderWidth :: Option Background Number
borderWidth = opt "borderWidth"

borderColor :: Option Background String
borderColor = opt "borderColor"

opacity :: Option Background Number
opacity = opt "opacity"

