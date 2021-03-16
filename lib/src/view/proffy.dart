import 'package:flutter/material.dart';

import 'package:proffy/src/view/utils/app_theme.dart';

class Proffy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Proffy',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.theme,
      home: Scaffold(body: Center(child: Text('Proffy APP'))),
    );
  }
}
