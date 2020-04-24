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

opacity :: Option Background Number
opacity = opt "opacity"

foreColor :: Option Background String
foreColor = opt "foreColor"

borderColor :: Option Background String
borderColor = opt "borderColor"

padding :: Option Background Int
padding = opt "padding"

borderRadius :: Option Background Int
borderRadius = opt "borderRadius"

borderWidth :: Option Background Int
borderWidth = opt "borderWidth"
