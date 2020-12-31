import 'package:flutter/material.dart';
import 'package:preg/SymptomsGuide.dart';
import 'API.dart';
import 'dart:convert';
import 'firstpage.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String url;
  ScrollController scrollController = ScrollController(initialScrollOffset: 1,keepScrollOffset: true);
  var Data;

  List QueryText = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        elevation: 20.0,
        leading: Icon(
          Icons.pregnant_woman,
          size: 40.0,
        ),
         
      ),
      body: SingleChildScrollView(
              child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(padding: EdgeInsets.only(top:5.0,bottom:5.0),),
            TextField(
              onChanged: (value) {
                url = 'http://sachinsingh.pythonanywhere.com/api?Query=' + value.toString();

              },
              decoration: InputDecoration(
                  hintText: 'Type Symptoms Here',
                  border: OutlineInputBorder(),
                  suffixIcon: GestureDetector(
                      onTap: () async {
                        Data = await Getdata(url);
                        var DecodedData = jsonDecode(Data);
                        setState(() {
                          QueryText = DecodedData['Query'];
                        });
                      },
                      child: Icon(Icons.search))),
            ),
            Padding(padding: const EdgeInsets.all(20.0)),
            MaterialButton(
              elevation: 8.0,
              padding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 60.0),
              child: Text(
                'Predict Next Symptoms',
                style: TextStyle(color: Colors.white, fontSize: 20.0),
              ),
              color: Colors.pinkAccent,
              onPressed: () async {
                Data = await Getdata(url);
                var DecodedData = jsonDecode(Data);
                setState(() {
                  QueryText = DecodedData['Query'];
                });
              },
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 30.0, horizontal: 30.0),
              child: Text(
                "Upcoming Symptoms can be :",
                style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.pinkAccent
                    ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
              child: SizedBox(
                height: 280.0,
                child: Card(
                  color: Colors.pink[100],
                  elevation: 8.0,
                  child: InkWell(
                    onTap: () { Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Symptoms(
                                        
                                      )),
                            );},
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(10.0),
                      child: ListView.builder(
                        itemCount: QueryText == null ? 0 : QueryText.length,
                        controller: scrollController,
                        itemBuilder: (BuildContext content, int index) {
                          
                          return Card(
                            child: Center(
                              child: Text(QueryText[index],
                                  style: TextStyle(
                                      fontSize: 30.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.pink[700])),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

