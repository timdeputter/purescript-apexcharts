
module Apexcharts.Legend.OnItemClick where

import Prelude

import Apexcharts.Legend
import Data.Functor.Contravariant (cmap)
import Data.Options (Option, Options, opt)
import Data.Options as Opt

data OnItemClick

onItemClick :: Option Legend (Options OnItemClick)
onItemClick = cmap Opt.options (opt "onItemClick")

toggleDataSeries :: Option OnItemClick Boolean
toggleDataSeries = opt "toggleDataSeries"

