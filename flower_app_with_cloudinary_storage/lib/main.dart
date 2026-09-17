import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'models/flower_model.dart';
import 'screens/add_flower.dart';
import 'screens/flower_detail_view.dart';
import 'screens/flower_list.dart';
import 'screens/update_flower.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  } catch (e) {
    debugPrint('Firebase initialization note: $e');
  }

  runApp(const FlowerApp());
}

class FlowerApp extends StatelessWidget {
  const FlowerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flower CRUD App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.teal,
          brightness: Brightness.light,
        ),
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          backgroundColor: Colors.teal,
          foregroundColor: Colors.white,
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Colors.teal,
          foregroundColor: Colors.white,
        ),
      ),
      // --- Direct Named Routes Definition ---
      initialRoute: '/',
      routes: {
        '/': (context) => const FlowerListScreen(),
        '/add': (context) => const AddFlowerScreen(),
        '/update': (context) {
          final flower = ModalRoute.of(context)?.settings.arguments as Flower?;
          if (flower == null) return const FlowerListScreen();
          return UpdateFlowerScreen(flower: flower);
        },
        '/detail': (context) {
          final flower = ModalRoute.of(context)?.settings.arguments as Flower?;
          if (flower == null) return const FlowerListScreen();
          return FlowerDetailView(flower: flower);
        },
      },
    );
  }
}
