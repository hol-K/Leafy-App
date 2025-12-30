// importation des packages nécessaires
import 'package:flutter/material.dart';
import 'package:leafy_app/features/main_wrapper.dart';
import 'theme.dart'; 

//point de départ de l'application
void main() {
  runApp(const LeafyApp());
}

//création de la class LeafyApp
class LeafyApp extends StatelessWidget {
  const LeafyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // annulation du bandeau debug
      debugShowCheckedModeBanner: false,
      title: 'Leafy Gardening',
      theme: LeafyTheme.lightTheme, // Utilisation du thème centralisé
      // on définit ici le point d'entrée de l'application par MainWrapper
      home: const MainWrapper(),
    );
  }
}