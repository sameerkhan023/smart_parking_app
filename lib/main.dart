import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'app/app.dart';
import 'firebase_options.dart';

Future<void> main() async {
  // 1. Ensure Flutter bindings are initialized
  WidgetsFlutterBinding.ensureInitialized();

  // 2. Extremely safe Firebase initialization
  // Sometimes Firebase.apps.isEmpty returns true even if the native side
  // has already initialized the app (e.g., via google-services.json).
  // We use a try-catch block to specifically handle the [core/duplicate-app] exception.
  try {
    if (Firebase.apps.isEmpty) {
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
    }
  } on FirebaseException catch (e) {
    if (e.code == 'duplicate-app') {
      debugPrint('Firebase already initialized: ${e.message}');
    } else {
      rethrow;
    }
  } catch (e) {
    debugPrint('An error occurred during Firebase initialization: $e');
  }

  // 3. Run the app
  runApp(
    const SmartParkingApp(),
  );
}
