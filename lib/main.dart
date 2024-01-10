import 'package:expenses/Widget/expenses.dart';
import 'package:flutter/material.dart';

void main() {
  var kcolorScheme = ColorScheme.fromSeed(
    seedColor: const Color.fromARGB(255, 40, 18, 91),
  );

  var kdarkcolorscheme = ColorScheme.fromSeed(
      brightness: Brightness.dark,
      seedColor: const Color.fromARGB(255, 5, 99, 125));

  runApp(
    MaterialApp(
      darkTheme: ThemeData.dark().copyWith(
        //  useMaterial3: true,
        colorScheme: kdarkcolorscheme,

        /*textTheme: ThemeData().textTheme.copyWith(
              titleLarge: const TextStyle(fontWeight: FontWeight.bold,
              fontSize: 15,
              ),
            ),
            appBarTheme: const AppBarTheme().copyWith(
                color: kdarkcolorscheme.onPrimaryContainer,
                foregroundColor: kdarkcolorscheme.onPrimary,
            ),*/

        cardTheme: const CardTheme().copyWith(
          color: kdarkcolorscheme.secondaryContainer,
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 14),
        ),

        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              backgroundColor: kdarkcolorscheme.primaryContainer,
              foregroundColor: kdarkcolorscheme.onPrimaryContainer),
        ),
      ),
      theme: ThemeData().copyWith(
        scaffoldBackgroundColor: kcolorScheme.secondaryContainer,
        colorScheme: kcolorScheme,
        appBarTheme: const AppBarTheme().copyWith(
            backgroundColor: kcolorScheme.onPrimaryContainer,
            foregroundColor: kcolorScheme.primaryContainer),
        cardTheme: const CardTheme().copyWith(
          color: kcolorScheme.onPrimaryContainer,
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          shadowColor: kcolorScheme.onPrimaryContainer,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kcolorScheme.primaryContainer,
          ),
        ),
        textTheme: ThemeData().textTheme.copyWith(
              titleLarge: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 251, 251, 251),
                fontSize: 15,
              ),
            ),
      ),
      themeMode: ThemeMode.system,
      home: const Expenses(),
    ),
  );
}
