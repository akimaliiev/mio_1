import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mio_1/themes/theme_provider.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: const Text("S E T T I N G S"),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.grey,
        elevation: 0,
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 600),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  borderRadius: BorderRadius.circular(12)
                ),
                margin: const EdgeInsets.all(25),
                padding: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Dark Mode",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.inversePrimary
                      ),
                    ),
                    CupertinoSwitch(
                      value: Provider.of<ThemeProvider>(context, listen: false).isDarkMode, 
                      onChanged: (value) => Provider.of<ThemeProvider>(context, listen: false).toggleThemes(),
                    ),
                  ],
                ),
              ),


              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  borderRadius: BorderRadius.circular(12)
                ),
                margin: const EdgeInsets.all(25),
                padding: const EdgeInsets.all(16),
                
              ),
            ],
          ),
        ),
      ),
    );
  }
}