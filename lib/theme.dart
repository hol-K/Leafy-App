import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Ce fichier centralise toute l'identité visuelle de l'application Leafy.
class LeafyTheme {
  // 1. DÉFINITION DES COULEURS OFFICIELLES
  // Extraites directement de ton document "Color Style"
  static const Color persianGreen = Color(0xFF14905C); // Couleur primaire
  static const Color vampireBlack = Color(
    0xFF0A1511,
  ); // Texte et éléments sombres
  static const Color brightGray = Color(0xFFF0F8F5); // Fond des écrans
  static const Color davyGrey = Color(0xFF6F7B76); // Textes secondaires
  static const Color white = Color(0xFFFFFFFF); // Cartes et surfaces

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor:
          brightGray, // Applique le gris très clair au fond
      primaryColor: persianGreen,

      // 2. CONFIGURATION DE LA TYPOGRAPHIE
      // On utilise 'Inter' qui est l'alternative gratuite la plus proche de Helvetica Neue
      textTheme: GoogleFonts.interTextTheme().copyWith(
        // Style pour "Discover Your Plant"
        displayLarge: GoogleFonts.inter(
          color: const Color.fromARGB(153, 20, 144, 92),
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
        // Style pour les titres de sections (ex: "Your Plants")
        titleMedium: GoogleFonts.inter(
          color: persianGreen,
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
        // Style pour le texte courant ou les noms de plantes
        bodyMedium: GoogleFonts.inter(
          color: davyGrey,
          fontSize: 14,
          fontWeight: FontWeight.normal,
        ),
      ),

      // 3. STYLE DES COMPOSANTS (Ex: Boutons, Input)
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: white,
        hintStyle: TextStyle(color: davyGrey.withOpacity(0.5)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            30,
          ), // Bordures très arrondies comme sur le design
          borderSide: BorderSide.none,
        ),
        prefixIconColor: davyGrey,
      ),

      // Style de la barre de navigation (BottomNavBar)q
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Color.fromARGB(
          119,
          240,
          248,
          245,
        ), // Sera géré par notre widget flottant
        selectedItemColor: persianGreen,
        unselectedItemColor: davyGrey,
      ),
    );
  }
}
