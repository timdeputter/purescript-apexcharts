
module Apexcharts.Chart.Selection where


import Apexcharts.Chart (Chart)
import Data.Functor.Contravariant (cmap)
import Data.Options (Option, Options, opt)
import Data.Options as Opt

data Selection

selection :: Option Chart (Options Selection)
selection = cmap Opt.options (opt "selection")

enabled :: Option Selection Boolean
enabled = opt "enabled"

type' :: Option Selection String
type' = opt "type"

