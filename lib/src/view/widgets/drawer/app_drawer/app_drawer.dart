import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:proffy/src/view/controllers/app_drawer_controller.dart';
import 'package:proffy/src/view/utils/pallete.dart';
import 'package:proffy/utils/injection.dart';
import 'package:proffy/router/router.dart' as router;

class AppDrawer extends StatelessWidget {
  final controller = Injection.find<AppDrawerController>();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Pallete.background,
        child: SafeArea(
          child: Column(
            children: [
              ListTile(
                leading: Icon(Icons.person, color: Pallete.secondary),
                title: Text('Perfil'),
                onTap: () => router.toNamed(router.Profile),
              ),
              ListTile(
                leading: Icon(Icons.logout, color: Pallete.error),
                title: Text('Sair', style: TextStyle(color: Pallete.error)),
                onTap: () => showDialog(
                  context: context,
                  builder: (_) => _buildAlertDialogForLogout(context),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAlertDialogForLogout(BuildContext context) {
    return AlertDialog(
      title: Text('Quer deslogar?'),
      actions: [
        TextButton(
          child: Text('Não'),
          onPressed: () => Navigator.of(context).pop(),
        ),
        TextButton(
          child: Text('Sim'),
          onPressed: controller.logout,
        ),
      ],
    );
  }
}
