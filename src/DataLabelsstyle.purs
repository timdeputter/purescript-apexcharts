module Apexcharts.DataLabels.Style where
  
import Apexcharts.DataLabels (DataLabels)
import Data.Functor.Contravariant (cmap)
import Data.Options (Option, Options, opt)
import Data.Options as Opt


data Style


data FontWeight = Normal | Bold | Bolder | Lighter

fontWeightToString :: FontWeight -> String
fontWeightToString = case _ of
  Normal -> "normal"
  Bold -> "bold"
  Bolder -> "bolder"
  Lighter -> "lighter"


style :: Option DataLabels (Options Style)
style =  cmap Opt.options (opt "style")

colors :: Option Style (Array String)
colors = opt "colors"  

fontFamily :: Option Style String
fontFamily = opt "fontFamily"

class FontWeightClass a where
  fontWeight :: Option Style a

instance fontWeightString :: FontWeightClass FontWeight where
  fontWeight = opt "fontWeight"

instance fontWeightNum :: FontWeightClass Number where
  fontWeight = opt "fontWeight"


fontSize :: Option Style String
fontSize = opt "fontSize"
