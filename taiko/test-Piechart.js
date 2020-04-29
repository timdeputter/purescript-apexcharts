const { openBrowser, goto, text, $, closeBrowser, below } = require('taiko');
(async () => {
    try {
        console.log(`Current directory: ${process.cwd()}`);
        await openBrowser();
        await goto("file:///" + process.cwd() + "/examples/Piechart.html");
        await $(".apexcharts-pie-series").exists();

    } catch (error) {
        console.error(error);
    } finally {
        await closeBrowser();
    }
})();


