var forwardPorts = [];
var lastForwardPort;
var lastMsgSeq = 0;
var lastFunc = null;
var communicator = new MessageHostCommunicator();
chrome.runtime.onConnect.addListener(function (port) {
    if (!port.sender.tab)
        return;
    console.log("Tab port connected. Id: " + port.sender.tab.id);
    var customPort = port;
    customPort.windowId = port.sender.tab.windowId;
    customPort.tabId = port.sender.tab.id;
    forwardPorts[port.sender.tab.id] = customPort;
    port.onMessage.addListener(function (message) {
        lastForwardPort = null;
        message.tabId = customPort.tabId;
        message.wndid = customPort.windowId;
        message.url = customPort.sender.url;
        message.status = customPort.sender.tab.status;
        communicator.post(message);
    });
    port.onDisconnect.addListener(function (disconnectedPort) {
        console.log("Tab port disconnected. Id: " + disconnectedPort.sender.tab.id);
        if (lastForwardPort) {
            if (lastFunc == "RunScript") {
                communicator.post({ f: "RunScript", _n: lastMsgSeq, result: "" });
            }
            else {
                communicator.post({ err: "Tab with id " + lastForwardPort.tabId + " is no longer available.", _n: lastMsgSeq });
            }
            lastForwardPort = null;
            lastFunc = null;
        }
        if (forwardPorts[disconnectedPort.sender.tab.id] == disconnectedPort) {
            console.log("Removing disconnected tab port from registry");
            forwardPorts[disconnectedPort.sender.tab.id] = null;
            delete forwardPorts[disconnectedPort.sender.tab.id];
        }
        else {
            console.warn("Disconnected tab port not found in the registry");
        }
    });
});
chrome.windows.onCreated.addListener(function (window) {
    console.log("Window created. WindowId: " + window.id);
    communicator.post({ notify: "window_created", wndid: window.id });
});
chrome.windows.onRemoved.addListener(function (windowId) {
    console.log("Window removed. WindowId: " + windowId);
    communicator.post({ notify: "window_removed", wndid: windowId });
});
chrome.tabs.onActivated.addListener(function (info) {
    console.log("Tab activated. Id: " + info.tabId + ", WindowId: " + info.windowId);
    communicator.post({ notify: "tab_activated", tabid: info.tabId, wndid: info.windowId });
});
chrome.tabs.onAttached.addListener(function (tabId, info) {
    console.log("Tab attached. Id: " + tabId + ", WindowId: " + info.newWindowId);
    communicator.post({ notify: "tab_attached", tabid: tabId, newwndid: info.newWindowId });
});
chrome.tabs.onDetached.addListener(function (tabId, info) {
    console.log("Tab detached. Id: " + tabId + ", Info: " + JSON.stringify(info));
    communicator.post({ notify: "tab_detached", tabid: tabId, oldwndid: info.oldWindowId });
});
chrome.tabs.onUpdated.addListener(function (tabId, info, tab) {
    console.log("Tab updated. Id: " + tabId + ", Info: " + JSON.stringify(info));
    communicator.post({ notify: "tab_updated", tabid: tabId, info: info, tab: tab });
});
chrome.tabs.onRemoved.addListener(function (tabId, info) {
    console.log("Tab removed. Id: " + tabId + ", WindowId: " + info.windowId);
    communicator.post({ notify: "tab_removed", tabid: tabId, wndid: info.windowId, iswindowclosing: info.isWindowClosing });
});
communicator.on("GetAllWindows", function (message, responseFunction) {
    try {
        chrome.windows.getAll({ populate: true, windowTypes: ["normal"] }, function (windows) { return responseFunction({ windows: windows }); });
    }
    catch (e) {
        responseFunction({ err: 'Error ' + e });
    }
});
communicator.on("GetAllTabs", function (message, responseFunction) {
    try {
        chrome.tabs.query({ windowId: message.arg0 }, function (tabs) { return responseFunction({ tabs: tabs }); });
    }
    catch (e) {
        responseFunction({ err: 'Error ' + e });
    }
});
communicator.on("ActivateTab", function (message, responseFunction) {
    try {
        chrome.tabs.update(message.arg0, { active: true }, function (tab) { return responseFunction({ tab: tab }); });
    }
    catch (e) {
        responseFunction({ err: 'Error ' + e });
    }
});
communicator.on("RefreshPage", function (message, responseFunction) {
    try {
        var tabId = message.arg0 == -1 ? null : message.arg0;
        chrome.tabs.reload(tabId, { bypassCache: true }, function () { return responseFunction({}); });
    }
    catch (e) {
        responseFunction({ err: 'Error ' + e });
    }
});
communicator.on("NavigateToUrl", function (message, responseFunction) {
    try {
        var tabId = message.arg1 == -1 ? null : message.arg1;
        chrome.tabs.update(tabId, { url: message.arg0 }, function () { return responseFunction({}); });
    }
    catch (e) {
        responseFunction({ err: 'Error ' + e });
    }
});
communicator.on("CreateNewTab", function (message, responseFunction) {
    try {
        chrome.tabs.create({ url: message.arg0 }, function (tab) { return responseFunction({ id: tab.id, url: tab.url, active: tab.active, title: tab.title }); });
    }
    catch (e) {
        responseFunction({ err: 'Error ' + e });
    }
});
communicator.on("CloseTab", function (message, responseFunction) {
    try {
        chrome.tabs.remove(message.arg0, function () { return responseFunction({}); });
    }
    catch (e) {
        responseFunction({ err: 'Error ' + e });
    }
});
communicator.on("ClearCookies", function (message, responseFunction) {
    try {
        chrome.browsingData.removeCookies({}, responseFunction({}));
    }
    catch (e) {
        responseFunction({ err: 'Error ' + e });
    }
});
communicator.on("ClearCache", function (message, responseFunction) {
    try {
        chrome.browsingData.removeCache({}, function () { return responseFunction({}); });
    }
    catch (e) {
        responseFunction({ err: 'Error ' + e });
    }
});
communicator.on("SetZoom", function (message, responseFunction) {
    try {
        var zoom = message.arg1;
        var tabId = message.arg0 == -1 ? null : message.arg0;
        chrome.tabs.setZoom(tabId, zoom, function () { return responseFunction({}); });
    }
    catch (e) {
        responseFunction({ err: 'Error ' + e + ' ' + e.stack });
    }
});
communicator.on("GetZoom", function (message, responseFunction) {
    try {
        var tabId = message.arg0 == -1 ? null : message.arg0;
        chrome.tabs.getZoom(tabId, function (zoom) { return responseFunction({ zoom: zoom }); });
    }
    catch (e) {
        responseFunction({ err: 'Error ' + e + ' ' + e.stack });
    }
});
communicator.addDefaultHandler(function (message, responseFunction) {
    var port = forwardPorts[message.tabid];
    if (port) {
        lastForwardPort = port;
        try {
            lastFunc = message.f;
            lastMsgSeq = message._n;
            port.postMessage(message);
        }
        catch (e) {
            responseFunction({ err: "Tab msg post failed" });
        }
    }
    else {
        responseFunction({ err: "Tab id does not exist" });
    }
});
communicator.setupNativeMessageHost();
try {
    communicator.post({ notify: "plugin_init" });
    console.log("Background Script: OK");
}
catch (e) {
    console.error("Post 'plugin_init' message failed: " + e);
}
