import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class Calender extends StatefulWidget {
  @override
  _CalenderState createState() => _CalenderState();
}

class _CalenderState extends State<Calender> {
  CalendarController _controller;

  final TextEditingController t1 = new TextEditingController();
  final TextEditingController t2 = new TextEditingController();
  final TextEditingController t3 = new TextEditingController();

  Map<DateTime, List<dynamic>> _events;

  TextEditingController _eventController;

  List<dynamic> _selectedEvents;

  SharedPreferences prefs;



  

  var y = 2000;
  var m = 1;
  var d = 1;
  DateTime due = DateTime.now();

  

  void assign() {
    setState(() {
      d = int.parse(t1.text);
      m = int.parse(t2.text);
      y = int.parse(t3.text);
      print(DateTime(y, m, d));
      due = DateTime(y, m, d).add(new Duration(days: 280));
      print(due);
    });
  }

  @override


  
  void initState() {
    super.initState();
    _controller = CalendarController();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calender"),
        centerTitle: true,
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              //Calender Starts

              TableCalendar(
                events: _events,
                calendarController: _controller,
                startDay: DateTime(y, m, d).add(new Duration(days: 14)),
                endDay: DateTime(y, m, d).add(new Duration(days: 280)),

               


                //Calender Style Start

                calendarStyle: CalendarStyle(
                  todayColor: Colors.pink,
                  selectedColor: Colors.pink[100],

                  //today Style Start

                  todayStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                      color: Colors.white),

                  //today Style End
                ),

                //CalenderStyleEnd

                //Header Style Start

                headerStyle: HeaderStyle(
                  formatButtonDecoration: BoxDecoration(
                    color: Colors.pink[400],
                  ),
                  formatButtonTextStyle: TextStyle(color: Colors.white),
                  formatButtonShowsNext: false,
                ),

                onDaySelected: (date, events) {
                  setState(() {
                    _selectedEvents = events;
                  });
                },

                //Header Style End
              ),

              //Calender Ends

              Padding(padding: EdgeInsets.only(top: 5.0, bottom: 5.0)),

              Card(
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
                        Text(
                          "Enter First Date of last Menstrual Cycle",
                          style: TextStyle(
                              color: Colors.pinkAccent,
                              fontWeight: FontWeight.bold),
                        ),
                        Padding(
                            padding: EdgeInsets.only(top: 5.0, bottom: 5.0)),
                        Row(
                          children: <Widget>[
                            Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10.0, vertical: 0.0)),
                            Expanded(
                                child: TextField(
                              decoration: InputDecoration(hintText: 'DD'),
                              controller: t1,
                              keyboardType: TextInputType.number,
                            )),
                            Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10.0, vertical: 0.0)),
                            Expanded(
                                child: TextField(
                              decoration: InputDecoration(
                                hintText: 'MM',
                              ),
                              controller: t2,
                              keyboardType: TextInputType.number,
                            )),
                            Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10.0, vertical: 0.0)),
                            Expanded(
                                child: TextField(
                              decoration: InputDecoration(hintText: 'YYYY'),
                              controller: t3,
                              keyboardType: TextInputType.number,
                            )),
                            Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10.0, vertical: 0.0)),
                          ],
                        ),
                        Padding(
                            padding: EdgeInsets.only(top: 10.0, bottom: 10.0)),
                        MaterialButton(
                          elevation: 8.0,
                          padding: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 30.0),
                          child: Text(
                            'Predict Due Date',
                            style:
                                TextStyle(color: Colors.white, fontSize: 20.0),
                          ),
                          color: Colors.pinkAccent,
                          onPressed: (assign),
                        ),
                        Padding(
                            padding: EdgeInsets.only(top: 10.0, bottom: 10.0)),
                        Text(
                          'Due Date is : ' +
                              ((y == 2000)
                                  ? ('')
                                  : (due.day.toString() +
                                          '/' +
                                          due.month.toString() +
                                          '/' +
                                          due.year.toString())
                                      .toString()),
                          style: TextStyle(
                              fontSize: 30.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.pink),
                        ),
                        SizedBox(
                          height: 15.0,
                          width: 100.0,
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

}
