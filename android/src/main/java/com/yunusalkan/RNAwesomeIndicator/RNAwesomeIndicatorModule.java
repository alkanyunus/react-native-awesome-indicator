package com.yunusalkan.RNAwesomeIndicator;

import com.bigkoo.svprogresshud.SVProgressHUD;
import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;

import static com.facebook.react.bridge.UiThreadUtil.runOnUiThread;

/**
 * Yunus Alkan
 */
public class RNAwesomeIndicatorModule extends ReactContextBaseJavaModule {

    private SVProgressHUD svProgressHUD;

    public RNAwesomeIndicatorModule(ReactApplicationContext reactContext) {
        super(reactContext);
    }

    @Override
    public String getName() {
        return "RNAwesomeIndicator";
    }

    @ReactMethod
    public void show(final String message) {
        if (svProgressHUD == null) {
            svProgressHUD = new SVProgressHUD(getCurrentActivity());
        }

        runOnUiThread(new Runnable() {
            @Override
            public void run() {
                if (message != null || message.isEmpty()) {
                    svProgressHUD.showWithMaskType(SVProgressHUD.SVProgressHUDMaskType.Gradient);
                }
                else {
                    svProgressHUD.showWithStatus(message, SVProgressHUD.SVProgressHUDMaskType.Gradient);
                }

            }
        });
    }

    @ReactMethod
    public void dismiss() {
        runOnUiThread(new Runnable() {
            @Override
            public void run() {
                if (svProgressHUD != null) {
                    svProgressHUD.dismissImmediately();
                }
            }
        });
    }

  /* TODO
    @ReactMethod
    public void updateSettings(HashMap<String, Object> settings) {

        String foregorundColor = (String) settings.get("foregroundColor");
        if (!foregorundColor.isEmpty()) {

        }
    }*/
}
