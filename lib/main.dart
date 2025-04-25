import 'package:dr_ai/cache/cache.dart';
import 'package:dr_ai/data/service/firebase/firebase_init_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'app.dart';
import 'data/model/chat_message_model.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: '.env');

  try {
    await FirebaseInitService.initializeFirebase();
  } catch (e) {
    // Handle Firebase initialization error silently
  }

  await CacheData.cacheDataInit();

  await Hive.initFlutter();
  Hive.registerAdapter(ChatMessageModelAdapter());

  runApp(const MyApp());
}
