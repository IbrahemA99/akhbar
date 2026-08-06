import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'features/news/data/models/news_model.dart';
import 'features/news/data/models/source_model.dart';
import 'features/news/presentation/screens/home_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
await Hive.initFlutter();
Hive.registerAdapter(NewsModelAdapter());
Hive.registerAdapter(ArticlesAdapter());
Hive.registerAdapter(SourceAdapter());
Hive.registerAdapter(SourceModelAdapter());

  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

debugShowCheckedModeBanner: false,
initialRoute: HomeScreen.routeName,
      routes: {
  HomeScreen.routeName: (context) => HomeScreen(categoryId: '',),
      },
    );
  }
}
