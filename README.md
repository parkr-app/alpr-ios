# AlprKit for iOS

On-device license plate recognition (ALPR/ANPR) for iOS apps written in Swift. AlprKit is the native SDK behind [react-native-alpr](https://github.com/parkr-app/react-native-alpr); one license key works for both.

<p align="center">
  <img src="https://alpr.parkr.app/screenshots/ios-scan-bmw-i3.webp" width="200" alt="iPhone: live scan reading EL 40489">
  <img src="https://alpr.parkr.app/screenshots/ios-photo-tesla-model-s.webp" width="200" alt="iPhone: two Tesla plates read from a photo">
</p>
<p align="center"><sub>Photos: Norsk Elbilforening and Mariordo, <a href="https://creativecommons.org/licenses/by/2.0/">CC BY 2.0</a>, via <a href="https://commons.wikimedia.org/wiki/Category:Electric_vehicle_license_plates_of_Norway">Wikimedia Commons</a>, cropped.</sub></p>

- Fully offline, runs on the device (Core ML)
- Live camera scanning at 30 FPS with Neural Engine or GPU acceleration
- Plate text, country and bounding box, several plates per frame, [65 countries](#supported-countries)
- Stable results: reads from several frames are combined into one answer, and boxes move smoothly
- One-shot scanning that waits for a certain read instead of taking the first blurry frame
- Recognition in photos

**The basic scanner is free, also in production.** PRO features need a license key in release builds and work without one in debug, simulator, TestFlight and ad-hoc builds. Get a key at [alpr.parkr.app](https://alpr.parkr.app).

## Platforms

One license key covers your app on every platform.

| Platform | Package | Repository |
| --- | --- | --- |
| Expo and React Native | `react-native-alpr` on npm | [parkr-app/react-native-alpr](https://github.com/parkr-app/react-native-alpr) |
| iOS (Swift) | `AlprKit` through Swift Package Manager | [parkr-app/alpr-ios](https://github.com/parkr-app/alpr-ios) |
| Android (Kotlin) | `app.parkr:alpr` | [parkr-app/alpr-android](https://github.com/parkr-app/alpr-android) |
| Flutter | `flutter_alpr`, in development | [parkr-app/flutter_alpr](https://github.com/parkr-app/flutter_alpr) |
| Capacitor | `capacitor-alpr`, in development | [parkr-app/capacitor-alpr](https://github.com/parkr-app/capacitor-alpr) |

## Supported countries

The model reads plates from 65 countries and reports the country of each plate as `country` and its ISO code as `countryCode`:

🇦🇱 Albania (`AL`), 🇦🇩 Andorra (`AD`), 🇦🇷 Argentina (`AR`), 🇦🇲 Armenia (`AM`), 🇦🇺 Australia (`AU`), 🇦🇹 Austria (`AT`), 🇦🇿 Azerbaijan (`AZ`), 🇧🇭 Bahrain (`BH`), 🇧🇾 Belarus (`BY`), 🇧🇪 Belgium (`BE`), 🇧🇦 Bosnia and Herzegovina (`BA`), 🇧🇷 Brazil (`BR`), 🇧🇬 Bulgaria (`BG`), 🇰🇭 Cambodia (`KH`), 🇨🇦 Canada (`CA`), 🇭🇷 Croatia (`HR`), 🇨🇾 Cyprus (`CY`), 🇨🇿 Czech Republic (`CZ`), 🇩🇰 Denmark (`DK`), 🇪🇪 Estonia (`EE`), 🇫🇮 Finland (`FI`), 🇫🇷 France (`FR`), 🇬🇪 Georgia (`GE`), 🇩🇪 Germany (`DE`), 🇬🇮 Gibraltar (`GI`), 🇬🇷 Greece (`GR`), 🇬🇬 Guernsey (`GG`), 🇭🇺 Hungary (`HU`), 🇮🇸 Iceland (`IS`), 🇮🇩 Indonesia (`ID`), 🇮🇪 Ireland (`IE`), 🇮🇱 Israel (`IL`), 🇮🇹 Italy (`IT`), 🇱🇻 Latvia (`LV`), 🇱🇮 Liechtenstein (`LI`), 🇱🇹 Lithuania (`LT`), 🇱🇺 Luxembourg (`LU`), 🇲🇾 Malaysia (`MY`), 🇲🇹 Malta (`MT`), 🇲🇽 Mexico (`MX`), 🇲🇩 Moldova (`MD`), 🇲🇨 Monaco (`MC`), 🇲🇪 Montenegro (`ME`), 🇳🇱 Netherlands (`NL`), 🇳🇿 New Zealand (`NZ`), 🇲🇰 North Macedonia (`MK`), 🇳🇴 Norway (`NO`), 🇵🇱 Poland (`PL`), 🇵🇹 Portugal (`PT`), 🇶🇦 Qatar (`QA`), 🇷🇴 Romania (`RO`), 🇸🇲 San Marino (`SM`), 🇷🇸 Serbia (`RS`), 🇸🇬 Singapore (`SG`), 🇸🇰 Slovakia (`SK`), 🇸🇮 Slovenia (`SI`), 🇪🇸 Spain (`ES`), 🇸🇪 Sweden (`SE`), 🇨🇭 Switzerland (`CH`), 🇹🇭 Thailand (`TH`), 🇹🇷 Turkey (`TR`), 🇺🇦 Ukraine (`UA`), 🇬🇧 United Kingdom (`GB`), 🇺🇸 United States (`US`), 🇻🇳 Vietnam (`VN`).

## Installation

Swift Package Manager: add `https://github.com/parkr-app/alpr-ios` and the `AlprKit` product. Requires iOS 15.1.

Add `NSCameraUsageDescription` to `Info.plist`, and your key as `AlprLicenseKey` (String).

## Live camera

```swift
import AlprKit
import AVFoundation

final class ScannerViewController: UIViewController, AlprCameraViewDelegate {
  private let camera = AlprCameraView()

  override func viewDidLoad() {
    super.viewDidLoad()
    camera.frame = view.bounds
    camera.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    camera.delegate = self
    view.addSubview(camera)
  }

  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    AVCaptureDevice.requestAccess(for: .video) { _ in
      DispatchQueue.main.async { self.camera.isActive = true }
    }
  }

  func alprCameraView(_ view: AlprCameraView, didRecognize plate: AlprPlate) {
    print("Read", plate.plate, plate.countryCode ?? "")
  }

  func alprCameraView(_ view: AlprCameraView, didFailWith error: AlprError) {
    print(error.code.rawValue, error.message)
  }
}
```

`AlprCameraView` properties: `isActive`, `showFps`, `mockImage`, `recognizesPlates`, `scansPlates`, and the PRO properties `throttle`, `torch`, `zoom`, `scanRegion`, `overlayStyle`, `detectionThreshold`, `ocrThreshold`, `accelerator`. Turning off `showOverlay` or `showScanRegion` is PRO.

Delegate methods:

- `didRecognize`: each plate once, when several frames agree. For continuous scanning. PRO
- `didScan`: one plate per activation, once the reads are certain. For scanning a single plate. PRO
- `didDetect`: confirmed plates in view with consensus text and smoothed boxes, throttled
- `didDetectRaw`: every read in the current frame, unsmoothed, throttled
- `didFailWith`

Set `recognizesPlates` or `scansPlates` to `false` when you don't implement that method.

## Photos (PRO)

```swift
let plates = try AlprEngine.shared.scanImage(photo, config: AlprConfig(ocrThreshold: 0.5))
```

## Telemetry

```swift
Alpr.setTelemetryEnabled(false)
```

Runtime telemetry sends at most one anonymous report per day per device: app id and version, OS and SDK versions, build type, license state and disabled PRO features. It never includes device or user identifiers, images or plates. It is on by default without a license and off with one. Set `AlprTelemetryEnabled` (Boolean) in `Info.plist` to change the default. AlprKit ships a privacy manifest.

AlprKit is licensed under the [Parkr ALPR SDK License Agreement](LICENSE.md). Bundled models: [THIRD_PARTY_NOTICES.md](THIRD_PARTY_NOTICES.md).
