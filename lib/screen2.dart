import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

// void main() => runApp(new Screen2());

class Screen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Grocery Shopper',
      home: new GroceryList()
    );
  }
}

class GroceryList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ListState();
}

class _ListState extends State<GroceryList> {
  
  String item = '';
  List<String> itemsList=[];
  String _selectedStore = '';
  final _stores = [ 'Safeway', 'Trader Joe\'s', 'Costco'];
  String _store = 'Costco';
  TextEditingController itemFromStoreController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Grocery List'),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        padding: EdgeInsets.all(15.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: itemFromStoreController,
              decoration: InputDecoration(
                labelText: 'Buy:',
                hintText: 'What do you need?',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0)
                )
              ),
              // onSubmitted: (String string) {
              //   setState(() {
              //     item = string;
              //   });
              // },
            ),
            DropdownButton<String>(
              // TODO: Add border to dropdown box?
              items: _stores.map((String value){
                return DropdownMenuItem<String> (
                  value: value,
                  child: new Text(value)
                );
              }).toList(),
              value: _store,
              onChanged: (newValue) {
                _selectedStore = newValue;
                this.setState(() {});
                // _onDropdownChanged(value);
              }
            ),
            RaisedButton(
              color: Colors.blueAccent,
              child: Text(
                'Add Item',
                textScaleFactor: 1.5,
                color: Colors.white,
              ), 
              onPressed: () {
                setState((){
                //   // TODO: add colum to list
                  item = itemFromStoreController.text;
                  itemsList.add(item + " from " + _selectedStore);
                  itemFromStoreController.clear();
                });
              },
            ),
            // Text(itemsList),
            // _buildGroceryList(itemsList),
            new Expanded(
              child: new ListView.builder(
                itemCount: itemsList.length,
                itemBuilder: (BuildContext context, int index) {
                  return new Text(itemsList[index],
                  textDirection: TextDirection.ltr,
                  style: TextStyle(
                    fontSize: 30.0,
                  )
                  );
                }
              )
            ),
            RaisedButton(onPressed:(){
              button2(context);
            } ,child: new Text("Back to Store List"),)
          ],
        )
      ),
      );
  }

void button2(BuildContext context){
  print("Button 2");
  Navigator.of(context).pop(true);
}

  _onDropdownChanged(String value) {
    setState(() {
          this._store = value;
        });
  }
}

Widget _buildGroceryList(itemsList) {
  return new ListView.builder(
    itemCount: itemsList.length,
    padding: EdgeInsets.all(14.0),
    itemBuilder: (BuildContext _context, int index) {
      return new Text(itemsList[index]);
    }
  );
}

// DONE: add a textfield to enter a grocery item
// add a button that saves the item and refreshes the list
// add the item in a list
// add checkable boxes next to the item