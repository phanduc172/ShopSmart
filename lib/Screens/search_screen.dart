import 'package:flutter/material.dart';
import '../services/assets_manager.dart';
import '../widgets/products/product_widget.dart';
import '../widgets/title_text.dart';
import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late TextEditingController searchTextController;

  @override
  void initState() {
    searchTextController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    searchTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              AssetsManager.shoppingCart,
            ),
          ),
          title: const TitleTextWidget(label: "Search products"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () {
              print("Todo đã thêm vào sản phẩm");
            },
            child: Column(
              children: [
                const SizedBox(
                  height: 15.0,
                ),
                TextField(
                  controller: searchTextController,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.search),
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          FocusScope.of(context).unfocus();
                          searchTextController.clear();
                        });
                      },
                      child: const Icon(
                        Icons.clear,
                        color: Colors.red,
                      ),
                    ),
                  ),
                  onChanged: (value) {
                    // log("value of the text is $value");
                  },
                  onSubmitted: (value) {
                    // log("value of the text is $value");
                    // log("value of the controller text: ${searchTextController.text}");
                  },
                ),
                const SizedBox(
                  height: 15.0,
                ),
                Expanded(
                  child: DynamicHeightGridView(
                      mainAxisSpacing: 12,
                      crossAxisSpacing: 12,
                      builder: (context, index) {
                        return const ProductWidget();
                      },
                      itemCount: 200,
                      crossAxisCount: 2),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
