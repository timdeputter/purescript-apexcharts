
module Apexcharts.Grid.Yaxis.Lines where

import Prelude

import Apexcharts.Grid.Yaxis
import Data.Functor.Contravariant (cmap)
import Data.Options (Option, Options, opt)
import Data.Options as Opt

data Lines

lines :: Option Yaxis (Options Lines)
lines = cmap Opt.options (opt "lines")

show :: Option Lines Boolean
show = opt "show"

