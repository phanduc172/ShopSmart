import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_smart/Screens/auth/login.dart';
import 'package:shop_smart/Screens/auth/register.dart';
import 'package:shop_smart/Screens/inner_screen/product_details.dart';
import 'package:shop_smart/Screens/search_screen.dart';
import 'package:shop_smart/consts/theme_data.dart';
import 'package:shop_smart/providers/cart_provider.dart';
import 'package:shop_smart/providers/products_provider.dart';
import 'package:shop_smart/providers/theme_provider.dart';
import 'package:shop_smart/root_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Firebase.initializeApp(
          options: FirebaseOptions(
              apiKey: "AIzaSyAxkS9tzj-chj6DEZFlT0RXuAbd5DtDt8w",
              appId: "1:400327053375:android:604e97061ea9699a60288a",
              messagingSenderId: "400327053375",
              projectId: "shopsmart-d0731"),
        ),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return MaterialApp(
              home: const Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            );
          } else if (snapshot.hasError) {
            return MaterialApp(
              home: Scaffold(
                body: Center(
                  child: SelectableText(snapshot.error.toString()),
                ),
              ),
            );
          }
          return MultiProvider(
            providers: [
              ChangeNotifierProvider(create: (_) {
                return ThemeProvider();
              }),
              ChangeNotifierProvider(create: (_) {
                return ProductsProvider();
              }),
              ChangeNotifierProvider(create: (_) {
                return CartProvider();
              }),
            ],
            child: Consumer<ThemeProvider>(
                builder: (context, themeProvider, child) {
              return MaterialApp(
                title: 'Shop Smart',
                theme: Styles.themeData(
                    isDarkTheme: themeProvider.getIsDartThem, context: context),
                home: RootScreen(),
                // home: LoginScreen(),
                routes: {
                  RootScreen.routeName: ((context) => const RootScreen()),
                  ProductDetailsScreen.routName: ((context) =>
                      const ProductDetailsScreen()),
                  RegisterScreen.routName: ((context) =>
                      const RegisterScreen()),
                  LoginScreen.routeName: ((context) => const LoginScreen()),
                  SearchScreen.routeName: ((context) => const SearchScreen()),
                },
                debugShowCheckedModeBanner: false,
              );
            }),
          );
        });
  }
}
