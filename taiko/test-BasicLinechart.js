const { openBrowser, goto, text, $, closeBrowser, below } = require('taiko');
(async () => {
    try {
        console.log(`Current directory: ${process.cwd()}`);
        await openBrowser();
        await goto("file:///" + process.cwd() + "/examples/BasicLinechart.html");
        
        ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep"].forEach(async el => {
            await text(el.toString(), below($('text.apexcharts-text > tspan'))).exists()
        });
        $('line.apexcharts-gridline').exists();
        $('path.apexcharts-line').exists();
        text("150").exists();
        text("Product Trends by Month").exists();
    } catch (error) {
        console.error(error);
    } finally {
        await closeBrowser();
    }
})();


