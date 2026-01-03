import 'package:flutter/material.dart';
import '../widgets/custom_nav_bar.dart';
import 'package:leafy_app/pages/home/home_screen.dart';
import 'package:leafy_app/pages/plants/plants_screen.dart';
import 'package:leafy_app/pages/care/care_screen.dart';
import 'package:leafy_app/pages/profile/profile_screen.dart';

class MainWrapper extends StatefulWidget {
  const MainWrapper({super.key});

  @override
  State<MainWrapper> createState() => _MainWrapperState();
}

class _MainWrapperState extends State<MainWrapper> {
  // 1. Variable pour suivre l'onglet actif
  int _currentIndex = 0;

  // 2. Liste des écrans correspondant aux icônes de la barre
  // Pour l'instant, on utilise des Placeholder pour ne pas avoir d'erreurs
  final List<Widget> _pages = [
    const HomeScreen(),
    const PlantsScreen(),
    const CareScreen(),
    const ExpertProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 3. IMPORTANT : Permet au contenu de défiler derrière la barre flottante
      extendBody: true,

      // 4. Affiche la page correspondant à l'index actuel
      body: _pages[_currentIndex],

      // 5. Place ta barre personnalisée en bas
      bottomNavigationBar: CustomFloatingNavBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          // Met à jour l'interface quand on clique sur une icône
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
