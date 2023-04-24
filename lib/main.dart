import 'package:chats_list_with_service_example/main_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Main());
}

class Main extends StatelessWidget {
  const Main({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const String title = "Chats List";
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: title,
      theme: ThemeData.light().copyWith(
        appBarTheme: const AppBarTheme(
          elevation: 0,
          backgroundColor: Colors.transparent,
        )
      ),
      home: const MainPage(),
    );
  }
}
