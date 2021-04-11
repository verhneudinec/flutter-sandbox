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

final messageChannelName = 'message_channel';

final binaryMessenger = ServicesBinding.instance.defaultBinaryMessenger;

class _ChannelsTestState extends State<ChannelsTest> {
  final messageChannel = BasicMessageChannel<String>(
    messageChannelName,
    StringCodec(),
    binaryMessenger: binaryMessenger,
  );

  @override
  void initState() {
    super.initState();
    receiveMessage();
    sendMessage();
  }

  void sendMessage() async {
    final response = await messageChannel.send("Hello, android");

    print("FLUTTER | $response");
  }

  void receiveMessage() async {
    // binaryMessenger.setMessageHandler(messageChannelName, (message) {
    //   final ReadBuffer readBuffer = ReadBuffer(message);

    //   final x = readBuffer.data.getFloat64(0);
    //   final y = readBuffer.data.getFloat32(8);

    //   print("FLUTTER | mes rrecieved: x =  $x, y = $y");

    //   return;
    // });
    messageChannel.setMessageHandler((message) {
      print("Flutter recivd message = $message");
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
