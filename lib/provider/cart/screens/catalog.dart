import 'package:flutter/material.dart';
import 'package:flutter_app_test_demo/provider/cart/models/cart.dart';
import 'package:flutter_app_test_demo/provider/cart/models/catalog.dart';
import 'package:flutter_app_test_demo/provider/cart/screens/cart.dart';
import 'package:provider/provider.dart';

class MyCatalog extends StatelessWidget {
  const MyCatalog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(slivers: [
        _MyAppBar(),
        const SliverToBoxAdapter(child: SizedBox(height: 12)),
        SliverList(
          delegate:
              SliverChildBuilderDelegate((_, index) => _MyListItem(index)),
        )
      ]),
    );
  }
}

class _MyAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      title: const Text('Catalog'),
      floating: true,
      actions: [
        IconButton(
          icon: const Icon(Icons.shopping_cart),
          onPressed: () {
            Navigator.of(context).push<dynamic>(MaterialPageRoute<dynamic>(
              builder: (_) => ChangeNotifierProvider.value(
                value: Provider.of<CartModel>(context, listen: false),
                child: const MyCart(),
              ),
            ));
          },
        )
      ],
    );
  }
}

class _MyListItem extends StatelessWidget {
  const _MyListItem(this.index, {Key? key}) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    final item = context
        .select<CatalogModel, Item>((value) => value.getByPosition(index));

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: LimitedBox(
        maxHeight: 48,
        child: Row(
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: Container(
                color: item.color,
              ),
            ),
            const SizedBox(width: 24),
            Expanded(
              child: Text(item.name),
            ),
            const SizedBox(width: 24),
            _AddButton(item: item),
          ],
        ),
      ),
    );
  }
}

class _AddButton extends StatelessWidget {
  const _AddButton({Key? key, required this.item}) : super(key: key);

  final Item item;

  @override
  Widget build(BuildContext context) {
    final isInCart =
        context.select<CartModel, bool>((value) => value.items.contains(item));

    return ElevatedButton(
      onPressed: isInCart
          ? null
          : () {
              // If the item is not in cart, we let the user add it.
              // We are using context.read() here because the callback
              // is executed whenever the user taps the button. In other
              // words, it is executed outside the build method.
              var cart = context.read<CartModel>();
              cart.add(item);
            },
      child: isInCart
          ? const Icon(Icons.check, semanticLabel: 'ADDED')
          : const Text('ADD'),
    );
  }
}
