const { openBrowser, goto, text, $, closeBrowser, below } = require('taiko');
(async () => {
    try {
        console.log(`Current directory: ${process.cwd()}`);
        await openBrowser();
        await goto("file:///" + process.cwd() + "/examples/Stackedchart.html");
        
        await $('path.apexcharts-area').exists();

    } catch (error) {
        console.error(error);
    } finally {
        await closeBrowser();
    }
})();


