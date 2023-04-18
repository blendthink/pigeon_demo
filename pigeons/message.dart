import 'package:pigeon/pigeon.dart';

@HostApi()
abstract class MessageHostApi {
  String getMessage();

  void shoMessage(String message);
}

@FlutterApi()
abstract class MessageFlutterApi {
  void onMessageChanged(String message);
}
