import 'package:flutter/material.dart';
import 'dart:convert';

class Symptoms extends StatefulWidget {
  @override
  _SymptomsState createState() => _SymptomsState();
}

class _SymptomsState extends State<Symptoms> {
  List data;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Symptoms"),
        centerTitle: true,
      ),
      body: Container(
         
        child: Center(
          child: FutureBuilder(
            future: DefaultAssetBundle.of(context)
                .loadString('load_json/symptoms.json'),
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
                              mydata[index]['Symptom'],
                              style: TextStyle(
                                  fontSize: 20.0, fontWeight: FontWeight.bold),
                            ),
                            new Padding(padding: EdgeInsets.only(top: 20.0)),
                            new Text(
                              'What is it : ' + mydata[index]['What is it?'],
                              style: TextStyle(fontSize: 15.0),
                            ),
                            new Padding(padding: EdgeInsets.only(top: 20.0)),
                            new Text(
                              'What to do : ' + mydata[index]['What to do?'],
                              style: TextStyle(fontSize: 15.0),
                            ),
                            new Padding(padding: EdgeInsets.only(top: 10.0)),
                            SizedBox(
                              height: 50.0,
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
