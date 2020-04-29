const { openBrowser, goto, text, $, closeBrowser, below } = require('taiko');
(async () => {
    try {
        console.log(`Current directory: ${process.cwd()}`);
        await openBrowser({args: [" --window-position=2000,3000"]});
        await goto("file:///" + process.cwd() + "/examples/BasicLinechart.html");
        
        ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep"].forEach(async el => {
            await text(el.toString(), below($('text.apexcharts-text > tspan'))).exists()
        });
        await $('line.apexcharts-gridline').exists();
        await $('path.apexcharts-line').exists();
        await text("150").exists();
        await text("Product Trends by Month").exists();
    } catch (error) {
        console.error(error);
    } finally {
        await closeBrowser();
    }
})();


