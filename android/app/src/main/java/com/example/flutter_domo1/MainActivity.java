package com.example.flutter_domo1;

import io.flutter.embedding.android.FlutterActivity;

import android.os.Bundle;

import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugins.GeneratedPluginRegistrant;

import android.view.KeyEvent;

import androidx.annotation.NonNull;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;

public class MainActivity extends FlutterActivity {

    private final String CHANNEL = "android/back/desktop";

       @Override
    public void configureFlutterEngine(@NonNull FlutterEngine flutterEngine) {
        new MethodChannel(flutterEngine.getDartExecutor(), CHANNEL).setMethodCallHandler(
                new MethodChannel.MethodCallHandler() {
                    @Override
                    public void onMethodCall(@NonNull MethodCall call, @NonNull MethodChannel.Result result) {
                        if (call.method.equals("backDesktop")) {
                            result.success(true);
                            moveTaskToBack(false);
                        }
                    }
                }
        );
        super.configureFlutterEngine(flutterEngine);

    }


}
