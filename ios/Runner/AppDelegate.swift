import UIKit
import Flutter
import Loaf

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate, MessageHostApi {

  private var flutterApi: MessageFlutterApi!

  private var timer: Timer!
  private var count: Int = 0

  // 1. HostApiのコールバックを定義
  func getMessage() throws -> String {
    // 現在のメッセージを返す
    "\(count) sec passed!"
  }

  func showMessage(message: String) throws {
    // ネイティブの機能でメッセージを表示
    let controller = window?.rootViewController as! FlutterViewController
    Loaf(message, state: .info, sender: controller).show()
  }

  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    let controller = window?.rootViewController as! FlutterViewController
    // 2. コールバックを登録して HostApi を初期化
    MessageHostApiSetup.setUp(binaryMessenger: controller.binaryMessenger, api: self)
    // 3. FlutterApi は binaryMessenger 渡して初期化
    flutterApi = MessageFlutterApi(binaryMessenger: controller.binaryMessenger)
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }

  override func applicationDidBecomeActive(_ application: UIApplication) {
    super.applicationDidBecomeActive(application)
    // 1秒ごとにメッセージを更新
    timer = Timer.scheduledTimer(
      timeInterval: 1.0,
      target: self,
      selector: #selector(increment),
      userInfo: nil,
      repeats: true
    )
  }

  override func applicationWillResignActive(_ application: UIApplication) {
    super.applicationWillResignActive(application)
    timer.invalidate()
  }

  @objc private func increment() throws {
    count += 1

    // 4. FlutterApi を呼び出す
    let message = try getMessage()
    flutterApi.onMessageChanged(message: message) {}
  }
}
