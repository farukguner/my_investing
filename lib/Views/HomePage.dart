import 'package:flutter/material.dart';
import 'package:my_investing/Controller/Helper.dart' as Helper;

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  State<StatefulWidget> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Anasayfa",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance),
            label: "Portföy",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.attach_money),
            label: 'Temettü',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.lightGreen[800],
        onTap: _onItemTapped,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (_) {
                return Helper.AddItemDialog();
              });
        },
        tooltip: 'Hisse ekle',
        child: Icon(Icons.add),
      ),
    );
  }
}
