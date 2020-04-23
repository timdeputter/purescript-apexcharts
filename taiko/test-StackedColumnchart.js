const { openBrowser, goto, text, $, closeBrowser, below } = require('taiko');
(async () => {
    try {
        console.log(`Current directory: ${process.cwd()}`);
        await openBrowser();
        await goto("file:///" + process.cwd() + "/examples/StackedColumnchart.html");
        await $(".apexcharts-bar-area").exists();
        await $("g[seriesName=\"PRODUCTxA\"]").exists();
        await $("g[seriesName=\"PRODUCTxB\"]").exists();
        await $("g[seriesName=\"PRODUCTxC\"]").exists();
    } catch (error) {
        console.error(error);
    } finally {
        await closeBrowser();
    }
})();


