
import 'package:appointiac/myapp.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(
    // DevicePreview(
    //   enabled: !kReleaseMode,
    //   builder: (context) => const ProviderScope(
    //     child: MyApp(),
    //   ),
    // ),
    const ProviderScope(
      child: MyApp(),
    ),
  );
}
