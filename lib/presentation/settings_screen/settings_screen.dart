import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<StatefulWidget> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Settings")),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Dark theme",
                style: TextStyle(fontSize: 30),
              ),
              FutureBuilder(
                future: AdaptiveTheme.getThemeMode(),
                builder: (BuildContext context, themeSnapshot) {
                  return Switch(
                    value: themeSnapshot.data == AdaptiveThemeMode.dark,
                    onChanged: (bool value) {
                      setState(
                        () {
                          setState(() {
                            AdaptiveTheme.of(context).toggleThemeMode();
                          });
                        },
                      );
                    },
                  );
                },
              ),
            ],
          ),
          Row(
            children: const [
              Text("Second row"),
            ],
          )
        ],
      ),
    );
  }
}

// class MyApp extends StatefulWidget {
//   const MyApp({super.key});
//
//   static const String _title = 'Flutter Code Sample';
//
//   @override
//   State<MyApp> createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyApp> {
//   bool isLightTheme = true;
//
//   void toggleTheme() {
//     setState(() => isLightTheme = !isLightTheme);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: MyApp._title,
//       theme: ThemeData.light().copyWith(
//         extensions: <ThemeExtension<dynamic>>[
//           const MyColors(
//             brandColor: Color(0xFF1E88E5),
//             danger: Color(0xFFE53935),
//           ),
//         ],
//       ),
//       darkTheme: ThemeData.dark().copyWith(
//         extensions: <ThemeExtension<dynamic>>[
//           const MyColors(
//             brandColor: Color(0xFF90CAF9),
//             danger: Color(0xFFEF9A9A),
//           ),
//         ],
//       ),
//       themeMode: isLightTheme ? ThemeMode.light : ThemeMode.dark,
//       home: Home(
//         isLightTheme: isLightTheme,
//         toggleTheme: toggleTheme,
//       ),
//     );
//   }
// }
//
// class Home extends StatelessWidget {
//   const Home({
//     super.key,
//     required this.isLightTheme,
//     required this.toggleTheme,
//   });
//
//   final bool isLightTheme;
//   final void Function() toggleTheme;
//
//   @override
//   Widget build(BuildContext context) {
//     final MyColors myColors = Theme.of(context).extension<MyColors>()!;
//     return Material(
//       child: Center(
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               Container(width: 100, height: 100, color: myColors.brandColor),
//               const SizedBox(width: 10),
//               Container(width: 100, height: 100, color: myColors.danger),
//               const SizedBox(width: 50),
//               IconButton(
//                 icon: Icon(isLightTheme ? Icons.nightlight : Icons.wb_sunny),
//                 onPressed: toggleTheme,
//               ),
//             ],
//           )),
//     );
//   }
// }
