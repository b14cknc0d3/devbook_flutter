import 'package:devbook/src/binding/initbinding.dart';
import 'package:devbook/src/constant/color.dart';
import 'package:devbook/src/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await GetStorage.init('auth');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'devbook',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        primaryColor: ColorPlatte.primaryColor,
        // colorScheme: const ColorScheme.dark(),
      ),
      initialBinding: InitialBinding(),
      initialRoute: MyRoutes.home,
      getPages: MyRoutes.getPages,
    );
  }
}
