import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';
import 'package:shop_smart/services/assets_manager.dart';
import 'package:shop_smart/widgets/app_name_text.dart';
import 'package:shop_smart/widgets/subtitle_text.dart';
import '../providers/theme_provider.dart';
import '../widgets/title_text.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        leading: Image.asset(AssetsManager.shoppingCart),
        title: const AppNameTextWidget(fontSize: 30,),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Visibility(
              visible: false,
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: TitleTextWidget(
                  label: "Vui lòng đăng nhập để có truy cập không giới hạn",
                ),
              ),
            ),
            Visibility(
              child: Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                child: Row(
                  children: [
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Theme.of(context).cardColor,
                        border: Border.all(
                          color: Theme.of(context).colorScheme.background,
                          width: 3,
                        ),
                        image: DecorationImage(
                          image: const NetworkImage(
                              "https://scontent.fdad1-4.fna.fbcdn.net/v/t39.30808-6/368888831_1405741093316117_1025392992405696762_n.jpg?_nc_cat=103&ccb=1-7&_nc_sid=efb6e6&_nc_eui2=AeEmxWhINpsNSdr80Y-CtUhKM0RNmvTQ_aIzRE2a9ND9ovpNPE6u9U11qU3j48tas8lyTWy22OMimkytXRlJKllk&_nc_ohc=zC3SSIQefTcAX8r5_N3&_nc_ht=scontent.fdad1-4.fna&oh=00_AfDswggms_r5XxqQPqp_xLfabt-lgdoJZcDP0IpL9LxP7A&oe=6573069D"),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        TitleTextWidget(label: "Phan Đức"),
                        SizedBox(
                          height: 6,
                        ),
                        SubtitleTextWidge(
                            label: "Email: phanduc172@gmail.com")
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Divider(),
                  const TitleTextWidget(label: "General"),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomListTitle(
                    imagePath: AssetsManager.orderSvg,
                    text: "All Orders",
                    function: () {},
                  ),
                  CustomListTitle(
                    imagePath: AssetsManager.wishlistSvg,
                    text: "Wishlist",
                    function: () {},
                  ),
                  CustomListTitle(
                    imagePath: AssetsManager.recent,
                    text: "Viewed Recently",
                    function: () {},
                  ),
                  CustomListTitle(
                    imagePath: AssetsManager.address,
                    text: "Adress",
                    function: () {},
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Divider(),
                  const TitleTextWidget(label: "Settings"),
                  const SizedBox(
                    height: 10,
                  ),
                  SwitchListTile(
                      secondary: Image.asset(AssetsManager.theme),
                      title: Text(themeProvider.getIsDartThem
                          ? "Dark Mode"
                          : "Light Mode"),
                      value: themeProvider.getIsDartThem,
                      onChanged: (value) {
                        themeProvider.setDarkTheme(value);
                      }),
                  const SizedBox(
                    height: 5,
                  ),
                  Divider(),
                  const TitleTextWidget(label: "Khác"),
                  CustomListTitle(
                    imagePath: AssetsManager.address,
                    text: "Địa Chỉ",
                    function: () {},
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Center(
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      )),
                  onPressed: () {},
                  icon: Icon(Icons.login),
                  label: const Text("Đăng Nhập"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomListTitle extends StatelessWidget {
  const CustomListTitle({
    Key? key,
    required this.imagePath,
    required this.text,
    required this.function,
  }) : super(key: key);

  final String imagePath, text;
  final Function function;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        function();
      },
      title: SubtitleTextWidge(label: text),
      leading: Image.asset(
        imagePath,
        height: 34,
      ),
      trailing: const Icon(IconlyLight.arrowRight2),
    );
  }
}
