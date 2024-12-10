import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_assigment/providers/theme_provider.dart';

class SettingScreen extends ConsumerWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(appThemeProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            ListTile(
              leading: Text(theme ? "Dark" : "Light", style:const TextStyle(fontSize: 20,),),
              trailing: Switch(
                value: theme,
                onChanged: (value){
                  ref.read(appThemeProvider.notifier).toggle();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
