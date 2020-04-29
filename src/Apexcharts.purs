module Apexcharts where

import Prelude

import Data.Options (Option, Options, opt)
import Data.Options as Opt
import Effect (Effect)
import Foreign (Foreign)

data Apexoptions


foreign import data Apexchart :: Type


colors :: Option Apexoptions (Array String)
colors = opt "colors"  

labels :: Option Apexoptions (Array String)
labels = opt "labels"


createChart :: String -> Options Apexoptions -> Apexchart
createChart selector opts = _createChart selector (Opt.options opts)

foreign import _createChart :: String -> Foreign -> Apexchart

foreign import render :: Apexchart -> Effect Unit

foreign import _updateOptions :: Apexchart -> Foreign -> Effect Unit
