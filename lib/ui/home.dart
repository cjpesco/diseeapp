import 'package:flutter/material.dart';

import 'diseepage.dart';

class DiseeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        title: Text('Disee'),
        backgroundColor: Colors.red,
      ),
      body: DiseePage(),
    );
  }
}
