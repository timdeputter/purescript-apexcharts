const assert = require("assert");
const { openBrowser, goto, text, $, closeBrowser, below } = require('taiko');
(async () => {
    try {
        console.log(`Current directory: ${process.cwd()}`);
        await openBrowser({args: [" --window-position=2000,3000"]});
        await goto("file:///" + process.cwd() + "/examples/BasicLinechart.html");
        
        ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep"].forEach(async el => {
            assert.ok(await text(el.toString(), below($('text.apexcharts-text > tspan'))).exists());
        });
        assert.ok(await $('line.apexcharts-gridline').exists());
        assert.ok(await $('path.apexcharts-line').exists());
        assert.ok(await text("150").exists());
        assert.ok(await text("Product Trends by Month").exists());
    } catch (error) {
        console.error(error);
    } finally {
        await closeBrowser();
    }
})();


