module Apexcharts where

import Prelude

import Data.Options (Option, Options, opt)
import Data.Options as Opt
import Effect (Effect)
import Foreign (Foreign)
import Web.DOM.Element (Element)

data Apexoptions


foreign import data Apexchart :: Type


colors :: Option Apexoptions (Array String)
colors = opt "colors"  

labels :: Option Apexoptions (Array String)
labels = opt "labels"

updateOptions :: Options Apexoptions -> Apexchart -> Effect Unit
updateOptions opts chart = _updateOptions chart (Opt.options opts)

createChart :: String -> Options Apexoptions -> Effect Apexchart
createChart selector opts = _createChart selector (Opt.options opts)

createChartEl :: Element -> Options Apexoptions -> Effect Apexchart
createChartEl el opts = _createChartEl el (Opt.options opts)

foreign import _createChart :: String -> Foreign -> Effect Apexchart

foreign import _createChartEl :: Element -> Foreign -> Effect Apexchart

foreign import render :: Apexchart -> Effect Unit

foreign import _updateOptions :: Apexchart -> Foreign -> Effect Unit
