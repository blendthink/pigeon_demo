package dev.blendthink.pigeon_demo

import android.os.Bundle
import android.widget.Toast
import androidx.lifecycle.lifecycleScope
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import kotlinx.coroutines.delay
import kotlinx.coroutines.launch

class MainActivity : FlutterActivity() {

    private var count = 0

    private lateinit var flutterApi: MessageFlutterApi

    // 1. HostApi のコールバックを定義
    private val apiHandler = object : MessageHostApi {
        override fun getMessage(): String {
            // 現在のメッセージを返す
            return "$count sec pasted!"
        }

        override fun showMessage(message: String) {
            // ネイティブの機能でメッセージを表示
            Toast.makeText(this@MainActivity, message, Toast.LENGTH_SHORT).show()
        }
    }

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        // 2. コールバックを登録して HostApi を初期化
        MessageHostApi.setUp(
            flutterEngine.dartExecutor.binaryMessenger,
            apiHandler,
        )
        // 3. FlutterApi は binaryMessenger 渡して初期化
        flutterApi = MessageFlutterApi(flutterEngine.dartExecutor.binaryMessenger)
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        // 1秒ごとにメッセージを更新
        // コルーチンスコープを Activity で簡単に扱うため androidx.lifecycle:lifecycle-runtime-ktx を dependencies に追加しています
        lifecycleScope.launch {
            while (true) {
                delay(1000L)
                count++
                // 4. FlutterApiを呼び出す
                flutterApi.onMessageChanged("$count sec passed!") {}
            }
        }
    }
}
