package com.example.heycyan_demo

import android.os.Bundle
import android.util.Log
import com.oudmon.ble.base.bluetooth.BleOperateManager
import io.flutter.embedding.android.FlutterActivity
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity() {

    private val CHANNEL = "com.example/heycyan"

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setupMethodChannel()
    }

    private fun setupMethodChannel() {
        MethodChannel(flutterEngine!!.dartExecutor.binaryMessenger, CHANNEL)
            .setMethodCallHandler { call, result ->
                when (call.method) {
                    "testSdk" -> {
                        try {
                            val ble = BleOperateManager.getInstance()
                            Log.d("HeyCyan", "SDK instance: $ble")
                            result.success("SDK responded: $ble")
                        } catch (e: Exception) {
                            result.error("ERROR", e.message, null)
                        }
                    }
                    "connect" -> {
                        try {
                            val mac = call.argument<String>("mac")!!
                            BleOperateManager.getInstance().connectDirectly(mac)
                            result.success(null)
                        } catch (e: Exception) {
                            result.error("CONNECT_ERROR", e.message, null)
                        }
                    }
                    "takePicture" -> {
                        try {
                            // Real command: byteArrayOf(0x02, 0x01, 0x01)
                            // Photo comes back via EventChannel after WiFi IP notification
                            result.success(null)
                        } catch (e: Exception) {
                            result.error("PHOTO_ERROR", e.message, null)
                        }
                    }
                    "disconnect" -> {
                        try {
                            BleOperateManager.getInstance().unBindDevice()
                            result.success(null)
                        } catch (e: Exception) {
                            result.error("DISCONNECT_ERROR", e.message, null)
                        }
                    }
                    else -> result.notImplemented()
                }
            }
    }
}