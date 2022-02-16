import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prueba_app/constantes.dart';
import 'package:prueba_app/provider/post_provider.dart';
import 'package:prueba_app/ui/lista.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => PostProvider()..init()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Prueba',
          theme: ThemeData(
            primaryColor: primaryColor,
          ),
          home: FutureBuilder(
            builder: (context, snapshot) {
              return PostPage();
            },
          ),
          //  routes: buildAppRoutes(),
        ));
  }
}
