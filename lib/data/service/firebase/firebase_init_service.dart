import 'package:firebase_core/firebase_core.dart';
import '../../../firebase_options.dart';

class FirebaseInitService {
  static bool _isInitialized = false;

  static Future<void> initializeFirebase() async {
    if (!_isInitialized) {
      try {
        await Firebase.initializeApp(
          options: DefaultFirebaseOptions.currentPlatform,
        );
        _isInitialized = true;
      } catch (e) {
        throw Exception('Failed to initialize Firebase: $e');
      }
    }
  }

  static bool get isInitialized => _isInitialized;
}
