## 概要

[pigeon] で Kotlin, Swift のコードを生成して、Android, iOS とやりとりするサンプルプロジェクト

## 挙動

### Android

<video controls src="https://github.com/blendthink/pigeon_demo/raw/main/docs/videos/android.mp4"></video>

### iOS

<video controls src="https://github.com/blendthink/pigeon_demo/raw/main/docs/videos/ios.mp4"></video>

## コマンド集

### pigeon

```shell
mkdir -p lib/gen
fvm flutter pub run pigeon \
  --input pigeons/message.dart \
  --dart_out lib/gen/pigeon.dart \
  --swift_out ios/Runner/Pigeon.swift \
  --kotlin_out android/app/src/main/kotlin/dev/blendthink/pigeon_demo/Pigeon.kt \
  --kotlin_package "dev.blendthink.pigeon_demo"
```

### build_runner

```shell
fvm flutter pub run build_runner build -d
```

<!-- Links -->

[pigeon]: https://pub.dev/packages/pigeon
