import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_smart/consts/app_color.dart';
import 'package:shop_smart/widgets/subtitle_text.dart';
import 'package:shop_smart/widgets/title_text.dart';
import '../providers/theme_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider =  Provider.of<ThemeProvider>(context);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SubtitleTextWidge(label: "Hello World",),
            const SubtitleTextWidge(label: "Hello World 1",),
            const SubtitleTextWidge(label: "Hello World 2",),
            TitleTextWidget(label: "Hello Phan Đức*" * 10 ),
            ElevatedButton(
                onPressed: () {},
                child: Text("Hello World"),
            ),
            SwitchListTile(
              title: Text(themeProvider.getIsDartThem? "Dark Mode" : "Light Mode"),
                value: themeProvider.getIsDartThem,
                onChanged: (value) {
                  themeProvider.setDarkTheme(value);
                  log("Theme state ${themeProvider.getIsDartThem}");
                }
            )
          ],
        ),
      ),
    );
  }
}
