import Flutter
import UIKit

public class InstallReferrerV2Plugin: NSObject, FlutterPlugin {
  private var latestReferrer: String?
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "kh.chandarith.install_referrer_v2", binaryMessenger: registrar.messenger())
    let instance = InstallReferrerV2Plugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case "getInstallReferrer":
      result(["installReferrer":latestReferrer])
    default:
      result(FlutterMethodNotImplemented)
    }
  }

  public func application(
    _ application: UIApplication,
    continue userActivity: NSUserActivity,
    restorationHandler: @escaping ([Any]) -> Void
  ) -> Bool {
      latestReferrer = userActivity.referrerURL?.absoluteString
    return false
  }
}
