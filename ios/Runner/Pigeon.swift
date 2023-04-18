// Autogenerated from Pigeon (v9.2.4), do not edit directly.
// See also: https://pub.dev/packages/pigeon

import Foundation
#if os(iOS)
import Flutter
#elseif os(macOS)
import FlutterMacOS
#else
#error("Unsupported platform.")
#endif

private func wrapResult(_ result: Any?) -> [Any?] {
  return [result]
}

private func wrapError(_ error: Any) -> [Any?] {
  if let flutterError = error as? FlutterError {
    return [
      flutterError.code,
      flutterError.message,
      flutterError.details
    ]
  }
  return [
    "\(error)",
    "\(type(of: error))",
    "Stacktrace: \(Thread.callStackSymbols)"
  ]
}

private func nilOrValue<T>(_ value: Any?) -> T? {
  if value is NSNull { return nil }
  return (value as Any) as! T?
}
/// Generated protocol from Pigeon that represents a handler of messages from Flutter.
protocol MessageHostApi {
  func getMessage() throws -> String
  func shoMessage(message: String) throws
}

/// Generated setup class from Pigeon to handle messages through the `binaryMessenger`.
class MessageHostApiSetup {
  /// The codec used by MessageHostApi.
  /// Sets up an instance of `MessageHostApi` to handle messages through the `binaryMessenger`.
  static func setUp(binaryMessenger: FlutterBinaryMessenger, api: MessageHostApi?) {
    let getMessageChannel = FlutterBasicMessageChannel(name: "dev.flutter.pigeon.MessageHostApi.getMessage", binaryMessenger: binaryMessenger)
    if let api = api {
      getMessageChannel.setMessageHandler { _, reply in
        do {
          let result = try api.getMessage()
          reply(wrapResult(result))
        } catch {
          reply(wrapError(error))
        }
      }
    } else {
      getMessageChannel.setMessageHandler(nil)
    }
    let shoMessageChannel = FlutterBasicMessageChannel(name: "dev.flutter.pigeon.MessageHostApi.shoMessage", binaryMessenger: binaryMessenger)
    if let api = api {
      shoMessageChannel.setMessageHandler { message, reply in
        let args = message as! [Any]
        let messageArg = args[0] as! String
        do {
          try api.shoMessage(message: messageArg)
          reply(wrapResult(nil))
        } catch {
          reply(wrapError(error))
        }
      }
    } else {
      shoMessageChannel.setMessageHandler(nil)
    }
  }
}
/// Generated class from Pigeon that represents Flutter messages that can be called from Swift.
class MessageFlutterApi {
  private let binaryMessenger: FlutterBinaryMessenger
  init(binaryMessenger: FlutterBinaryMessenger){
    self.binaryMessenger = binaryMessenger
  }
  func onMessageChanged(message messageArg: String, completion: @escaping () -> Void) {
    let channel = FlutterBasicMessageChannel(name: "dev.flutter.pigeon.MessageFlutterApi.onMessageChanged", binaryMessenger: binaryMessenger)
    channel.sendMessage([messageArg] as [Any?]) { _ in
      completion()
    }
  }
}
