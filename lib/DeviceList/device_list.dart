import 'dart:async';
import 'dart:convert';

import 'package:device_library/DeviceList/device_row.dart';
import 'package:device_library/ManageDevice/manage_device.dart';
import 'package:device_library/Model/device.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DeviceList extends StatefulWidget {
  @override
  DeviceListState createState() => DeviceListState();
}

class DeviceListState extends State<DeviceList> {
  final _devices = <Device>[];
  Future<PlatformDevicesList> deviceListings = fetchDevice();

  @override
  Widget build(BuildContext context) {
    // TODO: show app bar and body.
    return Center();
  }

  Widget _buildBody() {
    return Center(
        child: FutureBuilder<PlatformDevicesList>(
          future: deviceListings,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              _devices.clear();
              snapshot.data.deviceListings.forEach((deviceListing) async {
                deviceListing.devices.forEach((device) async {
                  _devices.add(device);
                });
              });
              return _buildDevices();
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }

            // By default, show a loading spinner.
            return CircularProgressIndicator();
          },
        ),
      );
  }

  Widget _buildDevices() {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: _devices.length,
      itemBuilder: (context, index) {
        if (index < _devices.length) {
          final device = _devices[index];
          return DeviceRow(device, _pushUpdateDevice);
        }
      },
    );
  }

  void _pushUpdateDevice(Device device) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_)=> ManageDevice()
        ),
      ).then((val)=>refreshData());
  }

  void refreshData() {
    setState(() {
      this.deviceListings = fetchDevice();
    });
  }
}

Future<PlatformDevicesList> fetchDevice() async {
  Map<String, String> header = {"identifier": "5bCP5YCf5YCf"};
  final response = await http.get(
      'https://device-library-api.herokuapp.com/api/listings',
      headers: header);
  final jsonResponse = json.decode(response.body);

  return PlatformDevicesList.fromJson(jsonResponse);
}
