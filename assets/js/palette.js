import "./custom.js"
import topbar from "../vendor/topbar"
import ApexChartHook from './apexChartHook';
// import Clipboard from "@ryangjchandler/alpine-clipboard"

import "phoenix_html"
import { Socket } from "phoenix"
import { LiveSocket } from "phoenix_live_view"

// Alpine.plugin(Clipboard)

let Hooks = {
    ApexChartHook
}

// Show progress bar on live navigation and form submits
// Show progress bar on live navigation and form submits. Only displays if still
// loading after 120 msec
topbar.config({ barColors: { 0: "#29d" }, shadowColor: "rgba(0, 0, 0, .3)" })

let topBarScheduled = undefined;
window.addEventListener("phx:page-loading-start", () => {
    if (!topBarScheduled) {
        topBarScheduled = setTimeout(() => topbar.show(), 120);
    };
});
window.addEventListener("phx:page-loading-stop", () => {
    clearTimeout(topBarScheduled);
    topBarScheduled = undefined;
    topbar.hide();
});

Alpine.start()

let csrfToken = document.querySelector("meta[name='csrf-token']").getAttribute("content")
let liveSocket = new LiveSocket("/live", Socket, {
    hooks: Hooks,
    dom: {
        // make LiveView work nicely with alpinejs
        onBeforeElUpdated(from, to) {
            if (from.__x) {
                window.Alpine.clone(from.__x, to);
            }
        },
    },
    params: {
        _csrf_token: csrfToken
    }
})

// connect if there are any LiveViews on the page
liveSocket.connect()

// expose liveSocket on window for web console debug logs and latency simulation:
// >> liveSocket.enableDebug()
// >> liveSocket.enableLatencySim(1000)  // enabled for duration of browser session
// >> liveSocket.disableLatencySim()
window.liveSocket = liveSocket
