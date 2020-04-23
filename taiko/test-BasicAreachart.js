const { openBrowser, goto, text, $, closeBrowser, below } = require('taiko');
(async () => {
    try {
        console.log(`Current directory: ${process.cwd()}`);
        await openBrowser();
        await goto("file:///" + process.cwd() + "/examples/BasicAreachart.html");
        
        ["00:00","01:00","02:00","03:00","06:00"].forEach(async el => {
            await text(el.toString(), below($('text.apexcharts-text > tspan'))).exists()
        });

        $(".apexcharts-area").exists();

    } catch (error) {
        console.error(error);
    } finally {
        await closeBrowser();
    }
})();


