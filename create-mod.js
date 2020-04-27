const fs = require('fs');



var desc = {  legend: {
    show: true,
    showForSingleSeries: false,
    showForNullSeries: true,
    showForZeroSeries: true,
    position: 'bottom',
    horizontalAlign: 'center', 
    floating: false,
    fontSize: '14px',
    fontFamily: 'Helvetica, Arial',
    fontWeight: 400,
    formatter: undefined,
    inverseOrder: false,
    width: undefined,
    height: undefined,
    tooltipHoverFormatter: undefined,
    offsetX: 0,
    offsetY: 0,
    labels: {
        colors: undefined,
        useSeriesColors: false
    },
    markers: {
        width: 12,
        height: 12,
        strokeWidth: 0,
        strokeColor: '#fff',
        fillColors: undefined,
        radius: 12,
        customHTML: undefined,
        onClick: undefined,
        offsetX: 0,
        offsetY: 0
    },
    itemMargin: {
        horizontal: 5,
        vertical: 0
    },
    onItemClick: {
        toggleDataSeries: true
    },
    onItemHover: {
        highlightDataSeries: true
    },
}};


var createTypeDefinitions = function(toCheck, currentName, parents, arr) {
    arr.push({
        filename: getFilename(parents, currentName), 
        code: createFunctions(toCheck, currentName, parents, arr, 
            createModuleAndDataDef(currentName, parents))
    });
};

var getFilename = function(parents, currentName) {
    return "./src/" + parents.filter(p => p !== "Apexoptions").join("") + capitalizeFLetter(currentName) + ".purs";
};


var createFunctions = function(toCheck, currentName, parents, arr, sourceCode) {
    var names = Object.getOwnPropertyNames(toCheck);
    names.forEach(name => {
        var val = toCheck[name];
        var type = typeof(val);
        if(type === 'object'){
            console.log(parents);
            createTypeDefinitions(val, name, parents.concat([capitalizeFLetter(currentName)]), arr);
        } else {
            sourceCode += createFn(name, capitalizeFLetter(currentName), capitalizeFLetter(type));
        }
    });
    return sourceCode;
};


var createModuleAndDataDef = function(currentName, parents) {
    var modparents = parents.filter(p => p !== "Apexoptions")
    var parentModuleImport = modparents[0] == "Apexoptions" || modparents.length == 0 ? "import Apexcharts" : "import Apexcharts." + joinStrs(modparents);
    var moduleName = modparents.length == 0 
        ? "Apexcharts." + capitalizeFLetter(currentName)
        : "Apexcharts." + joinStrs(modparents) + "." + capitalizeFLetter(currentName); 
    if(parents.length > 0) {
    var sourceCode = `
module ${moduleName} where

${parentModuleImport}
import Data.Functor.Contravariant (cmap)
import Data.Options (Option, Options, opt)
import Data.Options as Opt

`;
    sourceCode += createDataType(currentName, parents);
    return sourceCode;
    }
    return "";
};

var createDataType = function(currentName, parents) {
    var sourceCode = 'data ' + capitalizeFLetter(currentName) + "\n\n";
    sourceCode += currentName + ' :: Option ' + capitalizeFLetter(parents[parents.length-1]) + ' (Options ' + capitalizeFLetter(currentName) + ')\n';
    sourceCode += currentName + ' = cmap Opt.options (opt \"' + currentName + '\")\n\n';
    return sourceCode;    
};

var createFn = function(name, typeName, optTypeName) {
    var res = "";
    res += name + ' :: Option ' + typeName + ' ' + optTypeName + '\n';
    res += name + ' = opt \"' + name + "\"\n\n";
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


