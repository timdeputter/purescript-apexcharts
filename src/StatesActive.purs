
module Apexcharts.States.Active where


import Apexcharts.States (States)
import Data.Functor.Contravariant (cmap)
import Data.Options (Option, Options, opt)
import Data.Options as Opt

data Active

active :: Option States (Options Active)
active = cmap Opt.options (opt "active")

allowMultipleDataPointsSelection :: Option Active Boolean
allowMultipleDataPointsSelection = opt "allowMultipleDataPointsSelection"

