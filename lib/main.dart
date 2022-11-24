import 'package:flutter/material.dart';
import 'package:gallery_app/controller/image_provider.dart';
import 'package:gallery_app/services/api_services.dart';
import 'package:gallery_app/view/home/home_screen.dart';
import 'package:provider/provider.dart';

void  main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=> GetImageProvider())
      ],
      child: MaterialApp(
        theme: ThemeData(
          tabBarTheme: TabBarTheme(
            labelColor: Colors.black,
          )
        ),
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    );
  }
}