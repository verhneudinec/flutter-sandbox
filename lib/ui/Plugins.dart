import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:battery/battery.dart';
import 'package:flutter/services.dart';

class PluginsDemo extends StatefulWidget {
  PluginsDemo({Key key}) : super(key: key);

  @override
  _PluginsDemoState createState() => _PluginsDemoState();
}

class _PluginsDemoState extends State<PluginsDemo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ChannelsTest(),
    );
  }
}

class ChannelsTest extends StatefulWidget {
  ChannelsTest({Key key}) : super(key: key);

  @override
  _ChannelsTestState createState() => _ChannelsTestState();
}

class _ChannelsTestState extends State<ChannelsTest> {
  final binaryMessenger = ServicesBinding.instance.defaultBinaryMessenger;

  final binaryChannelName = 'binary_channel';

  @override
  void initState() {
    super.initState();
    receiveBinary();
    sendBinary();
  }

  void sendBinary() async {
    final WriteBuffer buffer = WriteBuffer()
      ..putFloat64(0.5)
      ..putInt32(1);

    final ByteData byteData = buffer.done();

    final result = await binaryMessenger.send(binaryChannelName, byteData);

    final ReadBuffer readBuffer = ReadBuffer(result);

    final x = readBuffer.data.getFloat64(0);
    final y = readBuffer.data.getFloat32(8);

    print("FLUTTER | result: x =  $x, y = $y");
  }

  void receiveBinary() async {
    binaryMessenger.setMessageHandler(binaryChannelName, (message) {
      final ReadBuffer readBuffer = ReadBuffer(message);

      final x = readBuffer.data.getFloat64(0);
      final y = readBuffer.data.getFloat32(8);

      print("FLUTTER | mes rrecieved: x =  $x, y = $y");

      return;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class BatteryPlugin extends StatelessWidget {
  const BatteryPlugin({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void getBatteryLevel() async {
      var _battery = Battery();
      print("Battery level is ${await _battery.batteryLevel}");
      _battery.onBatteryStateChanged.listen((BatteryState state) {
        print(state);
      });
    }

    return Container();
  }
}
