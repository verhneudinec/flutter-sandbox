import 'package:flutter/material.dart';
import 'package:study_project/model/goods.dart';

class BottomSheetAndDialog extends StatefulWidget {
  const BottomSheetAndDialog({Key key}) : super(key: key);

  @override
  _BottomSheetAndDialogState createState() => _BottomSheetAndDialogState();
}

class _BottomSheetAndDialogState extends State<BottomSheetAndDialog> {
  var _isCustom = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blue[50],
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: _editGood,
                child: Text("Show BottomSheet"),
              ),
              if (_isCustom) Text("Custom"),
            ],
          ),
        ),
      ),
    );
  }

  void _editGood() async {
    List<Good> res = await showModalBottomSheet<List<Good>>(
      context: context,
      builder: (_) {
        return GoodEditBottomSheet();
      },
      isScrollControlled: true,
    );

    if (res != null && res.length > 0) {
      setState(() {
        _isCustom = true;
      });
    }
  }
}

class GoodEditBottomSheet extends StatefulWidget {
  const GoodEditBottomSheet({Key key}) : super(key: key);

  @override
  _GoodEditBottomSheetState createState() => _GoodEditBottomSheetState();
}

class _GoodEditBottomSheetState extends State<GoodEditBottomSheet> {
  List<Good> _goodList;

  var _additionList = Set<String>();

  @override
  void initState() {
    super.initState();

    _goodList = GoodInteractor().getGoods();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(8.0),
          topRight: Radius.circular(8.0),
        ),
        color: Colors.white,
      ),
      child: Column(
        children: [
          Icon(
            Icons.minimize,
            size: 36.0,
          ),
          ConstrainedBox(
            constraints: BoxConstraints(maxHeight: 300),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: _goodList
                  .map((good) => _GoodWidget(
                        data: good,
                        isSelected: _additionList.contains(good.id),
                        onSelected: _onValueSelected,
                      ))
                  .toList(),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop(
                _goodList
                    .where(
                      (good) => _additionList.contains(good.id),
                    )
                    .toList(),
              );
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("Готово".toUpperCase()),
                const SizedBox(
                  width: 4.0,
                ),
                Icon(
                  Icons.check,
                  color: Colors.red,
                  size: 25.0,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  void _onValueSelected(String id) {
    setState(() {
      if (_additionList.contains(id))
        _additionList.remove(id);
      else
        _additionList.add(id);
    });
  }
}

class _GoodWidget extends StatefulWidget {
  final Good data;
  final bool isSelected;
  final void Function(String) onSelected;
  _GoodWidget({Key key, this.data, this.isSelected, this.onSelected})
      : super(key: key);

  @override
  _GoodWidgetState createState() => _GoodWidgetState();
}

class _GoodWidgetState extends State<_GoodWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text(widget.data.name),
              const SizedBox(
                width: 16,
              ),
              if (widget.data.isHot)
                Icon(
                  Icons.local_fire_department,
                  color: Colors.red,
                  size: 25.0,
                ),
            ],
          ),
          Checkbox(
            value: widget.isSelected,
            onChanged: _onSelect,
          ),
        ],
      ),
    );
  }

  void _onSelect(bool value) async {
    var good = widget.data;

    var isAgree = true;

    if (good.isHot && value) {
      isAgree = await showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) {
          return _HotAlertWidget(
            hotAlertText: good.hotAttentionText,
          );
        },
      );
    }

    if (isAgree) widget.onSelected(good.id);
  }
}

class _HotAlertWidget extends StatelessWidget {
  final String hotAlertText;
  const _HotAlertWidget({Key key, this.hotAlertText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Center(
        child: Container(
          height: 50,
          width: 100,
          child: Stack(
            overflow: Overflow.visible,
            children: [
              Positioned(
                bottom: 0,
                height: 100,
                width: 100,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.orange,
                  ),
                  child: Icon(
                    Icons.local_fire_department,
                    color: Colors.white,
                    size: 36.0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      titlePadding: EdgeInsets.zero,
      content: Text(hotAlertText),
      contentPadding: EdgeInsets.all(16.0),
      actions: [
        TextButton(
          child: Text("Отлично"),
          onPressed: () {
            Navigator.of(context).pop(true);
          },
        ),
        TextButton(
          child: Text("Я передумал"),
          onPressed: () {
            Navigator.of(context).pop(false);
          },
        ),
      ],
    );
  }
}
