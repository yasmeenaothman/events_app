
import 'package:events_app/riverpod/providers/auth_providers.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'firebase_options.dart';
import 'modules/home_page.dart';
import 'modules/main_event_page.dart';
import 'modules/phone_verification_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends HookConsumerWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context,ref) {
    final firebaseAuthProvider = ref.watch(firebaseAuthStateProvider.notifier);
    final firebaseAuthState = ref.watch(firebaseAuthStateProvider);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: firebaseAuthState.currentUser!=null?const MainEventPage(): const HomePage(),//firebaseAuthProvider.checkUserIsLogin(),
      routes: {
        PhoneVerificationPage.routeName: (context)=> PhoneVerificationPage(),
        HomePage.routeName: (context)=> const HomePage(),
        MainEventPage.routeName: (context)=> const MainEventPage(),
      },
    );
  }
}


