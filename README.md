# HeyCyan Smart Glass Controller
> Practical exam submission — Smart Glasses Android App

## Github Repo
** https://github.com/dylangab/heycyan_demo.git **

---

## Overview

In the process of learning how the HeyCyan SDK works, I discovered a GitHub repo that served as the main reference for implementing the SDK on Android:

**[CyanBridge — Alternative HeyCyan App and SDK](https://github.com/FerSaiyan/Alternative-HeyCyan-App-and-SDK)**

All the implementation in this demo app is based on that repo. The app implements a `GlassClient` interface with two implementations — `RealGlassClient` (calls the actual SDK via MethodChannel) and `MockGlassClient` (simulates the full flow without hardware). It auto-falls back to mock when no real glasses are detected, so the app runs end-to-end on any Android phone.

---

## Build Steps

```bash
git clone https://github.com/dylangab/heycyan_demo.git
cd heycyan_demo
flutter pub get
dart run build_runner build --delete-conflicting-outputs
flutter build apk --debug
# APK → build/app/outputs/flutter-apk/app-debug.apk
```

**Minimum Android:** 8.0 (API 26) · **Signed:** debug keystore

---

## Permissions

`BLUETOOTH` · `BLUETOOTH_SCAN` · `BLUETOOTH_CONNECT` · `ACCESS_FINE_LOCATION`

---

## Architecture

```
Views + ViewModels (Stacked)
    ↓
GlassService
    ↓
GlassClient (interface)
    ├── RealGlassClient   → MethodChannel → MainActivity.kt → SDK .aar
    └── MockGlassClient   → fake data, no hardware needed
```

---

## Real vs Mocked

The SDK `.aar` is compiled and initialized in the app via `BleOperateManager`. The `RealGlassClient` uses `flutter_blue_plus` to scan for devices by name heuristics, connects via `BleOperateManager.connectDirectly(mac)`, triggers photos using `glassesControl(byteArrayOf(0x02, 0x01, 0x01))`, and reads battery via an EventChannel notification `0x05`. Video and audio are controlled via MethodChannel commands.

When no real glasses are found, `MockGlassClient` takes over — returning 3 fake devices (`Q_W610`, `O_G300`, `Q_M01S`), simulating a 2 second connect delay, returning a bundled sample image for photo capture.
---

## Assumptions Not Verified Without Hardware

1. **Photo command bytes** — `byteArrayOf(0x02, 0x01, 0x01)` taken from CyanBridge source. Characteristic UUID not verified.
2. **Photo retrieval** — Real flow is BLE trigger → glasses send WiFi IP 



---

*Built by Mussie Gabrielle — HeyCyan Smart Glasses Practical Exam*