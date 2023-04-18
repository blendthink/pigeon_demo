# pigeon_demo

A new Flutter project.

## Pigeon command

```shell
mkdir -p lib/gen
fvm flutter pub run pigeon \
  --input pigeons/message.dart \
  --dart_out lib/gen/pigeon.dart \
  --swift_out ios/Runner/Pigeon.swift \
  --kotlin_out android/app/src/main/kotlin/dev/blendthink/pigeon_demo/Pigeon.kt \
  --kotlin_package "dev.blendthink.pigeon_demo"
```
