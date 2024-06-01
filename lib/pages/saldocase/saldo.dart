import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spinemotion_app/pages/saldocase/provider/cart.dart';
import 'package:spinemotion_app/pages/saldocase/provider/money.dart';
import 'package:spinemotion_app/pages/saldocase/widgets/saldo_widgets.dart';

class SaldoCase extends StatelessWidget {
  const SaldoCase({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: MultiProvider(
      providers: [
        ChangeNotifierProvider<Money>(
          create: (context) => Money(),
        ),
        ChangeNotifierProvider<Cart>(
          create: (context) => Cart(),
        )
      ],
      child: Scaffold(
        floatingActionButton: Consumer<Money>(
          builder: (context, money, _) => Consumer<Cart>(
            builder: (context, cart, _) => FloatingActionButton(
              onPressed: () {
                if (money.balance >= 500) {
                  cart.quantity += 1;
                  money.balance -= 500;
                }
              },
              child: Icon(Icons.add_shopping_cart),
            ),
          ),
        ),
        appBar: buildAppBar(),
        body: balanceBox(),
      ),
    ));
  }
}
