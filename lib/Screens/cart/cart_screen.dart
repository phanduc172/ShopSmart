import 'package:flutter/material.dart';
import 'package:shop_smart/Screens/cart/card_widget.dart';
import 'package:shop_smart/services/assets_manager.dart';
import 'package:shop_smart/widgets/empty_bag.dart';
import 'package:shop_smart/widgets/subtitle_text.dart';
import 'package:shop_smart/widgets/title_text.dart';

import '../../widgets/app_name_text.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});
  final bool isEmpty = false;
  @override
  Widget build(BuildContext context) {
    return isEmpty
        ? Scaffold(
            body: EmptyBagWidget(
              imagePath: AssetsManager.shoppingBasket,
              title: "Your cart is empty",
              subtitle:
                  "Looks like your cart is empty add somethong make me happy",
              buttonText: "Shop now",
            ),
          )
        : Scaffold(
            appBar: AppBar(
              leading: Image.asset(AssetsManager.shoppingCart),
              title: const TitleTextWidget(label: "Cart (6)"),
              actions: [
                IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.delete_forever_rounded),
                ),
              ],
            ),
            body: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return const CartWidget();
              },
            ),
          );
  }
}
