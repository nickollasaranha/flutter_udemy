import 'package:flutter/material.dart';

import '../utils/app_routes.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(
      children: [
        AppBar(
          title: Text('Bem vindo Usuário!'),
          automaticallyImplyLeading: false,
        ),
        Divider(),
        ListTile(
          leading: Icon(Icons.shop),
          title: Text('Loja'),
          onTap: () {
            Navigator.of(context).pushReplacementNamed(AppRoutes.home);
          },
        ),
        Divider(),
        ListTile(
          leading: Icon(Icons.payment),
          title: Text('Pedido'),
          onTap: () {
            Navigator.of(context).pushReplacementNamed(AppRoutes.order);
          },
        ),
      ],
    ));
  }
}
