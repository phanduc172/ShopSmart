import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';
import 'package:shop_smart/Screens/auth/login.dart';
import 'package:shop_smart/services/assets_manager.dart';
import 'package:shop_smart/services/my_app_functions.dart';
import 'package:shop_smart/widgets/app_name_text.dart';
import 'package:shop_smart/widgets/subtitle_text.dart';
import '../providers/theme_provider.dart';
import '../widgets/title_text.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  User? user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        leading: Image.asset(AssetsManager.shoppingCart),
        title: const AppNameTextWidget(
          fontSize: 30,
        ),
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
              visible: true,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
                              "https://images.unsplash.com/photo-1702651249569-1adb008c5fe2?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxN3x8fGVufDB8fHx8fA%3D%3D"),
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
                          height: 5,
                        ),
                        SubtitleTextWidge(label: "Email: phanduc172@gmail.com")
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const TitleTextWidget(label: "Tổng quan"),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomListTitle(
                    imagePath: AssetsManager.orderSvg,
                    text: "Tất cả đơn hàng",
                    function: () {},
                  ),
                  CustomListTitle(
                    imagePath: AssetsManager.wishlistSvg,
                    text: "Danh sách yêu thích",
                    function: () {},
                  ),
                  CustomListTitle(
                    imagePath: AssetsManager.recent,
                    text: "Đã xem gần đây",
                    function: () {},
                  ),
                  CustomListTitle(
                    imagePath: AssetsManager.address,
                    text: "Địa chỉ",
                    function: () {},
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Divider(),
                  const TitleTextWidget(label: "Cài đặt"),
                  const SizedBox(
                    height: 10,
                  ),
                  SwitchListTile(
                      secondary: Image.asset(AssetsManager.theme),
                      title: Text(themeProvider.getIsDartThem
                          ? "Chế độ tối"
                          : "Chế độ sáng"),
                      value: themeProvider.getIsDartThem,
                      onChanged: (value) {
                        themeProvider.setDarkTheme(value);
                      }),
                  const SizedBox(
                    height: 5,
                  ),
                  Divider(),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Center(
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0), // Điều chỉnh đây để thay đổi kích thước
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 18.0), // Điều chỉnh đây để thay đổi padding
                  ),
                  icon: Icon( user == null ?
                    Icons.login : Icons.logout,
                    color: Colors.white,
                  ),
                  label: Text(user == null ?
                    "Đăng Nhập" : "Đăng xuất",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () async {
                    if(user==null) {
                      Navigator.of(context).pushNamed(LoginScreen.routeName);
                    } else {
                      await MyAppFunctions.showErrorOrWarningDialog(
                          context: context,
                          subtitle: "Are you sure you want to signout",
                          fct: () async {
                            await FirebaseAuth.instance.signOut();
                            if(!mounted)
                              return;
                            Navigator.pushReplacementNamed(context, LoginScreen.routeName);
                          },
                          isError: false);
                    }
                  },
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