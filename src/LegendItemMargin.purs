
module Apexcharts.Legend.ItemMargin where

import Prelude

import Apexcharts.Legend
import Data.Functor.Contravariant (cmap)
import Data.Options (Option, Options, opt)
import Data.Options as Opt

data ItemMargin

itemMargin :: Option Legend (Options ItemMargin)
itemMargin = cmap Opt.options (opt "itemMargin")

horizontal :: Option ItemMargin Number
horizontal = opt "horizontal"

vertical :: Option ItemMargin Number
vertical = opt "vertical"

