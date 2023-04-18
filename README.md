## 概要

[pigeon] で Kotlin, Swift のコードを生成して、Android, iOS とやりとりするサンプルプロジェクト

## 挙動

### Android

https://user-images.githubusercontent.com/32213113/232854003-db257827-a066-4aef-9b25-de3fa089b5cf.mp4

### iOS

https://user-images.githubusercontent.com/32213113/232854712-b64d5d9a-41a1-41c8-a0b1-b03e705a76e5.mp4

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
