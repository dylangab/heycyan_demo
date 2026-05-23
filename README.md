# HeyCyan Smart Glass Controller

## Practical Exam Submission — Smart Glasses Android Companion App

Built by **Mussie Gabrielle**



> Note: Signed with a debug keystore. Sideload directly — no Android Studio or rebuilding required.

---

# Overview

A production-ready Flutter Android application that interfaces with HeyCyan smart glasses using a decoupled, highly testable architecture.

To guarantee an end-to-end evaluation without access to physical hardware, the app implements a clean `GlassClient` abstraction backed by an automated hardware fallback mechanism.

## RealGlassClient

Communicates with the actual native HeyCyan SDK via a production-grade `MethodChannel` and `EventChannel` bridge.

## MockGlassClient

Simulates hardware connections, state transitions, and media loops seamlessly when no active peripheral is found.


### GlassService

Centralized engine handling business logic while ensuring zero native SDK leakage into the UI layers.

### GlassClient (Interface)

Explicit operational contracts implemented independently by the real and mocked variants.


---

# Architecture & Tech Stack

## Flutter Layer (MVVM via Stacked)

### UI & ViewModels

Clean, minimalist presentation layer built using the Stacked architecture pattern.

---

## Native Android Layer

### MyApplication.kt

Bootstraps global dependencies and initializes the underlying BLE framework:

```kotlin
BleOperateManager.init()
```

### MainActivity.kt

Serves as the high-performance platform channel hub managing hardware commands

---

# Core Dependencies

```yaml
dependencies:
  flutter_blue_plus: ^1.32.0   # BLE Scanning and Telemetry
  stacked: ^3.x.x              # Clean Architecture / MVVM Frame
  stacked_services: ^1.x.x     # Decoupled Navigation & Dialogs
  freezed_annotation: ^2.x.x   # Immutable State Models
  shared_preferences: ^2.x.x   # Persistent Device Profiles
```

---

# Embedded SDK Integration

The app compiles directly against the core package running the companion framework, sourced from an alternative community-maintained repository rather than the official HeyCyan codebase.

| Item | Details |
|---|---|
| Dependency Path | `android/app/libs/glasses_sdk_20250723_v01.aar` |
| Implementation Source | `FerSaiyan/Alternative-HeyCyan-App-and-SDK` |
| Core Drivers | Reverse-engineered implementation patterns using `BleOperateManager` and `LargeDataHandler` |

This open-source alternative proved instrumental in reversing and understanding the underlying SDK architecture, providing explicit implementation patterns for tracking connection lifecycles and packaging system commands.

---

# Matrix: Real vs. Mocked Implementation

| Feature | Real (`RealGlassClient + SDK`) | Mock (`MockGlassClient / Simulator`) |
|---|---|---|
| BLE Discovery | `flutter_blue_plus` using native heuristics (`Q_`, `O_`, `cyan`) | Returns 3 cached profiles (`Q_W610`, `O_G300`, `Q_M01S`) |
| Linkage | `BleOperateManager.connectDirectly(mac)` | Simulates connection lifecycle with a 2s delay |
| Photo Shutter | `LargeDataHandler` payload (`byteArrayOf(0x02, 0x01, 0x01)`) | Resolves a local sample asset after a 1s simulation |
| Telemetry | Native broadcast receiver listeners | Simulates steady state: `78% Battery`, `v2.3.1 Firmware` |
| Media Toggles | Intercepts background capture loops via platform channels | Simulates state change confirmation with a `500ms` delay |

---

# Hardware Assumptions (Awaiting Device Verification)

## Live Discovery Baseline

The application initiates a real BLE peripheral scan when searching for physical hardware.

Because no physical device was available during benchmarking, the app automatically times out after 5 seconds and switches to mock execution.

As a result, exact execution behavior and native thread synchronization during physical handshakes could not be fully verified.

---

## Photo Protocol

Payload byte sequences such as:

```kotlin
byteArrayOf(0x02, 0x01, 0x01)
```

and telemetry offsets are derived directly from alternative repository specifications and require live validation.

---

## Multi-Bearer Transport Sync

Media downloads follow a hybrid transport pipeline:

```text
BLE Handshake ➔ Wi-Fi P2P Credential Exchange ➔ HTTP Payload Pull
```

---

# Quick Start & Build

## Prerequisites

- Flutter 3.x
- Java 17
- Android Studio (Gradle toolchain)

### Target OS

Android 8.0 (API 26) or later to support background broadcast APIs.