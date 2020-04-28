
module Apexcharts.Tooltip.Fixed where


import Apexcharts.Tooltip (Tooltip)
import Data.Functor.Contravariant (cmap)
import Data.Options (Option, Options, opt)
import Data.Options as Opt

data Fixed

fixed :: Option Tooltip (Options Fixed)
fixed = cmap Opt.options (opt "fixed")

enabled :: Option Fixed Boolean
enabled = opt "enabled"

position :: Option Fixed String
position = opt "position"

offsetX :: Option Fixed Number
offsetX = opt "offsetX"

offsetY :: Option Fixed Number
offsetY = opt "offsetY"

