// import 'package:flutter/material.dart';
//
// import '../theme/theme.dart';
//
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
//           const PoemsAppTheme(
//             backgroundColor: Color(0xFFE53935),
//           ),
//         ],
//       ),
//       darkTheme: ThemeData.dark().copyWith(
//         extensions: <ThemeExtension<dynamic>>[
//           const PoemsAppTheme(
//             backgroundColor: Color(0xFF90CAF9),
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
//     final PoemsAppTheme myColors = Theme.of(context).extension<PoemsAppTheme>()!;
//     return Material(
//       child: Center(
//           child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: <Widget>[
//           Container(width: 100, height: 100, color: myColors.backgroundColor),
//           const SizedBox(width: 50),
//           IconButton(
//             icon: Icon(isLightTheme ? Icons.nightlight : Icons.wb_sunny),
//             onPressed: toggleTheme,
//           ),
//         ],
//       )),
//     );
//   }
// }
