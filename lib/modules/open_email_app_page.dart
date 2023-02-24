import 'package:flutter/material.dart';

class OpenEmailAppPage extends StatelessWidget {
  const OpenEmailAppPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Open Email App'),
      ),
      body: const Center(
        child: Text('Open Email App Page'),
      ),
    );
  }
}
