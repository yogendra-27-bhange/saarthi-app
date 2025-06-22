import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../theme.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final appSettings = Provider.of<AppSettings>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings & Accessibility'),
      ),
      body: ListView(
        children: [
          SwitchListTile(
            title: const Text('Dark Mode'),
            value: appSettings.isDarkMode,
            onChanged: (val) => appSettings.toggleDarkMode(val),
          ),
          SwitchListTile(
            title: const Text('Large Text'),
            value: appSettings.isLargeText,
            onChanged: (val) => appSettings.toggleLargeText(val),
          ),
          SwitchListTile(
            title: const Text('High Contrast'),
            value: false,
            onChanged: null,
          ),
          SwitchListTile(
            title: const Text('Voice Commands (Coming Soon)'),
            value: false,
            onChanged: null,
          ),
        ],
      ),
    );
  }
} 