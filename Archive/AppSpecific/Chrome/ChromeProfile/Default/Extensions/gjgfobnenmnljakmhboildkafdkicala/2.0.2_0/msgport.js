var MessageHostCommunicator = (function () {
    function MessageHostCommunicator() {
        this.retryTimeout = 10000;
        this.applicationName = "com.robin.messagehost";
        this.handler = [];
    }
    MessageHostCommunicator.prototype.onRecieve = function (message) {
        var _this = this;
        if (message.f) {
            var handler = this.handler[message.f];
            if (handler) {
                handler(message, function (response) {
                    if (!response)
                        response = _this.defaultResp;
                    response.f = message.f;
                    response._n = message._n;
                    _this.msgPort.postMessage(response);
                });
            }
            else if (this.defaultHandler) {
                this.defaultHandler(message, function (response) {
                    if (!response)
                        response = _this.defaultResp;
                    response.f = message.f;
                    response._n = message._n;
                    _this.msgPort.postMessage(response);
                });
            }
        }
    };
    MessageHostCommunicator.prototype.setupNativeMessageHost = function () {
        var _this = this;
        try {
            this.msgPort = chrome.runtime.connectNative(this.applicationName);
            this.msgPort.onMessage.addListener(function (m) { return _this.onRecieve(m); });
            this.msgPort.onDisconnect.addListener(function (evt) {
                console.info("Port has been disconnected. " + JSON.stringify(evt));
                setTimeout(function () {
                    _this.setupNativeMessageHost();
                    initializeTabs();
                }, _this.retryTimeout);
            });
        }
        catch (e) {
            console.warn("Failed to create connection to Robin message host. " + e);
        }
    };
    MessageHostCommunicator.prototype.connectToBackgroundScript = function () {
        var _this = this;
        try {
            this.msgPort = chrome.runtime.connect();
            this.msgPort.onMessage.addListener(function (m) { return _this.onRecieve(m); });
            this.msgPort.onDisconnect.addListener(function (port) { return console.warn("Message Port has been disconnected. " + port); });
        }
        catch (e) {
            console.error("Failed to create connection to background page. " + JSON.stringify(e));
        }
    };
    MessageHostCommunicator.prototype.on = function (functionName, handler) {
        this.handler[functionName] = handler;
    };
    MessageHostCommunicator.prototype.addDefaultHandler = function (handler) {
        this.defaultHandler = handler;
    };
    MessageHostCommunicator.prototype.post = function (message) {
        console.log(JSON.stringify(message));
        this.msgPort.postMessage(message);
    };
    return MessageHostCommunicator;
}());
function initializeTabs() {
    chrome.tabs.query({}, function (tabs) {
        for (var _i = 0, tabs_1 = tabs; _i < tabs_1.length; _i++) {
            var tab = tabs_1[_i];
            chrome.tabs.sendMessage(tab.id, {});
        }
    });
}
