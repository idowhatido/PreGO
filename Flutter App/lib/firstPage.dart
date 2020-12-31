import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:preg/Calender.dart';
import 'package:preg/foodguiden.dart';
import 'package:preg/prediction.dart';
import 'package:preg/tester.dart';

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('PreGO'),
          elevation: 20.0,
          leading: Icon(
            Icons.pregnant_woman,
            size: 40.0,
          ),
        ),
        body: Container(
          
          color: Colors.pinkAccent,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Center(
              child: Column(
                children: <Widget>[

                  //BUTTON 1 to check Symptoms
                  Expanded(
                    child: Card(
                      elevation: 8.0,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MyHomePage(
                                      title: 'PreGO',
                                    )),
                          );
                        },
                        child: Container(
                          width: double.infinity,
                          padding: EdgeInsets.all(10.0),
                          child: Center(
                            child: Text(
                              "Check Symptoms",
                              style: TextStyle(
                                  fontSize: 30.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.pinkAccent),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                  /////////////////////////////
                  Padding(padding: EdgeInsets.symmetric(vertical: 50.0)),
                  //////////////////////////////
                  

                  //Button 2 for Calender
                  Expanded(
                    child: Card(
                      elevation: 8.0,
                      child: InkWell(
                        onTap: () {Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Calender()),
                          );},
                        child: Container(
                          width: double.infinity,
                          padding: EdgeInsets.all(10.0),
                          child: Center(
                            child: Text(
                              "Calender",
                              style: TextStyle(
                                  fontSize: 30.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.pinkAccent),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                  ////////////////////////////////
                  Padding(padding: EdgeInsets.symmetric(vertical: 50.0)),
                  ///////////////////////////////
                  

                  //Button 3 for Food Habbits
                  Expanded(
                    child: Card(
                      elevation: 8.0,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => HomePage()),
                          );
                        },
                        child: Container(
                          width: double.infinity,
                          padding: EdgeInsets.all(10.0),
                          child: Center(
                            child: Text(
                              "Food Habbits",
                              style: TextStyle(
                                  fontSize: 30.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.pinkAccent),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                  /////////////////
                ],
              ),
            ),
          ),
        ));
  }
}
