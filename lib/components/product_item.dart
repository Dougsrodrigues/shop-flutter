import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/models/product.dart';
import 'package:shop/models/product_list.dart';
import 'package:shop/routes/app_routes.dart';

class ProductItem extends StatelessWidget {
  final Product product;

  const ProductItem({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(product.imageUrl),
      ),
      title: Text(product.title),
      trailing: Container(
        width: 100,
        child: Row(
          children: [
            IconButton(
              icon: const Icon(Icons.edit),
              color: Theme.of(context).colorScheme.primary,
              onPressed: () {
                Navigator.of(context)
                    .pushNamed(AppRoutes.PRODUCT_FORM, arguments: product);
              },
            ),
            IconButton(
              icon: const Icon(Icons.delete),
              color: Theme.of(context).colorScheme.error,
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (ctx) => AlertDialog(
                          title: const Text('Excluir Produto'),
                          content: const Text('Tem certeza?'),
                          actions: [
                            TextButton(
                              child: const Text('Não'),
                              onPressed: () {
                                return Navigator.of(context).pop();
                              },
                            ),
                            TextButton(
                              child: const Text('Sim'),
                              onPressed: () {
                                Provider.of<ProductList>(
                                  context,
                                  listen: false,
                                ).removeProduct(product);
                                return Navigator.of(context).pop();
                              },
                            )
                          ],
                        ));
              },
            ),
          ],
        ),
      ),
    );
  }
}
