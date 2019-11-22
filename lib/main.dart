import 'package:device_library/DeviceList/device_list.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Devices',
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      home: DeviceList(),
    );
  }
}
