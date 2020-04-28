const fs = require('fs');



var desc = {  
    
    plotOptions: {
        bar: {
            horizontal: false,
            startingShape: 'flat',
            endingShape: 'flat',
            columnWidth: '70%',
            barHeight: '70%',
            distributed: false,
            rangeBarOverlap: true,
            colors: {
                ranges: [{
                    from: 0,
                    to: 0,
                    color: undefined
                }],
                backgroundBarColors: [],
                backgroundBarOpacity: 1,
                backgroundBarRadius: 0,
            },
            dataLabels: {
                position: 'top',
                maxItems: 100,
                hideOverflowingLabels: true,
                orientation: 'horizontal'
            }
        },
        bubble: {
            minBubbleRadius: undefined,
            maxBubbleRadius: undefined,
          },
          candlestick: {
            colors: {
              upward: '#00B746',
              downward: '#EF403C'
            },
            wick: {
              useFillColor: true
            }
          },
          heatmap: {
            radius: 2,
            enableShades: true,
            shadeIntensity: 0.5,
            reverseNegativeShade: true,
            distributed: false,
            useFillColorAsStroke: false,
            colorScale: {
              ranges: [{
                  from: 0,
                  to: 0,
                  color: undefined,
                  foreColor: undefined,
                  name: undefined,
              }],
              inverse: false,
              min: undefined,
              max: undefined
            },        
        },
        pie: {
            customScale: 1,
            offsetX: 0,
            offsetY: 0,
            expandOnClick: true,
            dataLabels: {
                offset: 0,
                minAngleToShowLabel: 10
            }, 
            donut: {
              size: '65%',
              background: 'transparent',
              labels: {
                show: false,
                name: {
                  show: true,
                  fontSize: '22px',
                  fontFamily: 'Helvetica, Arial, sans-serif',
                  fontWeight: 600,
                  color: undefined,
                  offsetY: -10
                },
                value: {
                  show: true,
                  fontSize: '16px',
                  fontFamily: 'Helvetica, Arial, sans-serif',
                  fontWeight: 400,
                  color: undefined,
                  offsetY: 16,
                  formatter: function (val) {
                    return val
                  }
                },
                total: {
                  show: false,
                  showAlways: false,
                  label: 'Total',
                  fontSize: '22px',
                  fontFamily: 'Helvetica, Arial, sans-serif',
                  fontWeight: 600,
                  color: '#373d3f',
                  formatter: function (w) {
                    return w.globals.seriesTotals.reduce((a, b) => {
                      return a + b
                    }, 0)
                  }
                }
              }
            },      
          },
          radar: {
            size: undefined,
            offsetX: 0,
            offsetY: 0,
            polygons: {
              strokeColors: '#e8e8e8',
              strokeWidth: 1,
              connectorColors: '#e8e8e8',
              fill: {
                colors: undefined
              }
            }
          },
          radialBar: {
            inverseOrder: false,
            startAngle: 0,
            endAngle: 360,
            offsetX: 0,
            offsetY: 0,
            hollow: {
                margin: 5,
                size: '50%',
                background: 'transparent',
                image: undefined,
                imageWidth: 150,
                imageHeight: 150,
                imageOffsetX: 0,
                imageOffsetY: 0,
                imageClipped: true,
                position: 'front',
                dropShadow: {
                  enabled: false,
                  top: 0,
                  left: 0,
                  blur: 3,
                  opacity: 0.5
                }
            },
            track: {
                show: true,
                startAngle: undefined,
                endAngle: undefined,
                background: '#f2f2f2',
                strokeWidth: '97%',
                opacity: 1,
                margin: 5, 
                dropShadow: {
                    enabled: false,
                    top: 0,
                    left: 0,
                    blur: 3,
                    opacity: 0.5
                }
            },
            dataLabels: {
                show: true,
                name: {
                    show: true,
                    fontSize: '16px',
                    fontFamily: undefined,
                    fontWeight: 600,
                    color: undefined,
                    offsetY: -10
                  },
                  value: {
                    show: true,
                    fontSize: '14px',
                    fontFamily: undefined,
                    fontWeight: 400,
                    color: undefined,
                    offsetY: 16,
                    formatter: function (val) {
                      return val + '%'
                    }
                  },
                  total: {
                    show: false,
                    label: 'Total',
                    color: '#373d3f',
                    fontSize: '16px',
                    fontFamily: undefined,
                    fontWeight: 600,
                    formatter: function (w) {
                      return w.globals.seriesTotals.reduce((a, b) => {
                        return a + b
                      }, 0) / w.globals.series.length + '%'
                    }
                  }
            }
        }
    }

};


var createTypeDefinitions = function(toCheck, currentName, parents, arr, isArray) {
    arr.push({
        filename: getFilename(parents, currentName), 
        code: createFunctions(toCheck, currentName, parents, arr, 
            createModuleAndDataDef(currentName, parents, isArray))
    });
};

var getFilename = function(parents, currentName) {
    return "./src/" + parents.filter(p => p !== "Apexoptions")
        .join("") + capitalizeFLetter(currentName) + ".purs";
};


var createFunctions = function(toCheck, currentName, parents, arr, sourceCode) {
    var names = Object.getOwnPropertyNames(toCheck);
    names.forEach(name => {
        var val = toCheck[name];
        var type = typeof(val);
        console.log(name);
        console.log(type);
        var isArray = false;
        if(Array.isArray(val)){
            val = val[0];
            type = typeof(val);
            isArray = true;
        }
        if(val === null){
            sourceCode += createFn(name, capitalizeFLetter(currentName), 
                "Unknown", isArray);

        } else if(type === 'object'){
            createTypeDefinitions(val, name, parents.concat
                ([capitalizeFLetter(currentName)]), arr, isArray);
        } else {
            sourceCode += createFn(name, capitalizeFLetter(currentName), 
                capitalizeFLetter(type), isArray);
        }    
    });
    return sourceCode;
};


var createModuleAndDataDef = function(currentName, parents, isArray) {
    var modparents = parents.filter(p => p !== "Apexoptions")
    var parentModuleImport = modparents[0] == "Apexoptions" || modparents.length == 0 ? "import Apexcharts" : "import Apexcharts." + joinStrs(modparents);
    var moduleName = modparents.length == 0 
        ? "Apexcharts." + capitalizeFLetter(currentName)
        : "Apexcharts." + joinStrs(modparents) + "." + capitalizeFLetter(currentName); 
    if(parents.length > 0) {
    var sourceCode = `
module ${moduleName} where

import Prelude

${parentModuleImport}
import Data.Functor.Contravariant (cmap)
import Data.Options (Option, Options, opt)
import Data.Options as Opt

`;
    sourceCode += createDataType(currentName, parents, isArray);
    return sourceCode;
    }
    return "";
};

var createDataType = function(currentName, parents, isArray) {
    var sourceCode = 'data ' + capitalizeFLetter(currentName) + "\n\n";
    var fnName = currentName === 'type' ? 'type\'' : (currentName === 'class' ? 'class\'' : currentName);
    if(isArray) {
        sourceCode += fnName + ' :: Option ' + capitalizeFLetter(parents[parents.length-1]) 
            + ' (Array (Options ' + capitalizeFLetter(currentName) + '))\n';
        sourceCode += fnName + ' = cmap (map Opt.options) (opt \"' + currentName + '\")\n\n';    
    } else {
        sourceCode += fnName + ' :: Option ' + capitalizeFLetter(parents[parents.length-1]) 
            + ' (Options ' + capitalizeFLetter(currentName) + ')\n';
        sourceCode += fnName + ' = cmap Opt.options (opt \"' + currentName + '\")\n\n';    
    }
    return sourceCode;    
};

var createFn = function(name, typeName, optTypeName, isArray) {
    var res = "";
    var fnName = name === 'type' ? 'type\'' : name;
    res += fnName + ' :: Option ' + typeName + ' ' 
        + (isArray ? '(Array ' + optTypeName + ')' : optTypeName) + '\n';
    res += fnName + ' = opt \"' + name + "\"\n\n";
    return res;
}

var capitalizeFLetter = function(str) { 
    return str[0].toUpperCase() +  str.slice(1); 
};

var joinStrs = function(arr) {
    var res = "";
    arr.forEach(element => {
        res += element + ".";
    });
    return res.substring(0, res.length - 1);
}

var res = [];
createTypeDefinitions(desc, 'Apexoptions', [], res)
res.filter(e => e.filename !== "./src/Apexoptions.purs").forEach(sc => {
    console.log("Schreibe Datei: " + sc.filename);
    fs.writeFile(sc.filename, sc.code, err =>{ if(err) console.log(err)});

    console.log("done");
});


