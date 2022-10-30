import 'package:flutter/material.dart';
import 'package:first_app/stock.dart';
import 'dart:math';

Random random = new Random();
int randomNumber = random.nextInt(20) + (-10);
int rand2 = random.nextInt(99) + (10); // RtoL

class StockList extends StatelessWidget {
  final List<Stock> stocks;
  StockList({this.stocks});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) {
        return Divider(color: Colors.grey[400]);
      },
      itemCount: stocks.length,
      itemBuilder: (context, index) {
        final stock = stocks[index];
        return ListTile(
          contentPadding: EdgeInsets.all(10),
          title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("${stock.symbol}",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w500)),
                Text("${stock.company}",
                    style: TextStyle(color: Colors.grey[500], fontSize: 20))
              ]),
          trailing: Column(children: <Widget>[
            Text("\$${stock.price}",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w500)),
            Container(
              width: 75,
              height: 25,
              child: Text("${randomNumber}.${rand2.abs()}%",
                  style: TextStyle(color: Colors.white)),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5), color: Colors.red),
            )
          ]),
        );
      },
    );
  }
}
