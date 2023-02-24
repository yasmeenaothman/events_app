import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../riverpod/providers/auth_providers.dart';

class MainEventPage extends HookConsumerWidget {
  static const String routeName = "/HomeScreen";
  const MainEventPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final firebaseAuthProvider = ref.watch(firebaseAuthStateProvider.notifier);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: ()=> firebaseAuthProvider.signOut(context),
          icon: const Icon(Icons.logout,),
        ),
      ),
      body: const Center(child: Text("MainEventPage")),
    );
  }
}
