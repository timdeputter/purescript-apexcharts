
module Apexcharts.PlotOptions.Radar.Polygons where

import Prelude

import Apexcharts.PlotOptions.Radar
import Data.Functor.Contravariant (cmap)
import Data.Options (Option, Options, opt)
import Data.Options as Opt

data Polygons

polygons :: Option Radar (Options Polygons)
polygons = cmap Opt.options (opt "polygons")

strokeColors :: Option Polygons String
strokeColors = opt "strokeColors"

strokeWidth :: Option Polygons Number
strokeWidth = opt "strokeWidth"

connectorColors :: Option Polygons String
connectorColors = opt "connectorColors"

