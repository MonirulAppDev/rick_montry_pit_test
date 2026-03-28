import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'injection_container.dart' as di;
import 'my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox('characters');
  await Hive.openBox('favorites');
  await Hive.openBox('character_overrides');
  await dotenv.load(fileName: ".env");
  await di.init();
  runApp(const ProviderScope(child: MyApp()));
}
