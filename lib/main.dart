import 'package:flutter/material.dart';
import 'package:images/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      // غیر فعال کردن بنر اشکال زدایی
      debugShowCheckedModeBanner: false,
      // صدا زدن صفحه اصلی برنامه
      home: HomePage(),
    );
  }
}
