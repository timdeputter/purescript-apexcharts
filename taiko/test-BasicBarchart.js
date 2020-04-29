const assert = require("assert");
const { openBrowser, goto, text, $, closeBrowser, below } = require('taiko');
(async () => {
    try {
        console.log(`Current directory: ${process.cwd()}`);
        await openBrowser({args: [" --window-position=2000,3000"]});
        await goto("file:///" + process.cwd() + "/examples/BasicBarchart.html");
        
        [1991,1992,1993,1994,1995,1996,1997,1998,1999].forEach(async el => {
            assert.ok(await text(el.toString(), below($('text.apexcharts-text > tspan'))).exists());
        });
        
        [30,40,35,50,49,60,70,91,125].forEach(async element => {
            assert.ok(await $('.apexcharts-bar-area[val="' + element + '"]').exists());        
        });    
    } catch (error) {
        console.error(error);
    } finally {
        await closeBrowser();
    }
})();


