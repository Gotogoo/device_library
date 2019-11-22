class Device {
  String id;
  String name;
  String screen;
  String platform;
  String version;
  String storage;
  String status;

  Device(
      {this.id,
      this.name,
      this.screen,
      this.platform,
      this.version,
      this.storage,
      this.status});

  factory Device.fromJson(Map<String, dynamic> json) {
    return Device(
        id: json['id'],
        name: json['name'],
        screen: json['screen'],
        platform: json['platform'],
        version: json['version'],
        storage: json['storage'],
        status: json['status']);
  }
}

class PlatformDevices {
  String platform;
  List<Device> devices;

  PlatformDevices({this.platform, this.devices});

  factory PlatformDevices.fromJson(Map<String, dynamic> json) {
    List<dynamic> parsedJson = json['devices'];
    List<Device> devices = new List<Device>();
    devices = parsedJson.map((i) => Device.fromJson(i)).toList();

    return PlatformDevices(platform: json['platform'], devices: devices);
  }
}

class PlatformDevicesList {
  final List<PlatformDevices> deviceListings;

  PlatformDevicesList({this.deviceListings});

  factory PlatformDevicesList.fromJson(List<dynamic> parsedJson) {
    List<PlatformDevices> deviceListings = new List<PlatformDevices>();
    deviceListings =
        parsedJson.map((i) => PlatformDevices.fromJson(i)).toList();

    return new PlatformDevicesList(
      deviceListings: deviceListings,
    );
  }
}
