
module Apexcharts.Legend.Labels where


import Apexcharts.Legend (Legend)
import Data.Functor.Contravariant (cmap)
import Data.Options (Option, Options, opt)
import Data.Options as Opt

data Labels

labels :: Option Legend (Options Labels)
labels = cmap Opt.options (opt "labels")

colors :: Option Labels (Array String)
colors = opt "colors"

useSeriesColors :: Option Labels Boolean
useSeriesColors = opt "useSeriesColors"

