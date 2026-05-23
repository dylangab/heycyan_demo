package com.example.heycyan_demo

import android.app.Application
import android.os.Handler
import android.os.Looper
import android.util.Log
import com.oudmon.ble.base.bluetooth.BleOperateManager
import com.oudmon.ble.base.communication.LargeDataHandler

class MyApplication : Application() {

    override fun onCreate() {
        super.onCreate()

        // Delay SDK init to avoid conflicting with Flutter's startup sequence
        Handler(Looper.getMainLooper()).postDelayed({
            initBle()
        }, 1000)
    }

    private fun initBle() {
        try {
            LargeDataHandler.getInstance()
            BleOperateManager.getInstance(this)
            BleOperateManager.getInstance().setApplication(this)
            BleOperateManager.getInstance().init()
            Log.d("HeyCyan", "✅ SDK initialized successfully")
        } catch (e: Exception) {
            Log.e("HeyCyan", "❌ SDK init failed: ${e.message}")
            // Important: we catch the exception so the app never crashes
            // even if SDK init fails without physical glasses
        }
    }
}