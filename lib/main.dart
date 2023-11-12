import 'package:devfest23/features/router/presentation/router_page.dart';
import 'package:devfest23/shared/style/devfest23_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: GoogleFonts.openSansTextTheme(textTheme).copyWith(
          bodyLarge: GoogleFonts.robotoMono(
            textStyle: textTheme.bodyLarge,
          ),
          bodyMedium: GoogleFonts.robotoMono(
            textStyle: textTheme.bodyMedium,
          ),
          bodySmall: GoogleFonts.robotoMono(
            textStyle: textTheme.bodySmall,
          ),
          labelLarge: GoogleFonts.robotoMono(
            textStyle: textTheme.labelLarge,
          ),
          labelMedium: GoogleFonts.robotoMono(
            textStyle: textTheme.labelMedium,
          ),
          labelSmall: GoogleFonts.robotoMono(
            textStyle: textTheme.labelSmall,
          ),
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: DevFest23Colors.yellow),
        useMaterial3: true,
      ),
      home: const RouterPage(),
    );
  }
}
