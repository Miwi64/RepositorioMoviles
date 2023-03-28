import 'package:balance/provider/ui_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    final uiProvider = Provider.of<UIProvider>(context);

    return BottomNavigationBar(
        currentIndex: uiProvider.bnbIndex,
        elevation: 30,
        onTap: (int i) => uiProvider.bnbIndex = i,
        items: const [
          BottomNavigationBarItem(
              label: 'Balance', icon: Icon(Icons.account_balance)),
          BottomNavigationBarItem(
              label: 'Graficos', icon: Icon(Icons.bar_chart)),
          BottomNavigationBarItem(label: 'Ajustes', icon: Icon(Icons.settings)),
        ]);
  }
}
