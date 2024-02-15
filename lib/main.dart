import 'package:examen_final_fernandez/preferences/preferences.dart';
import 'package:examen_final_fernandez/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); //este widget nos asegura que se han establecido unos canales primitivos a bajo nivel para ejecutar el metodo asincrono para inicializar
  await Preferences.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Examen Final Antonio Fernandez Muñoz',
      initialRoute: '/login',
      getPages: [
        GetPage(
          name: '/login',
          page: () => const LoginScreen(),
        ),
        GetPage(name: '/home', page: () => const HomeScreen()),
      ],
      theme: ThemeData.dark(),
    );
  }
}
