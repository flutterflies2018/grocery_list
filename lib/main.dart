import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Grocery Shopper',
      home: new List()
    );
  }
}

class List extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ListState();
}

class _ListState extends State<List> {
  String item = '';
  final _stores = ['Safeway', 'Trader Joe\'s', 'Costco'];
  String _store = 'Costco';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CHANGE ME'),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        padding: EdgeInsets.all(15.0),
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                labelText: 'Buy:',
                hintText: 'What do you need?',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0)
                )
              ),
              onSubmitted: (String string) {
                setState(() {
                  item = string;
                });
              },
            ),
            DropdownButton<String>(
              // TODO: Add border to dropdown box?
              items: _stores.map((String value){
                return DropdownMenuItem<String> (
                  value: value,
                  child: Text(value)
                );
              }).toList(),
              value: _store,
              onChanged: (String value) {
                _onDropdownChanged(value);
              },
            ),
            RaisedButton(
              color: Colors.blueAccent,
              child: Text(
                'Submit',
                textScaleFactor: 1.5,
                color: Colors.white,
              ), 
              onPressed: () {},
            ),
            Text(item)
          ],
        )
      ),
      );
  }

  _onDropdownChanged(String value) {
    setState(() {
          this._store = value;
        });
  }
}

// DONE: add a textfield to enter a grocery item
// add a button that saves the item and refreshes the list
// add the item in a list
// add checkable boxes next to the item