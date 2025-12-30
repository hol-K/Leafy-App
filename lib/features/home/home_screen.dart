import 'package:flutter/material.dart';
import '../../theme.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          children: [
            const SizedBox(height: 20),
            _buildHeader(), // Partie utilisateur
            const SizedBox(height: 20),
            _buildSearchBar(), // Barre de recherche
            const SizedBox(height: 25),
            _buildMainBanner(), // Bannière "Create beautiful plans"
            const SizedBox(height: 30),
            _buildFaceOfLeafySection(), // Section Vidéos
          ],
        ),
      ),
    );
  }

  // 1. LE HEADER (Photo + Nom)
  Widget _buildHeader() {
    return Row(
      children: [
        const CircleAvatar(
          radius: 25,
          backgroundImage: NetworkImage('AppImages.userAnthony'), // Image de Antony Thomas
        ),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Good Morning!", style: TextStyle(color: LeafyTheme.davyGrey, fontSize: 14)),
            Text("Antony Thomas", style: LeafyTheme.lightTheme.textTheme.titleMedium), //
          ],
        ),
        const Spacer(),
        const Icon(Icons.notifications_none_outlined, size: 28), // Icône cloche
      ],
    );
  }

  // 2. LA BARRE DE RECHERCHE
  Widget _buildSearchBar() {
    return TextField(
      decoration: InputDecoration(
        hintText: "Search ...", //
        prefixIcon: const Icon(Icons.search),
        suffixIcon: const Icon(Icons.tune), // Icône de filtre à droite
      ),
    );
  }

  // 3. LA BANNIÈRE PRINCIPALE
  Widget _buildMainBanner() {
    return Container(
      height: 180,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        image: const DecorationImage(
          image: NetworkImage('AppImages.buildBanner'), // Image de jardinage
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Create\nbeautiful\nPlanting Plans", //
                  style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  ),
                  child: const Text("Create a free planting plan", style: TextStyle(fontSize: 12)), //
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // 4. SECTION VIDÉOS (Face of Leafy)
  Widget _buildFaceOfLeafySection() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Face of Leafy", style: LeafyTheme.lightTheme.textTheme.titleMedium), //
            const Icon(Icons.more_horiz),
          ],
        ),
        const SizedBox(height: 15),
        SizedBox(
          height: 250,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              _buildVideoCard(),
              _buildVideoCard(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildVideoCard() {
    return Container(
      width: 180,
      margin: const EdgeInsets.only(right: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30), // Formes organiques
        image: const DecorationImage(
          image: NetworkImage('AppImages.buildVideo'), // Image de la vidéo
          fit: BoxFit.cover,
        ),
      ),
      alignment: Alignment.bottomCenter,
      padding: const EdgeInsets.all(15),
      child: const Row(
        children: [
          Icon(Icons.play_circle_fill, color: Colors.white, size: 30),
          SizedBox(width: 8),
          Text("Welcome to Leafy\n02 Videos", style: TextStyle(color: Colors.white, fontSize: 10)), //
        ],
      ),
    );
  }
}