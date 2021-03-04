import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Pickers extends StatelessWidget {
  const Pickers({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            MaterialDatePicker(),
            MaterialDateRangePicker(),
            MaterialTimePicker(),
            CupertinoDatePickerDemo(),
            CupertinoTimePickerDemo(),
            CupertinoPickerDemo(),
          ],
        ),
      ),
    );
  }
}

class MaterialDatePicker extends StatefulWidget {
  MaterialDatePicker({Key key}) : super(key: key);

  @override
  _MaterialDatePickerState createState() => _MaterialDatePickerState();
}

class _MaterialDatePickerState extends State<MaterialDatePicker> {
  DateTime _date;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(_date != null ? _date.toString() : '-'),
          TextButton(
            onPressed: () async {
              var res = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime.now().subtract(
                  Duration(days: 15),
                ),
                lastDate: DateTime.now().add(
                  Duration(days: 15),
                ),
              );

              if (res != null) {
                setState(() {
                  _date = res;
                });
              }
            },
            child: Text("Material date picker"),
          ),
        ],
      ),
    );
  }
}

class MaterialDateRangePicker extends StatefulWidget {
  MaterialDateRangePicker({Key key}) : super(key: key);

  @override
  _MaterialDateRangePickerState createState() =>
      _MaterialDateRangePickerState();
}

class _MaterialDateRangePickerState extends State<MaterialDateRangePicker> {
  DateTimeRange _dateRange;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(_dateRange != null ? _dateRange.toString() : '-'),
          TextButton(
            onPressed: () async {
              var res = await showDateRangePicker(
                  context: context,
                  firstDate: DateTime.now(),
                  lastDate: DateTime.now().add(
                    Duration(days: 31),
                  ),
                  builder: (_, child) {
                    return Container(
                        margin: EdgeInsets.all(30.0), child: child);
                  });

              if (res != null) {
                setState(() {
                  _dateRange = res;
                });
              }
            },
            child: Text("Material date range"),
          ),
        ],
      ),
    );
  }
}

class MaterialTimePicker extends StatefulWidget {
  MaterialTimePicker({Key key}) : super(key: key);

  @override
  _MaterialTimePickerState createState() => _MaterialTimePickerState();
}

class _MaterialTimePickerState extends State<MaterialTimePicker> {
  TimeOfDay _time;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(_time != null ? _time.format(context).toString() : '-'),
          TextButton(
            onPressed: () async {
              var res = await showTimePicker(
                context: context,
                initialTime: TimeOfDay.now(),
              );

              if (res != null) {
                setState(
                  () {
                    _time = res;
                  },
                );
              }
            },
            child: Text("Time picker"),
          ),
        ],
      ),
    );
  }
}

class CupertinoDatePickerDemo extends StatefulWidget {
  CupertinoDatePickerDemo({Key key}) : super(key: key);

  @override
  _CupertinoDatePickerDemoState createState() =>
      _CupertinoDatePickerDemoState();
}

class _CupertinoDatePickerDemoState extends State<CupertinoDatePickerDemo> {
  DateTime _date;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(_date != null ? _date.toString() : '-'),
          Container(
            height: 250,
            child: CupertinoDatePicker(
              mode: CupertinoDatePickerMode.time,
              onDateTimeChanged: (selected) {
                setState(() {
                  _date = selected;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}

class CupertinoTimePickerDemo extends StatefulWidget {
  CupertinoTimePickerDemo({Key key}) : super(key: key);

  @override
  _CupertinoTimePickerDemoState createState() =>
      _CupertinoTimePickerDemoState();
}

class _CupertinoTimePickerDemoState extends State<CupertinoTimePickerDemo> {
  Duration _duration;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(_duration != null ? _duration.toString() : '-'),
          Container(
            height: 250,
            child: CupertinoTimerPicker(
              onTimerDurationChanged: (selected) {
                setState(() {
                  _duration = selected;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}

class CupertinoPickerDemo extends StatefulWidget {
  CupertinoPickerDemo({Key key}) : super(key: key);

  @override
  _CupertinoPickerDemoState createState() => _CupertinoPickerDemoState();
}

class _CupertinoPickerDemoState extends State<CupertinoPickerDemo> {
  final _list = [
    'one',
    'two',
    'three',
    'four',
    'five',
  ];

  String _selected;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (_selected != null) Text(_selected),
          CupertinoButton(
            child: Text('Cupertino picker'),
            onPressed: () async {
              var res = await showModalBottomSheet<int>(
                context: context,
                builder: (_) {
                  return CupertinoPickerDemoBottomSheet(
                    list: _list
                        .map(
                          (e) => Text(e),
                        )
                        .toList(),
                  );
                },
              );

              if (res != null) {
                setState(() {
                  _selected = _list[res];
                });
              }
            },
          ),
        ],
      ),
    );
  }
}

class CupertinoPickerDemoBottomSheet extends StatefulWidget {
  final List<Widget> list;
  CupertinoPickerDemoBottomSheet({Key key, this.list}) : super(key: key);

  @override
  _CupertinoPickerDemoBottomSheetState createState() =>
      _CupertinoPickerDemoBottomSheetState();
}

class _CupertinoPickerDemoBottomSheetState
    extends State<CupertinoPickerDemoBottomSheet> {
  var _selected = 2;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CupertinoButton(
            onPressed: () {
              Navigator.of(context).pop(_selected);
            },
            child: Text("Подтвердить"),
          ),
          Container(
            height: 250,
            child: CupertinoPicker(
              itemExtent: 32,
              onSelectedItemChanged: (index) {
                setState(() {
                  _selected = index;
                });
              },
              children: widget.list,
              scrollController:
                  FixedExtentScrollController(initialItem: _selected),
            ),
          )
        ],
      ),
    );
  }
}
