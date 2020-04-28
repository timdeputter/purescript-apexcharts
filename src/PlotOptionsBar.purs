
module Apexcharts.PlotOptions.Bar where


import Apexcharts.PlotOptions (PlotOptions)
import Data.Functor.Contravariant (cmap)
import Data.Options (Option, Options, opt)
import Data.Options as Opt

data Bar

bar :: Option PlotOptions (Options Bar)
bar = cmap Opt.options (opt "bar")

horizontal :: Option Bar Boolean
horizontal = opt "horizontal"

startingShape :: Option Bar String
startingShape = opt "startingShape"

endingShape :: Option Bar String
endingShape = opt "endingShape"

columnWidth :: Option Bar String
columnWidth = opt "columnWidth"

barHeight :: Option Bar String
barHeight = opt "barHeight"

distributed :: Option Bar Boolean
distributed = opt "distributed"

rangeBarOverlap :: Option Bar Boolean
rangeBarOverlap = opt "rangeBarOverlap"

