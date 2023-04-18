import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pigeon_demo/gen/pigeon.dart';
import 'package:pigeon_demo/message_provider.dart';

class MessageScreen extends ConsumerWidget {
  const MessageScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 初期化 or FlutterApi 呼び出しによる状態の変化を監視します
    final message = ref.watch(messageProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pigeonサンプル'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          message.whenData((value) {
            // HostApi はそのまま呼び出すだけ
            MessageHostApi().showMessage(value);
          });
        },
        child: const Icon(Icons.message),
      ),
      body: Center(
        // メッセージの取得は非同期なので AsyncValue でラップされています
        child: message.when(
          data: (value) {
            debugPrint('message: $value');
            return Text(value);
          },
          error: (e, _) {
            debugPrint('error: $e');
            return const Icon(Icons.error);
          },
          loading: () {
            debugPrint('loading');
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
