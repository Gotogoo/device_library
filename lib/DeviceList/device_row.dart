import 'package:device_library/Model/device.dart';
import 'package:flutter/material.dart';

class DeviceRow extends StatelessWidget {
  DeviceRow(this.device, this.onTapItemAction);

  final Device device;
  final ValueChanged<Device> onTapItemAction;
  final Color _textColor = Color(int.parse("0xff333f48"));

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
    final bool _isAvailable = device.status == "AVAILABLE";
    final String _statusDescription = _isAvailable ? "可用" : "借出";
    final Color _statusColor = _isAvailable ? Colors.lightGreen : Colors.orange;
    return Text("");
  }

  Widget _buildSystem() {
    return Text("");
  }

  Widget _buildHardware() {
    return Text("");
  }

  Widget _buildID() {
    return Text("");
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
