import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_smart/Screens/auth/login.dart';
import 'package:shop_smart/Screens/auth/register.dart';
import 'package:shop_smart/Screens/inner_screen/product_details.dart';
import 'package:shop_smart/consts/theme_data.dart';
import 'package:shop_smart/providers/theme_provider.dart';
import 'package:shop_smart/root_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) {
          return ThemeProvider();
        })
      ],
      child: Consumer<ThemeProvider>(builder: (context, themeProvider, child) {
        return MaterialApp(
          title: 'Shop Smart',
          theme: Styles.themeData(
              isDarkTheme: themeProvider.getIsDartThem, context: context),
          // home: RootScreen(),
          home: LoginScreen(),
          routes: {
            ProductDetailsScreen.routName: ((context) =>
                const ProductDetailsScreen()
            ),
            RegisterScreen.routName: ((context) => const RegisterScreen()
            ),
          },
          debugShowCheckedModeBanner: false,
        );
      }),
    );
  }
}
