import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class ThemeText {
  static final TextStyle regular = GoogleFonts.inter(
    fontSize: 17,
    color: Colors.black,
  );

  static final TextStyle bold = GoogleFonts.inter(
    fontSize: 23,
    color: Colors.black,
    fontWeight: FontWeight.w700,
  );

  static final TextStyle smallBold = GoogleFonts.inter(
    fontSize: 15,
    color: Colors.black,
    fontWeight: FontWeight.w700,
  );

  static final TextStyle defaultPoem = GoogleFonts.lora(
    fontSize: 20,
    color: Colors.black,
  );
  static final TextStyle defaultPoemTitle = GoogleFonts.openSans(
    fontSize: 23,
    color: Colors.black,
    fontWeight: FontWeight.w700,
  );
}
