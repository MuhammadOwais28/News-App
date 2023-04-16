// ignore_for_file: deprecated_member_use

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news_app/view_model/theme_viewmodel.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                CupertinoIcons.news,
                color: Theme.of(context).accentColor,
                weight: 0.5,
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                'Khabar',
                style: GoogleFonts.lato(
                    // letterSpacing: 1.1,
                    fontStyle: FontStyle.italic,
                    color: Theme.of(context).accentColor,
                    fontWeight: FontWeight.bold),
                textScaleFactor: 1.7,
              ),
            ],
          ),
          const SwitchButton()
        ],
      ),
    );
  }
}

class SwitchButton extends StatelessWidget {
  const SwitchButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final prov = context.watch<ThemeProvider>();
    return Transform.scale(
        scale: 0.8,
        child: FlutterSwitch(
          value: prov.dark,
          onToggle: (bool value) {
            prov.toggleTheme();
          },
          inactiveColor: Colors.grey.shade400,
          inactiveIcon: Icon(
            CupertinoIcons.moon_fill,
            color: Colors.grey.shade600,
          ),
          activeColor: Colors.black,
          activeIcon: const Icon(
            CupertinoIcons.moon_fill,
            color: Colors.black,
          ),
        ));
  }
}
