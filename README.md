# pigeon_demo

A new Flutter project.

## pigeon command

```shell
mkdir -p lib/gen
fvm flutter pub run pigeon \
  --input pigeons/message.dart \
  --dart_out lib/gen/pigeon.dart \
  --swift_out ios/Runner/Pigeon.swift \
  --kotlin_out android/app/src/main/kotlin/dev/blendthink/pigeon_demo/Pigeon.kt \
  --kotlin_package "dev.blendthink.pigeon_demo"
```

## build_runner command

```shell
fvm flutter pub run build_runner build -d
```
