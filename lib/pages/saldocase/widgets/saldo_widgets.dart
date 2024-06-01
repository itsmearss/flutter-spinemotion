import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spinemotion_app/pages/saldocase/provider/cart.dart';
import 'package:spinemotion_app/pages/saldocase/provider/money.dart';

AppBar buildAppBar() {
  return AppBar(
    backgroundColor: Colors.purple,
    title: Text("Multi Provider"),
  );
}

Widget balanceBox() {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Balance"),
            Container(
              alignment: Alignment.centerRight,
              child: Consumer<Money>(
                builder: (context, money, _) => Text(money.balance.toString(),
                    style: TextStyle(
                        color: Colors.purple, fontWeight: FontWeight.w700)),
              ),
              height: 30,
              width: 150,
              margin: EdgeInsets.all(5),
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.purple[100],
                  border: Border.all(color: Colors.purple, width: 2)),
            )
          ],
        ),
        Container(
          alignment: Alignment.centerRight,
          child: Consumer<Cart>( builder: (context, cart, _) => Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("Apple (500) x " + cart.quantity.toString(),
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w500)),
                Text(
                    (500 * cart.quantity).toString(),
                    style: TextStyle(
                        color: Colors.purple, fontWeight: FontWeight.w700)),
              ],
            ),
          ),
          height: 30,
          margin: EdgeInsets.all(5),
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: Colors.black, width: 2)),
        )
      ],
    ),
  );
}
