import 'package:pigeon_demo/gen/pigeon.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'message_provider.g.dart';

@riverpod
class Message extends _$Message implements MessageFlutterApi {
  @override
  Future<String> build() async {
    // FlutterApi はコールバックを setup 関数であらかじめ登録します
    MessageFlutterApi.setup(this);
    // HostApi はそのまま呼び出すだけ
    // pigeon（MethodChannel）による通信は非同期です
    return MessageHostApi().getMessage();
  }

  /// FlutterApi で呼ばれるコールバックの定義
  @override
  void onMessageChanged(String message) {
    state = AsyncData(message);
  }
}
