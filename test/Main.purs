module Test.Main where

import Apexcharts (colors, labels)
import Apexcharts.Chart as C
import Apexcharts.Common as COM
import Apexcharts.Chart.Animations (Easing(..), animations)
import Apexcharts.Chart.Animations as A
import Apexcharts.Chart.Animations.AnimateGradually (animateGradually, delay, enabled) as AG
import Apexcharts.Chart.Animations.DynamicAnimation as DA
import Apexcharts.Chart.Brush as B
import Apexcharts.Chart.DropShadow as CDS
import Apexcharts.Chart.Locales as L
import Apexcharts.Chart.Locales.Options as LO
import Apexcharts.Chart.Locales.Options.Toolbar as LOT
import Apexcharts.Chart.Selection as S
import Apexcharts.Chart.Selection.Fill as SF
import Apexcharts.Chart.Selection.Stroke as SS
import Apexcharts.Chart.Selection.Xaxis as SX
import Apexcharts.Chart.Selection.Yaxis as SY
import Apexcharts.Chart.Sparkline as CS
import Apexcharts.Chart.Toolbar as CT
import Apexcharts.Chart.Toolbar.Tools as CTT
import Apexcharts.Chart.Zoom as Z
import Apexcharts.Chart.Zoom.ZoomedArea as ZA
import Apexcharts.Chart.Zoom.ZoomedArea.Fill as ZAF
import Apexcharts.Chart.Zoom.ZoomedArea.Stroke as ZAS
import Apexcharts.DataLabels (TextAnchor(..), dataLabels)
import Apexcharts.DataLabels as DL
import Apexcharts.DataLabels.Background as DLB
import Apexcharts.DataLabels.Background.DropShadow as DLBD
import Apexcharts.DataLabels.DropShadow as DLD
import Apexcharts.DataLabels.Style as DLS
import Apexcharts.Fill (FillType(..))
import Apexcharts.Fill as F
import Apexcharts.Fill.Gradient (GradientType(..), Shade(..))
import Apexcharts.Fill.Gradient as FG
import Apexcharts.Fill.Image as FI
import Apexcharts.Fill.Pattern (Style(..))
import Apexcharts.Fill.Pattern as FP
import Apexcharts.Grid (Position(..))
import Apexcharts.Grid (borderColor, grid, position, show, strokeDashArray) as AG
import Apexcharts.Grid.Column as AGC
import Apexcharts.Grid.Padding as AGP
import Apexcharts.Grid.Row as AGR
import Apexcharts.Grid.Xaxis as AGX
import Apexcharts.Grid.Xaxis.Lines as AGXL
import Apexcharts.Grid.Yaxis as AGY
import Apexcharts.Grid.Yaxis.Lines as AGYL
import Apexcharts.Series as SE
import Apexcharts.Stroke (Curve(..))
import Apexcharts.Stroke as AS
import Apexcharts.Title (Align(..))
import Apexcharts.Title as AT
import Apexcharts.Xaxis as X
import Data.Options (Options, (:=))
import Data.Options as Opt
import Effect (Effect)
import Effect.Aff (Aff, launchAff_)
import Foreign (Foreign)
import Prelude (Unit, discard, ($), (<>))
import Test.Spec (describe, it)
import Test.Spec.Assertions (shouldEqual)
import Test.Spec.Reporter (specReporter)
import Test.Spec.Runner (runSpec)


main :: Effect Unit
main = launchAff_ $ runSpec [specReporter] do
  describe "basic chart" do
    let 
      expected = "{\"chart\":{\"type\":\"line\"}," 
        <> "\"series\":[{\"name\":\"sales\",\"data\":[30,40,35,50,49,60,70,91,125]}],"
        <> "\"xaxis\":{\"categories\":[1991,1992,1993,1994,1995,1996,1997,1998,1999]}}"
      basicChart =  (
        C.chart := (C.type' := COM.Line) 
        <> SE.series := [
          SE.name := "sales"
          <> SE.data' := [30,40,35,50,49,60,70,91,125]
        ]
        <> X.xaxis := (
          X.categories := [1991,1992,1993,1994,1995,1996,1997,1998,1999]
        )
      )
    it "is possible" $ basicChart `shouldBeOption` expected
      
  describe "Apexoptions" do
    describe "chart" do
      describe "animations" do
        it "enabled" $ (C.chart := (animations := (A.enabled := true))) `shouldBeOption` "{\"chart\":{\"animations\":{\"enabled\":true}}}"
        it "easing" $ (C.chart := (animations := (A.easing := Linear))) `shouldBeOption` "{\"chart\":{\"animations\":{\"easing\":\"linear\"}}}"
        it "speed" $ (C.chart := (animations := (A.speed := 800.0))) `shouldBeOption` "{\"chart\":{\"animations\":{\"speed\":800}}}"
        describe "animateGradually" do
          it "enabled" $ (C.chart := (animations := (AG.animateGradually := (AG.enabled := true)))) 
            `shouldBeOption` "{\"chart\":{\"animations\":{\"animateGradually\":{\"enabled\":true}}}}"
          it "delay" $ (C.chart := (animations := (AG.animateGradually := (AG.delay := 150.0)))) 
            `shouldBeOption` "{\"chart\":{\"animations\":{\"animateGradually\":{\"delay\":150}}}}"
        describe "dynamicAnimation" do
          it "enabled" $ (C.chart := (animations := (DA.dynamicAnimation := (DA.enabled := true)))) 
            `shouldBeOption` "{\"chart\":{\"animations\":{\"dynamicAnimation\":{\"enabled\":true}}}}"
          it "speed" $ (C.chart := (animations := (DA.dynamicAnimation := (DA.speed := 350.0)))) 
            `shouldBeOption` "{\"chart\":{\"animations\":{\"dynamicAnimation\":{\"speed\":350}}}}"
      it "background" $ (C.chart := (C.background := "#fff")) `shouldBeOption` "{\"chart\":{\"background\":\"#fff\"}}" 
      describe "brush" do
        it "enabled" $ (C.chart := (B.brush := (B.enabled := true))) `shouldBeOption` "{\"chart\":{\"brush\":{\"enabled\":true}}}"
        it "target" $ (C.chart := (B.brush := (B.target := "chartId"))) `shouldBeOption` "{\"chart\":{\"brush\":{\"target\":\"chartId\"}}}"
        it "autoScaleYaxis" $ (C.chart := (B.brush := (B.autoScaleYaxis := true))) `shouldBeOption` "{\"chart\":{\"brush\":{\"autoScaleYaxis\":true}}}"
      it "defaultLocale" $ (C.chart := (C.defaultLocale := "en")) `shouldBeOption` "{\"chart\":{\"defaultLocale\":\"en\"}}"     
      describe "dropshadow" do
        it "enabled" $ (C.chart := (CDS.dropShadow := (CDS.enabled := true))) `shouldBeOption` "{\"chart\":{\"dropShadow\":{\"enabled\":true}}}"
        it "enabledOnSeries" $  (C.chart := (CDS.dropShadow := (CDS.enabledOnSeries := [3.0,2.0]))) 
          `shouldBeOption` "{\"chart\":{\"dropShadow\":{\"enabledOnSeries\":[3,2]}}}"
        it "top" $  (C.chart := (CDS.dropShadow := (CDS.top := 4.0))) 
          `shouldBeOption` "{\"chart\":{\"dropShadow\":{\"top\":4}}}"
        it "left" $  (C.chart := (CDS.dropShadow := (CDS.left := 5.0))) 
          `shouldBeOption` "{\"chart\":{\"dropShadow\":{\"left\":5}}}"
        it "blur" $  (C.chart := (CDS.dropShadow := (CDS.blur := 6.0))) 
          `shouldBeOption` "{\"chart\":{\"dropShadow\":{\"blur\":6}}}"
        it "color" $ (C.chart := (CDS.dropShadow := (CDS.color := "#fff"))) 
          `shouldBeOption` "{\"chart\":{\"dropShadow\":{\"color\":\"#fff\"}}}"
        it "opacity" $  (C.chart := (CDS.dropShadow := (CDS.opacity := 7.0))) 
          `shouldBeOption` "{\"chart\":{\"dropShadow\":{\"opacity\":7}}}"
      it "fontFamily" $ (C.chart := (C.fontFamily := "Helvetica, Arial")) `shouldBeOption` "{\"chart\":{\"fontFamily\":\"Helvetica, Arial\"}}"
      it "foreColor" $ (C.chart := (C.foreColor := "#373d3f")) `shouldBeOption` "{\"chart\":{\"foreColor\":\"#373d3f\"}}"
      it "group" $ (C.chart := (C.group := "g1")) `shouldBeOption` "{\"chart\":{\"group\":\"g1\"}}"
      describe "height" do
        it "as number" $ (C.chart := (C.height := 33.0)) `shouldBeOption` "{\"chart\":{\"height\":33}}"
        it "as string" $ (C.chart := (C.height := "44px")) `shouldBeOption` "{\"chart\":{\"height\":\"44px\"}}"
      it "id" $ (C.chart := (C.id := "c1")) `shouldBeOption` "{\"chart\":{\"id\":\"c1\"}}"
      describe "locales" do
        it "name" $ (C.chart := (L.locales := [L.name := "en"])) `shouldBeOption` "{\"chart\":{\"locales\":[{\"name\":\"en\"}]}}" 
        describe "options" do
          it "months" $ (C.chart := (L.locales := [LO.options := (LO.months := ["Ja", "Fe"])])) 
            `shouldBeOption` "{\"chart\":{\"locales\":[{\"options\":{\"months\":[\"Ja\",\"Fe\"]}}]}}" 
          it "shortMonths" $ (C.chart := (L.locales := [LO.options := (LO.shortMonths := ["J", "F"])])) 
            `shouldBeOption` "{\"chart\":{\"locales\":[{\"options\":{\"shortMonths\":[\"J\",\"F\"]}}]}}" 
          it "days" $ (C.chart := (L.locales := [LO.options := (LO.days := ["Mo", "Di"])])) 
            `shouldBeOption` "{\"chart\":{\"locales\":[{\"options\":{\"days\":[\"Mo\",\"Di\"]}}]}}" 
          it "shortDays" $ (C.chart := (L.locales := [LO.options := (LO.shortDays := ["M", "D"])])) 
            `shouldBeOption` "{\"chart\":{\"locales\":[{\"options\":{\"shortDays\":[\"M\",\"D\"]}}]}}" 
          describe "toolbar" do
            it "download" $ (C.chart := (L.locales := [LO.options := (LOT.toolbar := (LOT.zoomIn := "z" <> LOT.download := "Dl"))])) 
              `shouldBeOption` "{\"chart\":{\"locales\":[{\"options\":{\"toolbar\":{\"zoomIn\":\"z\",\"download\":\"Dl\"}}}]}}"
            it "selection" $ (C.chart := (L.locales := [LO.options := LOT.toolbar := (LOT.zoomIn := "z" <> LOT.selection := "s")]))
              `shouldBeOption` "{\"chart\":{\"locales\":[{\"options\":{\"toolbar\":{\"zoomIn\":\"z\",\"selection\":\"s\"}}}]}}" 
            it "selectionZoom" $ (C.chart := (L.locales := [LO.options := (LOT.toolbar := (LOT.selectionZoom := "sz"))])) 
              `shouldBeOption` "{\"chart\":{\"locales\":[{\"options\":{\"toolbar\":{\"selectionZoom\":\"sz\"}}}]}}" 
            it "zoomIn" $ (C.chart := (L.locales := [LO.options := (LOT.toolbar := (LOT.zoomIn := "zi"))])) 
              `shouldBeOption` "{\"chart\":{\"locales\":[{\"options\":{\"toolbar\":{\"zoomIn\":\"zi\"}}}]}}" 
            it "zoomOut" $ (C.chart := (L.locales := [LO.options := (LOT.toolbar := (LOT.zoomOut := "zo"))])) 
              `shouldBeOption` "{\"chart\":{\"locales\":[{\"options\":{\"toolbar\":{\"zoomOut\":\"zo\"}}}]}}" 
            it "pan" $ (C.chart := (L.locales := [LO.options := (LOT.toolbar := (LOT.zoomIn := "z" <> LOT.pan := "p"))])) 
              `shouldBeOption` "{\"chart\":{\"locales\":[{\"options\":{\"toolbar\":{\"zoomIn\":\"z\",\"pan\":\"p\"}}}]}}" 
            it "reset" $ (C.chart := (L.locales := [LO.options := (LOT.toolbar := (LOT.zoomIn := "z" <> LOT.reset := "r"))])) 
              `shouldBeOption` "{\"chart\":{\"locales\":[{\"options\":{\"toolbar\":{\"zoomIn\":\"z\",\"reset\":\"r\"}}}]}}" 
      it "offsetX" $ (C.chart := (C.offsetX := 0.0)) `shouldBeOption` "{\"chart\":{\"offsetX\":0}}"          
      it "offsetY" $ (C.chart := (C.offsetY := 1.0)) `shouldBeOption` "{\"chart\":{\"offsetY\":1}}"          
      it "parentHeightOffset" $ (C.chart := (C.parentHeightOffset := 2.0)) `shouldBeOption` "{\"chart\":{\"parentHeightOffset\":2}}"          
      it "redrawOnParentResize" $ (C.chart := (C.redrawOnParentResize := true)) `shouldBeOption` "{\"chart\":{\"redrawOnParentResize\":true}}"          
      it "selection" $ (C.chart := (S.selection := (S.enabled := true <> S.type' := S.X
        <> SF.fill := (SF.color := "#24292e" <> SF.opacity := 0.1)
        <> SS.stroke := (SS.width := 1.0 <> SS.dashArray := 3.0 <> SS.color := "#294820" <> SS.opacity := 0.4 )
        <> SX.xaxis := (SX.min := 1.0 <> SX.max := 3.0)
        <> SY.yaxis := (SY.min := 7.0 <> SY.max := 11.0)))) 
          `shouldBeOption` ("{\"chart\":{\"selection\":{\"enabled\":true,\"type\":\"x\","
            <> "\"fill\":{\"color\":\"#24292e\",\"opacity\":0.1},"
            <> "\"stroke\":{\"width\":1,\"dashArray\":3,\"color\":\"#294820\",\"opacity\":0.4},"
            <> "\"xaxis\":{\"min\":1,\"max\":3},"
            <> "\"yaxis\":{\"min\":7,\"max\":11}}}}")
      it "sparkline" $ (C.chart := (CS.sparkline := (CS.enabled := true))) `shouldBeOption` "{\"chart\":{\"sparkline\":{\"enabled\":true}}}"
      it "stacked" $ (C.chart := (C.stacked := true)) `shouldBeOption` "{\"chart\":{\"stacked\":true}}"
      it "stackType" $ (C.chart := (C.stackType := C.NormalStack)) `shouldBeOption` "{\"chart\":{\"stackType\":\"normal\"}}"
      describe "toolbar" do
        it "show" $ (C.chart := (CT.toolbar := (CT.show := true <> CTT.tools := (CTT.download := true)))) 
          `shouldBeOption` "{\"chart\":{\"toolbar\":{\"show\":true,\"tools\":{\"download\":true}}}}"
        it "offsetX" $ (C.chart := (CT.toolbar := (CT.offsetX := 3.0 <> CTT.tools := (CTT.download := true)))) 
          `shouldBeOption` "{\"chart\":{\"toolbar\":{\"offsetX\":3,\"tools\":{\"download\":true}}}}"
        it "offsetY" $ (C.chart := (CT.toolbar := (CT.offsetY := 4.0 <> CTT.tools := (CTT.download := true)))) 
          `shouldBeOption` "{\"chart\":{\"toolbar\":{\"offsetY\":4,\"tools\":{\"download\":true}}}}"
        it "tools" $ (C.chart := (CT.toolbar := (CTT.tools := (CTT.zoomin := true <> CTT.zoom := true 
          <> CTT.download := true <> CTT.selection := true 
          <> CTT.zoomout := true <> CTT.pan := true <> CTT.reset := true)))) 
            `shouldBeOption` ("{\"chart\":{\"toolbar\":{\"tools\":{\"zoomin\":true,\"zoom\":true,\"download\":true," 
              <> "\"selection\":true,\"zoomout\":true,\"pan\":true,\"reset\":true}}}}")
      it "type" $ (C.chart := (C.type' := COM.Line)) `shouldBeOption` "{\"chart\":{\"type\":\"line\"}}"
      it "width" $ (C.chart := (C.width := "100%")) `shouldBeOption` "{\"chart\":{\"width\":\"100%\"}}"
      describe "zoom" do
        it "enabled" $ (C.chart := (Z.zoom := (Z.enabled := true))) `shouldBeOption` "{\"chart\":{\"zoom\":{\"enabled\":true}}}"
        it "type" $ (C.chart := (Z.zoom := (Z.type' := Z.X))) `shouldBeOption` "{\"chart\":{\"zoom\":{\"type\":\"x\"}}}"
        it "autoScaleYaxis" $ (C.chart := (Z.zoom := (Z.autoScaleYaxis := true))) `shouldBeOption` "{\"chart\":{\"zoom\":{\"autoScaleYaxis\":true}}}"
        it "fill" $ (C.chart := (Z.zoom := (ZA.zoomedArea := (ZAF.fill := (ZAF.color := "#fff" <> ZAF.opacity := 0.4))))) 
          `shouldBeOption` "{\"chart\":{\"zoom\":{\"zoomedArea\":{\"fill\":{\"color\":\"#fff\",\"opacity\":0.4}}}}}"
        it "stroke" $ (C.chart := (Z.zoom := (ZA.zoomedArea := (ZAS.stroke := (ZAS.color := "#fff" <> ZAS.opacity := 0.4 <> ZAS.width := 1.0))))) 
          `shouldBeOption` "{\"chart\":{\"zoom\":{\"zoomedArea\":{\"stroke\":{\"color\":\"#fff\",\"opacity\":0.4,\"width\":1}}}}}"
    let 
      opts = colors := ["#fff", "#aaa"]
    it "colors" $ opts `shouldBeOption` "{\"colors\":[\"#fff\",\"#aaa\"]}"
    it "labels" $ (labels := ["Beer", "Bar"]) `shouldBeOption` "{\"labels\":[\"Beer\",\"Bar\"]}"
    
    describe "series" do
      it "name" $ (SE.series := [SE.name := "Series 1"]) `shouldBeOption` "{\"series\":[{\"name\":\"Series 1\"}]}"
      describe "data" do
        it "single values" $ (SE.series := [SE.data' := [23.0, 42.0]]) `shouldBeOption` "{\"series\":[{\"data\":[23,42]}]}"
        it "paired values" $ (SE.series := [SE.data' := [[22.0,23.0], [11.0, 42.0]]]) `shouldBeOption` "{\"series\":[{\"data\":[[22,23],[11,42]]}]}"
        it "paired values xy" $ (SE.series := [SE.data' := [(SE.x := 22.0 <> SE.y := 23.0), (SE.x := 11.0 <> SE.y := 42.0)]]) 
          `shouldBeOption` "{\"series\":[{\"data\":[{\"x\":22,\"y\":23},{\"x\":11,\"y\":42}]}]}"
    
    describe "xaxis" do
      it "type" $ (X.xaxis := (X.type' := X.Category)) `shouldBeOption` "{\"xaxis\":{\"type\":\"category\"}}"
      it "categories" $ (X.xaxis := (X.categories := ["Apples", "Bananas"])) `shouldBeOption` "{\"xaxis\":{\"categories\":[\"Apples\",\"Bananas\"]}}"
    
    describe "dataLabels" do
      it "enabled" $ (dataLabels := (DL.enabled := true)) `shouldBeOption` "{\"dataLabels\":{\"enabled\":true}}"
      it "enabledOnSeries" $ (dataLabels := (DL.enabledOnSeries := [1.0, 3.0])) `shouldBeOption` "{\"dataLabels\":{\"enabledOnSeries\":[1,3]}}"
      it "textAnchor" $ (dataLabels := (DL.textAnchor := Middle)) `shouldBeOption` "{\"dataLabels\":{\"textAnchor\":\"middle\"}}"
      it "distributed" $ (dataLabels := (DL.distributed := true)) `shouldBeOption` "{\"dataLabels\":{\"distributed\":true}}" 
      it "offsetX" $ (dataLabels := (DL.offsetX := 1.0)) `shouldBeOption` "{\"dataLabels\":{\"offsetX\":1}}"
      it "offsetY" $ (dataLabels := (DL.offsetY := 3.0)) `shouldBeOption` "{\"dataLabels\":{\"offsetY\":3}}"
      it "style" $ (dataLabels := (DLS.style := (DLS.fontSize := "14px" <> DLS.fontFamily := "Helvetica, Arial" 
        <> DLS.fontWeight := COM.Bold <> DLS.colors := ["#aaa", "#bbb"]))) 
          `shouldBeOption` ("{\"dataLabels\":{\"style\":{\"fontSize\":\"14px\",\"fontFamily\":\"Helvetica, Arial\","
            <> "\"fontWeight\":\"bold\",\"colors\":[\"#aaa\",\"#bbb\"]}}}")
      it "background" $ (dataLabels := (DLB.background := (DLB.enabled := true <> DLB.foreColor := "#fff" <> DLB.padding := 4.0 <>
          DLB.borderRadius := 2.0 <> DLB.borderWidth := 1.0 <> DLB.borderColor := "#fff" <> DLB.opacity := 0.9 <> DLBD.dropShadow := (
          DLBD.enabled := false <> DLBD.top := 1.0 <> DLBD.left := 1.0 <> DLBD.blur := 1.0 <> DLBD.color := "#000" <> DLBD.opacity := 0.45))))
          `shouldBeOption` ("{\"dataLabels\":{\"background\":{\"enabled\":true,\"foreColor\":\"#fff\",\"padding\":4,"
            <> "\"borderRadius\":2,\"borderWidth\":1,\"borderColor\":\"#fff\",\"opacity\":0.9,\"dropShadow\":{"
            <> "\"enabled\":false,\"top\":1,\"left\":1,\"blur\":1,\"color\":\"#000\",\"opacity\":0.45}}}}")
      it "dropShadow" $ (dataLabels := (DLD.dropShadow := (DLD.enabled := false <> DLD.top := 1.0 <> DLD.left := 1.0 
        <> DLD.blur := 1.0 <> DLD.color := "#000" <> DLD.opacity := 0.45))) `shouldBeOption` 
            "{\"dataLabels\":{\"dropShadow\":{\"enabled\":false,\"top\":1,\"left\":1,\"blur\":1,\"color\":\"#000\",\"opacity\":0.45}}}"

    describe "fill" do
      it "colors" $ (F.fill := (F.colors := (["#aaa", "#bbb"]))) `shouldBeOption` "{\"fill\":{\"colors\":[\"#aaa\",\"#bbb\"]}}"
      it "opacity" $ (F.fill := (F.opacity := 0.9)) `shouldBeOption` "{\"fill\":{\"opacity\":0.9}}"
      it "type" $ (F.fill := F.type' := Solid) `shouldBeOption`  "{\"fill\":{\"type\":\"solid\"}}"
      it "gradient" $ (F.fill := FG.gradient := (FG.shade := Dark <> FG.type' := GradientHorizontal <> FG.shadeIntensity := 0.5
        <> FG.gradientToColors := ["#aaa", "#bbb"] <> FG.inverseColors := true <> FG.opacityFrom := 1.0 <> FG.opacityTo := 2.0
        <> FG.stops := [0.0, 50.0, 100.0])) `shouldBeOption`  ("{\"fill\":{\"gradient\":{\"shade\":\"dark\",\"type\":\"horizontal\","
        <> "\"shadeIntensity\":0.5,\"gradientToColors\":[\"#aaa\",\"#bbb\"],\"inverseColors\":true,"
        <> "\"opacityFrom\":1,\"opacityTo\":2,\"stops\":[0,50,100]}}}")
      it "image" $ (F.fill := (FI.image := (FI.src := ["img.png"] <> FI.width := 10.0 <> FI.height := 12.0))) 
        `shouldBeOption` "{\"fill\":{\"image\":{\"src\":[\"img.png\"],\"width\":10,\"height\":12}}}"
      it "pattern" $ (F.fill := (FP.pattern := (FP.style := VerticalLines <> FP.width := 10.0 <> FP.height := 12.0 <> FP.strokeWidth := 2.0)))
        `shouldBeOption` "{\"fill\":{\"pattern\":{\"style\":\"verticalLines\",\"width\":10,\"height\":12,\"strokeWidth\":2}}}"

    describe "grid" do
      it "basics" $ (AG.grid := (AG.show := true <> AG.borderColor := "#90A4AE" <> AG.strokeDashArray := 3.0 <> AG.position := Front)) 
        `shouldBeOption` "{\"grid\":{\"show\":true,\"borderColor\":\"#90A4AE\",\"strokeDashArray\":3,\"position\":\"front\"}}"
      it "xaxis" $ (AG.grid := (AG.position := Front <> AGX.xaxis := (AGXL.lines := (AGXL.show := false)))) 
        `shouldBeOption` "{\"grid\":{\"position\":\"front\",\"xaxis\":{\"lines\":{\"show\":false}}}}"
      it "yaxis" $ (AG.grid := (AG.position := Front <> AGY.yaxis := (AGYL.lines := (AGYL.show := false)))) 
        `shouldBeOption` "{\"grid\":{\"position\":\"front\",\"yaxis\":{\"lines\":{\"show\":false}}}}"
      it "row" $ (AG.grid := (AGR.row := (AGR.colors := ["#aaa"] <> AGR.opacity := 0.5))) 
        `shouldBeOption` "{\"grid\":{\"row\":{\"colors\":[\"#aaa\"],\"opacity\":0.5}}}"
      it "column" $ (AG.grid := (AGC.column := (AGC.colors := ["#aaa"] <> AGC.opacity := 0.5))) 
        `shouldBeOption` "{\"grid\":{\"column\":{\"colors\":[\"#aaa\"],\"opacity\":0.5}}}"
      it "padding" $ (AG.grid := (AGP.padding := (AGP.top := 0.0 <> AGP.right := 0.0 <> AGP.bottom := 0.0 <> AGP.left := 0.0)))
        `shouldBeOption` "{\"grid\":{\"padding\":{\"top\":0,\"right\":0,\"bottom\":0,\"left\":0}}}"

    describe "stroke" do
      it "show" $ (AS.stroke := (AS.show := true)) `shouldBeOption` "{\"stroke\":{\"show\":true}}"
      it "curve"  $ (AS.stroke := (AS.curve := Smooth)) `shouldBeOption` "{\"stroke\":{\"curve\":\"smooth\"}}"
      it "lineCap" $ (AS.stroke := (AS.lineCap := AS.Butt)) `shouldBeOption` "{\"stroke\":{\"lineCap\":\"butt\"}}"
      it "colors" $ (AS.stroke := (AS.colors := ["#fff", "#aaa"])) `shouldBeOption` "{\"stroke\":{\"colors\":[\"#fff\",\"#aaa\"]}}"
      it "width"  $ (AS.stroke := (AS.width := 2.0)) `shouldBeOption` "{\"stroke\":{\"width\":2}}"
      it "dashArray"   $ (AS.stroke := (AS.dashArray := 3.0)) `shouldBeOption` "{\"stroke\":{\"dashArray\":3}}"

    describe "title" do
      it "text" $ (AT.title := (AT.text := "Der Text")) `shouldBeOption` "{\"title\":{\"text\":\"Der Text\"}}"
      it "align" $ (AT.title := (AT.align := Left)) `shouldBeOption` "{\"title\":{\"align\":\"left\"}}"


shouldBeOption :: forall a. Options a -> String -> Aff Unit
shouldBeOption opti expected = (stringify $ Opt.options opti) `shouldEqual` expected

foreign import stringify :: Foreign -> String


