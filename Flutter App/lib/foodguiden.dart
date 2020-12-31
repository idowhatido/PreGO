import 'package:flutter/material.dart';
import 'dart:convert';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List data;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Foods by Week"),
        centerTitle: true,
        
      ),
      body: Container(
        child: Center(
          child: FutureBuilder(
            future: DefaultAssetBundle.of(context)
                .loadString('load_json/food.json'),
            builder: (context, snapshot) {
              var mydata = json.decode(snapshot.data.toString());
              return ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    color: Colors.pink[100],
                    elevation: 8.0,
                    child: InkWell(
                      onTap: () {},
                      child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(10.0),
                        child: Column(
                          children: <Widget>[
                            SizedBox(
                              height: 15.0,
                              width: 100.0,
                            ),
                            new Text(
                              "Week " + mydata[index]['Week'],
                              style: TextStyle(
                                  fontSize: 20.0, fontWeight: FontWeight.bold),
                            ),
                            new Padding(padding: EdgeInsets.only(top: 5.0)),
                            new Text(
                              mydata[index]['Heading'],
                              style: TextStyle(fontSize: 20.0),
                            ),
                            new Padding(padding: EdgeInsets.only(top: 10.0)),
                            new Text(
                                "What it is : " + mydata[index]['What it is']),
                            new Padding(padding: EdgeInsets.only(top: 10.0)),
                            new Text("Why you need it: " +
                                mydata[index]['Why you need it:']),
                            new Padding(padding: EdgeInsets.only(top: 10.0)),
                            new Text(
                              "How much you need daily:  " +
                                  mydata[index]['How much you need daily:'],
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            new Padding(padding: EdgeInsets.only(top: 10.0)),
                            new Text("Where you can get your fill:  " +
                                mydata[index]['Where you can get your fill:']),
                            SizedBox(
                              height: 15.0,
                              width: 100.0,
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                padding: EdgeInsets.all(10.0),
                itemCount: mydata == null ? 0 : mydata.length,
              );
            },
          ),
        ),
      ),
    );
  }
}
