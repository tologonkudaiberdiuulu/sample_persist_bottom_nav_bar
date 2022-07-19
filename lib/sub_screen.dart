import 'package:flutter/material.dart';

class SubScreen extends StatelessWidget {
  const SubScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sub'),
      ),
      body: const Center(
        child: Text('Ssub Screen'),
      ),
    );
  }
}
