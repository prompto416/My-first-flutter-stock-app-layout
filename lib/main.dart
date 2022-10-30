import 'package:first_app/stock.dart';
import 'package:first_app/stockdata.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: "Stocks", home: Layout());
  }
}

class Layout extends StatelessWidget {
  var time = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      Container(
          padding: EdgeInsets.all(10),
          width: MediaQuery.of(context).size.width,
          color: Colors.black,
          child: SafeArea(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text("Stocks ",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 36,
                      fontWeight: FontWeight.bold)),
              Text("${DateFormat('EEEE, d MMM, yyyy').format(time)}",
                  style: TextStyle(
                      color: Colors.grey[500],
                      fontSize: 26,
                      fontWeight: FontWeight.bold)),
              Text("${DateFormat.jm().format(time)}",
                  style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 20,
                      fontWeight: FontWeight.normal)),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: SizedBox(
                    height: 50,
                    child: TextField(
                      decoration: InputDecoration(
                          hintStyle: TextStyle(color: Colors.grey[500]),
                          hintText: "Search",
                          prefix: Icon(Icons.search),
                          fillColor: Colors.grey[800],
                          filled: true,
                          border: OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 0, style: BorderStyle.none),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16)))),
                    )),
              ),
              SizedBox(
                  height: MediaQuery.of(context).size.height - 310,
                  child: StockList(stocks: Stock.getAll()))
            ]),
          ))
    ]));
  }
}
