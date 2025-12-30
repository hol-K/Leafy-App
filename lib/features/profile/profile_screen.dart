import 'package:flutter/material.dart';
import '../../theme.dart';

class ExpertProfileScreen extends StatelessWidget {
  const ExpertProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const Icon(Icons.arrow_back, color: Colors.black),
        actions: const [Icon(Icons.more_vert, color: Colors.black), SizedBox(width: 10)],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // 1. Photo et Nom
            const CircleAvatar(
              radius: 60,
              backgroundImage: NetworkImage('AppImages.expertWolfgang'), // Photo de Wolfgang Palme
            ),
            const SizedBox(height: 15),
            Text("Wolfgang Palme", style: LeafyTheme.lightTheme.textTheme.displayLarge),
            Text("Agriculture Specialist", style: TextStyle(color: Colors.grey[600], fontSize: 16)),
            
            const SizedBox(height: 20),
            
            // 2. Statistiques (Followers & Rating)
            _buildStatsRow(),
            
            const SizedBox(height: 25),
            
            // 3. Biographie
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Biography", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                  const SizedBox(height: 10),
                  Text(
                    "Wolfgang Palme is a renowned researcher and expert in winter vegetable cultivation. He heads the vegetable gardening department at the Zinsenhof research station.",
                    style: TextStyle(color: Colors.grey[700], height: 1.5),
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 30),
            
            // 4. Bouton de contact
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: LeafyTheme.persianGreen,
                  minimumSize: const Size(double.infinity, 55),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                ),
                child: const Text("Follow Expert", style: TextStyle(color: Colors.white, fontSize: 16)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget pour la ligne des statistiques
  Widget _buildStatsRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildStatItem("Followers", "1.2k"),
        Container(height: 30, width: 1, color: Colors.grey[300]), // Séparateur
        _buildStatItem("Rating", "5.0 ★"),
        Container(height: 30, width: 1, color: Colors.grey[300]), // Séparateur
        _buildStatItem("Plants", "48"),
      ],
    );
  }

  Widget _buildStatItem(String label, String value) {
    return Column(
      children: [
        Text(value, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: LeafyTheme.persianGreen)),
        Text(label, style: const TextStyle(color: Colors.grey, fontSize: 12)),
      ],
    );
  }
}