import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/components/app_drawer.dart';
import 'package:shop/components/order.dart';
import 'package:shop/models/order_list.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final OrderList orders = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Meus pedidos'),
      ),
      body: ListView.builder(
          itemCount: orders.items.length,
          itemBuilder: (ctx, i) {
            return OrderWidget(order: orders.items[i]);
          }),
      drawer: const AppDrawer(),
    );
  }
}