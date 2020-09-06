import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:my_investing/Models/Result.dart';
import 'package:my_investing/Models/Types.dart';
import 'package:http/http.dart' as http;

class Helper {
  static List<Types> getTypes() {
    List<Types> types = new List<Types>();
    Types type = new Types();
    type.type = "Alış";
    types.add(type);
    type = new Types();
    type.type = "Satış";
    types.add(type);
    type = new Types();
    type.type = "Temettü";
    types.add(type);
    type = new Types();
    type.type = "Bedelsiz";
    types.add(type);
    return types;
  }

  static List<DropdownMenuItem<String>> getDropDownTypeItems() {
    List<Types> types = getTypes();
    List<DropdownMenuItem<String>> items = new List();
    for (var item in types) {
      items.add(new DropdownMenuItem(
        value: item.type,
        child: new Text(item.type),
      ));
    }
    return items;
  }

  static List<DropdownMenuItem<String>> getDropDownHisseItems(var hisse) {
    List<DropdownMenuItem<String>> items = new List();
    for (var item in hisse.result) {
      items.add(new DropdownMenuItem(
        value: item.lastpricestr,
        child: new Text(item.code),
      ));
    }
    return items;
  }
}

class AddItemDialog extends StatefulWidget {
  @override
  _AddItemDialogState createState() => new _AddItemDialogState();
}

class _AddItemDialogState extends State<AddItemDialog> {
  final lotControl = TextEditingController();
  final costControl = TextEditingController();
  final generalControl = GlobalKey<FormState>();
  var resultHisse;

  List<DropdownMenuItem<String>> types;
  List<DropdownMenuItem<String>> hisseler;
  String currentType;
  String currentHisse;

  @override
  void dispose() {
    lotControl.dispose();
    super.dispose();
  }

  @override
  void initState() {
    types = Helper.getDropDownTypeItems();
    getHisse();
    currentType = types[0].value;
    super.initState();
  }

  void addItem() {
    if (generalControl.currentState.validate()) {
      Fluttertoast.showToast(
          msg: "Hisse Eklendi ${lotControl.text}",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 5,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Hisse giriş'),
      content: Form(
        key: generalControl,
        child: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              DropdownButton(
                value: currentType,
                items: types,
                onChanged: changedDropDownItem,
              ),
              DropdownButton(
                value: currentHisse,
                items: hisseler,
                onChanged: changedDropDownHisse,
              ),
              TextFormField(
                // ignore: missing_return
                validator: (lot) {
                  if (lot.isEmpty) {
                    return "Lot sayısı alanı boş bırakılamaz.";
                  }
                },
                controller: lotControl,
                decoration: InputDecoration(hintText: "Lot Sayısı"),
              ),
              TextFormField(
                // ignore: missing_return
                validator: (lot) {
                  if (lot.isEmpty) {
                    return "Maliyet alanı boş bırakılamaz.";
                  }
                },
                controller: costControl,
                decoration: InputDecoration(hintText: "Maliyetiniz"),
              ),
            ],
          ),
        ),
      ),
      actions: <Widget>[
        FlatButton(
          child: Text('Onayla'),
          onPressed: addItem,
          //((Navigator.of(context).pop();
        ),
      ],
    );
  }

  void changedDropDownItem(String selectedType) {
    setState(() {
      currentType = selectedType;
    });
  }

  void changedDropDownHisse(String selectedHisse) {
    setState(() {
      currentHisse = selectedHisse;
    });
  }

  Future<Null> getHisse() async {
    final result = await http
        .get("https://api.collectapi.com/economy/hisseSenedi", headers: {
      "Authorization": "apikey 03AnOc18IENnWBUzGpI0vW:6jKBmQ4fx72e1FuYU0XFeZ"
    });
    if (result.statusCode == 200) {
      resultHisse = HisseJson.fromjson(json.decode(result.body));
      hisseler = Helper.getDropDownHisseItems(resultHisse);
      setState(() {
        currentHisse = hisseler[0].value;
      });
    }
  }
}
