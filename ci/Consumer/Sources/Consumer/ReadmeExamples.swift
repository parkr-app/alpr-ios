import AlprKit
import AVFoundation
import UIKit

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

func scanPhoto(_ photo: UIImage) throws -> [AlprPlate] {
  try AlprEngine.shared.scanImage(photo, config: AlprConfig(ocrThreshold: 0.5))
}

func disableTelemetry() {
  Alpr.setTelemetryEnabled(false)
}
