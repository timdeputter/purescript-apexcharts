
module Apexcharts.Legend.Labels where

import Apexcharts.Legend
import Data.Functor.Contravariant (cmap)
import Data.Options (Option, Options, opt)
import Data.Options as Opt

data Labels

labels :: Option Apexoptions (Options Labels)
labels = cmap Opt.options (opt "labels")

colors :: Option Labels Undefined
colors = opt "colors"

useSeriesColors :: Option Labels Boolean
useSeriesColors = opt "useSeriesColors"

