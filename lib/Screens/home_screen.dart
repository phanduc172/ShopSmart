import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_smart/consts/app_constants.dart';
import 'package:shop_smart/widgets/products/ctg_rounded_widget.dart';
import 'package:shop_smart/widgets/products/latest_arrival.dart';
import 'package:shop_smart/widgets/title_text.dart';
import '../providers/products_provider.dart';
import '../services/assets_manager.dart';
import '../widgets/app_name_text.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final productsProvider = Provider.of<ProductsProvider>(context);
    return Scaffold(
      appBar: AppBar(
        leading: Image.asset(AssetsManager.shoppingCart),
        title: const AppNameTextWidget(
          fontSize: 30,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10.0,
              ),
              SizedBox(
                height: size.height * 0.25,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Swiper(
                    autoplay: true,
                    itemBuilder: (BuildContext context, int index) {
                      return Image.asset(AppConstants.bannersImage[index],
                          fit: BoxFit.fill);
                    },
                    itemCount: AppConstants.bannersImage.length,
                    pagination: SwiperPagination(),
                    control: SwiperControl(),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TitleTextWidget(label: "Sản phẩm mới nhất"),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: size.height * 0.2,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return ChangeNotifierProvider.value(
                        value: productsProvider.getProducts[index],
                        child: LastestArrivalProductsWidget(),
                      );
                    }),
              ),
              const SizedBox(
                height: 10,
              ),
              TitleTextWidget(label: "Danh mục"),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: size.height * 0.2,
                child: GridView.count(
                    shrinkWrap: true,
                    //physics: NeverScrollableScrollPhysics(),
                    crossAxisCount: 4,
                    children: List.generate(AppConstants.categoriesList.length,
                        (index) {
                      return CategoryRoundedWidget(
                          image: AppConstants.categoriesList[index].image,
                          name: AppConstants.categoriesList[index].name);
                    })),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
