import 'package:flutter/material.dart';
import 'package:flutter_json_builder/input.dart';
import 'package:flutter_json_builder/json_builder.dart';
import 'package:flutter_json_builder/output.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => JsonBuilder()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Json Builder',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      // home: const MyHomePage(title: 'Flutter Json Builder'),
      initialRoute: '/',
      routes: {
        '/': (context) => const JsonInputScreen(),
        '/output': (context) => const JsonOutputScreen(),
      },
    );
  }
}
