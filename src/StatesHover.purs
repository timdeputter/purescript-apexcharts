
module Apexcharts.States.Hover where


import Apexcharts.States (States)
import Data.Functor.Contravariant (cmap)
import Data.Options (Option, Options, opt)
import Data.Options as Opt

data Hover

hover :: Option States (Options Hover)
hover = cmap Opt.options (opt "hover")

