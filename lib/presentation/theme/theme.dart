// import 'package:flutter/material.dart';
// import 'package:freezed_annotation/freezed_annotation.dart';
// part 'theme.freezed.dart';
//
// @freezed
// class PoemsAppTheme extends ThemeExtension<PoemsAppTheme> {
//   const PoemsAppTheme({
//     required this.brandColor,
//     required this.danger,
//   });
//
//   final Color? brandColor;
//   final Color? danger;
//
//   @override
//   PoemsAppTheme copyWith({Color? brandColor, Color? danger}) {
//     return PoemsAppTheme(
//       brandColor: brandColor ?? this.brandColor,
//       danger: danger ?? this.danger,
//     );
//   }
//
//   @override
//   PoemsAppTheme lerp(PoemsAppTheme? other, double t) {
//     if (other is! PoemsAppTheme) {
//       return this;
//     }
//     return PoemsAppTheme(
//       brandColor: Color.lerp(brandColor, other.brandColor, t),
//       danger: Color.lerp(danger, other.danger, t),
//     );
//   }
//
//   // Optional
//   @override
//   String toString() => 'MyColors(brandColor: $brandColor, danger: $danger)';
// }