import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:my_investing/Models/Result.dart';
import 'package:my_investing/Models/Types.dart';
import 'package:http/http.dart' as http;
import 'package:dropdown_search/dropdown_search.dart';

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

  static List<String> getDropDownSearchHisse(var hisse) {
    List<String> items = new List<String>();
    for (var item in hisse.result) {
      items.add(item.code);
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
  bool isLoaded = false;

  List<DropdownMenuItem<String>> types;
  List<String> hisseler;
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
          msg: "$currentHisse Hisse'si Eklendi ",
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
          child: isLoaded
              ? ListBody(
                  children: <Widget>[
                    DropdownButton(
                      value: currentType,
                      items: types,
                      onChanged: changedDropDownItem,
                    ),
                    DropdownSearch(
                      showSearchBox: true,
                      label: currentHisse != null && currentHisse != 'Hisse'
                          ? resultHisse.result
                              .singleWhere((x) => x.code == currentHisse)
                              .text
                          : 'Hisse',
                      selectedItem: currentHisse,
                      showSelectedItem: true,
                      items: hisseler,
                      showClearButton: true,
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
                      validator: (cost) {
                        if (cost.isEmpty) {
                          return "Maliyet alanı boş bırakılamaz.";
                        }
                      },
                      controller: costControl,
                      decoration: InputDecoration(hintText: "Maliyetiniz"),
                    ),
                  ],
                )
              : CircularProgressIndicator(
                  strokeWidth: 3,
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
      currentHisse = selectedHisse != null ? selectedHisse : 'Hisse';
      costControl.text = selectedHisse != null
          ? resultHisse.result
              .singleWhere((x) => x.code == currentHisse)
              .lastpricestr
          : "0";
    });
  }

  Future<Null> getHisse() async {
    final result = await http
        .get("https://api.collectapi.com/economy/hisseSenedi", headers: {
      "Authorization": "apikey 03AnOc18IENnWBUzGpI0vW:6jKBmQ4fx72e1FuYU0XFeZ"
    });
    if (result.statusCode == 200) {
      resultHisse = HisseJson.fromjson(json.decode(result.body));
      hisseler = Helper.getDropDownSearchHisse(resultHisse);
      setState(() {
        currentHisse = hisseler[0];
        costControl.text = resultHisse.result
            .singleWhere((x) => x.code == currentHisse)
            .lastpricestr;
        isLoaded = true;
      });
    }
  }
}
