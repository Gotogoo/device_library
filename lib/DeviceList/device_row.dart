import 'package:device_library/Model/device.dart';
import 'package:flutter/material.dart';

class DeviceRow extends StatelessWidget {
  DeviceRow(this.device, this.onTapItemAction);

  final Device device;
  final ValueChanged<Device> onTapItemAction;

  @override
  Widget build(BuildContext context) {
    return _buildRow(context, device);
  }

  Widget _buildRow(BuildContext context, Device device) {
    return GestureDetector(
      onTap: () {
        onTapItemAction(device);
      },
      child: Container(
        margin: EdgeInsets.fromLTRB(0, 0, 0, 16),
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            _buildTagColor(device),
            Expanded(
              child: _buildContent(device),
            ),
          ],
        ),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(4.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                offset: Offset(1.0, 1.0),
                blurRadius: 4.0,
              )
            ]),
      ),
    );
  }

  Widget _buildTagColor(Device device) {
    var color = (device.platform == "Android") ? Color(int.parse("0xffa5c445")) : Color(int.parse("0xff007aff")) ;
    return Row(
      children: <Widget>[
        Container(
          child: Text(""),
          width: 8,
          height: 130,
          margin: EdgeInsets.fromLTRB(0, 0, 8, 0),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
      ],
    );
  }

  Widget _buildContent(Device device) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
          child: _buildNameAndStatus(),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
          child: _buildSystem(),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
          child: _buildHardware(),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(0, 16, 0, 0),
          child: _buildID(),
        ),
      ],
    );
  }

  Widget _buildNameAndStatus() {
    final bool isAvailable = device.status == "AVAILABLE";
    final String statusDescription = isAvailable ? "可用" : "借出";
    final Color statusColor = isAvailable
        ? Color(int.parse("0xff4cd964"))
        : Color(int.parse("0xffff9500"));
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          device.name,
          textAlign: TextAlign.left,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Color(int.parse("0xff333f48")),
          ),
        ),
        Container(
          padding: EdgeInsets.fromLTRB(24, 2, 24, 2),
          child: Text(
            statusDescription,
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          decoration: BoxDecoration(
            color: statusColor,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
      ],
    );
  }

  Widget _buildSystem() {
    return Text(
      device.platform + " " + device.version,
      style: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: Color(int.parse("0xff333f48")),
      ),
    );
  }

  Widget _buildHardware() {
    return Row(
      children: <Widget>[
        ImageText(
          image: "screen.png",
          title: device.screen,
        ),
        Container(
          margin: EdgeInsets.fromLTRB(16, 0, 0, 0),
          child: ImageText(
            image: "storage.png",
            title: device.storage,
          ),
        ),
      ],
    );
  }

  Widget _buildID() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Text(
          "id: ${device.id}",
          style: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w500,
            color: Color(int.parse("0xff333f48")),
          ),
        ),
      ],
    );
  }
}

class ImageText extends StatelessWidget {
  const ImageText({this.image, this.title});

  final String image;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Image(
          image: AssetImage("assets/images/$image"),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(4, 0, 0, 0),
          child: Text(title),
        )
      ],
    );
  }
}
