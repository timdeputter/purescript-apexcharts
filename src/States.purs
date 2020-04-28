
module Apexcharts.States where


import Apexcharts
import Data.Functor.Contravariant (cmap)
import Data.Options (Option, Options, opt)
import Data.Options as Opt

data States

states :: Option Apexoptions (Options States)
states = cmap Opt.options (opt "states")

