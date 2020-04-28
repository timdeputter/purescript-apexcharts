
module Apexcharts.Grid.Padding where

import Prelude

import Apexcharts.Grid
import Data.Functor.Contravariant (cmap)
import Data.Options (Option, Options, opt)
import Data.Options as Opt

data Padding

padding :: Option Grid (Options Padding)
padding = cmap Opt.options (opt "padding")

top :: Option Padding Number
top = opt "top"

right :: Option Padding Number
right = opt "right"

bottom :: Option Padding Number
bottom = opt "bottom"

left :: Option Padding Number
left = opt "left"

