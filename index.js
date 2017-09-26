'use strict';

var RNAwesomeIndicatorModule = require('react-native').NativeModules.RNAwesomeIndicator;
import {Platform} from "react-native";

// iOS only
var options = {
    foregroundColor: '#fff',
    backgroundColor: '#000'
};

var RNAwesomeIndicator = function () {
    this.options = options;
};

RNAwesomeIndicator.prototype.setOptions = function(settings) {
    this.options = settings;

    if (Platform.OS === 'ios') {
        RNAwesomeIndicatorModule.updateSettings(this.options);
    }
};

RNAwesomeIndicator.prototype.show = function(message = '') {
    RNAwesomeIndicatorModule.show(message);
};

RNAwesomeIndicator.prototype.hide = function() {
    RNAwesomeIndicatorModule.dismiss();
};

export default new RNAwesomeIndicator();





