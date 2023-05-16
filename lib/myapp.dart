import 'package:appointiac/common/splashscreen.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      debugShowCheckedModeBanner: false,
      title: 'Appointiac',
      home: const Scaffold(
        body: LoadingAnimation(),
        // drawer: NavBar(),
      ),
      
      
    );
  }
}
