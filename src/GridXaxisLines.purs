
module Apexcharts.Grid.Xaxis.Lines where

import Prelude

import Apexcharts.Grid.Xaxis
import Data.Functor.Contravariant (cmap)
import Data.Options (Option, Options, opt)
import Data.Options as Opt

data Lines

lines :: Option Xaxis (Options Lines)
lines = cmap Opt.options (opt "lines")

show :: Option Lines Boolean
show = opt "show"

