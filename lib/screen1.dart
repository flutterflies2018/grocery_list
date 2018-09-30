import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

// void main() => runApp(new Screen1());

class Screen1 extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hello You',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new HelloYou(),
    );
  }
}

class HelloYou extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _HelloYouState();

}

class _HelloYouState extends State<HelloYou>{
  String name ='';
  List<String> lstStores=[];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Grocery Addition"),
          backgroundColor: Colors.blueAccent,
        ),
        body: Container(
          padding:EdgeInsets.all(15.0),
          child: Column(
            children: <Widget> [
              TextField(
                decoration: InputDecoration(
                  hintText: "Please enter the store name",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0)
                  )
                ),
                onSubmitted: (String strInput){
                  setState(() {
                    name = strInput;
                    lstStores.add(strInput);
                  });
                },
              ),
              //Text('Store : '+ name+ '!'),

              OrderButton(),

              

              new Expanded(
                  child: new ListView.builder
                    (
                      itemCount: lstStores.length,
                      itemBuilder: (BuildContext context, int index) {
                        return new Text(lstStores[index],
                          textDirection: TextDirection.ltr,
                          style: TextStyle(
                            fontSize: 30.0,
                            decoration: TextDecoration.none,
                            fontFamily: 'Oxygen',
                            // fontWeight: FontWeight.bold,
                          ),
                        );
                      }
                  )
              ),
              new RaisedButton(onPressed:(){
                button1(context);
            } ,child: new Text("Go to Grocery List"),)
            ],
          ),
        )
    );
  }

}

void button1(BuildContext context){
  print("Button 1");
  Navigator.of(context).pushNamed('/screen2');
}

class OrderButton extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    var button = Container(
      margin: EdgeInsets.only(top:50.0),
      child: RaisedButton(
        child: Text("Submit"),
        color: Colors.lightGreen,
        elevation: 5.0,
        onPressed: (){
          order(context);
        },
      ),
    );
    return button;
  }
  void order(BuildContext context){
    var alert = AlertDialog(
      title: Text("Store"),
      content: Text("Store Added to the list"),
    );
    showDialog(
        context: context,
        builder: (BuildContext context) => alert
    );
  }
}