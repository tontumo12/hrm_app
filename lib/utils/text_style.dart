import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextUtils {
  TextUtils();

  TextStyle regularQuickSand = GoogleFonts.quicksand().copyWith(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: Colors.grey,
  );

  TextStyle boldQuickSand = GoogleFonts.quicksand().copyWith(
    fontSize: 12,
    fontWeight: FontWeight.w700,
    color: Colors.black87,
  );

  TextStyle mediumQuickSand = GoogleFonts.quicksand().copyWith(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: Colors.black54,
  );
}
