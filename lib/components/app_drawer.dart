import 'package:flutter/material.dart';
import 'package:shop/routes/app_routes.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(children: [
        AppBar(
          title: const Text('Bem vindo User!'),
          automaticallyImplyLeading: false,
        ),
        const Divider(),
        ListTile(
          title: const Text('Loja'),
          leading: const Icon(Icons.shop),
          onTap: () {
            Navigator.of(context).pushReplacementNamed(AppRoutes.HOME);
          },
        ),
        const Divider(),
        ListTile(
          title: const Text('Pedidos'),
          leading: const Icon(Icons.shop),
          onTap: () {
            Navigator.of(context).pushReplacementNamed(AppRoutes.ORDERS);
          },
        ),
        const Divider(),
        ListTile(
          title: const Text('Gerenciar Produtos'),
          leading: const Icon(Icons.edit),
          onTap: () {
            Navigator.of(context).pushReplacementNamed(AppRoutes.PRODUCTS);
          },
        ),
      ]),
    );
  }
}
