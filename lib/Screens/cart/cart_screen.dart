import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_smart/Screens/cart/bottom_checkout.dart';
import 'package:shop_smart/Screens/cart/card_widget.dart';
import 'package:shop_smart/providers/cart_provider.dart';
import 'package:shop_smart/services/assets_manager.dart';
import 'package:shop_smart/services/my_app_functions.dart';
import 'package:shop_smart/widgets/empty_bag.dart';
import 'package:shop_smart/widgets/title_text.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});
  final bool isEmpty = false;
  @override
  Widget build(BuildContext context) {
    // final productsProvider = Provider.of<ProductsProvider>(context);
    final cartProvider = Provider.of<CartProvider>(context);
    return cartProvider.getCartitems.isEmpty
        ? Scaffold(
            body: EmptyBagWidget(
              imagePath: AssetsManager.shoppingBasket,
              title: "Giỏ hàng trống",
              subtitle:
                  "Giỏ hàng trống, hãy thêm sản phẩm vào giỏ hàng",
              buttonText: "Mua ngay",
            ),
          )
        : Scaffold(
            bottomSheet: CartBottomSheetWidget(),
            appBar: AppBar(
              leading: Image.asset(AssetsManager.shoppingCart),
              title: TitleTextWidget(
                  label: "Cart (${cartProvider.getCartitems.length})"),
              actions: [
                IconButton(
                  onPressed: () {
                    MyAppFunctions.showErrorOrWarningDialog(
                        isError: false,
                        context: context,
                        subtitle: "Clear cart",
                        fct: () {
                          cartProvider.clearLocalCart();
                        });
                  },
                  icon: const Icon(Icons.delete_forever_rounded),
                ),
              ],
            ),
            body: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: cartProvider.getCartitems.length,
                    itemBuilder: (context, index) {
                      return ChangeNotifierProvider.value(
                          value:
                              cartProvider.getCartitems.values.toList()[index],
                          child: const CartWidget());
                    },
                  ),
                ),
                SizedBox(
                  height: kBottomNavigationBarHeight + 10,
                ),
              ],
            ),
          );
  }
}
