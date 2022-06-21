import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/components/app_drawer.dart';
import 'package:shop/components/order.dart';
import 'package:shop/models/order_list.dart';

class OrdersPage extends StatelessWidget {
  // bool _isLoading = true;

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   Provider.of<OrderList>(context, listen: false)
  //       .loadOrders()
  //       .then((value) => {
  //             setState(() {
  //               _isLoading = false;
  //             })
  //           });
  // }

  @override
  Widget build(BuildContext context) {
    // final OrderList orders = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Meus pedidos'),
      ),
      body: FutureBuilder(
        future: Provider.of<OrderList>(context, listen: false).loadOrders(),
        builder: (ctx, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.error != null) {
            return const Center(child: Text('Ocorreu um erro!'));
          } else {
            return Consumer<OrderList>(builder: (ctx, orders, child) {
              return ListView.builder(
                itemCount: orders.items.length,
                itemBuilder: (ctx, i) {
                  return OrderWidget(order: orders.items[i]);
                },
              );
            });
          }
        },
      ),
      // body: _isLoading
      //     ? const Center(
      //         child: CircularProgressIndicator(),
      //       )
      // : ListView.builder(
      //     itemCount: orders.items.length,
      //     itemBuilder: (ctx, i) {
      //       return OrderWidget(order: orders.items[i]);
      //     }),
      drawer: const AppDrawer(),
    );
  }
}
