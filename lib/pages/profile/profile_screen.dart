import 'package:flutter/material.dart';
import '../../theme.dart';

class ExpertProfileScreen extends StatelessWidget {
  const ExpertProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F9F6),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const Icon(Icons.arrow_back, color: Colors.black),
        actions: const [
          Icon(Icons.more_vert, color: Colors.black),
          SizedBox(width: 10),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 10),

            // Photo profil
            const CircleAvatar(
              radius: 55,
              backgroundImage: AssetImage("profile.jpg"),
            ),

            const SizedBox(height: 12),

            Text(
              "Wolfgang Palme",
              style: LeafyTheme.lightTheme.textTheme.titleLarge,
            ),

            const SizedBox(height: 6),

            // ⭐ étoiles
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                5,
                (index) =>
                    const Icon(Icons.star, size: 16, color: Colors.amber),
              ),
            ),

            const SizedBox(height: 8),

            Text(
              "A farmer cultivates crops and raises livestock, providing essential food.",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey[700], fontSize: 13),
            ),

            const SizedBox(height: 20),

            // Stats
            _buildStatsRow(),

            const SizedBox(height: 25),

            // Carte expert
            _buildExpertCard(),

            const SizedBox(height: 25),

            // Section légumes
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: _buildVegetableSection(),
            ),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  // Stats
  Widget _buildStatsRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildStatItem("Follow", "632"),
        const SizedBox(width: 25),
        _buildStatItem("Followers", "632"),
      ],
    );
  }

  Widget _buildStatItem(String label, String value) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        Text(label, style: const TextStyle(color: Colors.grey, fontSize: 12)),
      ],
    );
  }

  // Carte expert secondaire
  Widget _buildExpertCard() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: ListTile(
          leading: const CircleAvatar(backgroundImage: AssetImage("domi.jpg")),
          title: const Text("Tasha Dominguez"),
          subtitle: const Text("Agriculture Specialist"),
          trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        ),
      ),
    );
  }

  // Section légumes
  Widget _buildVegetableSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Winter Vegetable",
              style: LeafyTheme.lightTheme.textTheme.titleMedium,
            ),
            Text("12 items", style: TextStyle(color: LeafyTheme.persianGreen)),
          ],
        ),
        const SizedBox(height: 15),

        SizedBox(
          height: 230, // hauteur obligatoire pour le scroll horizontal
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              _buildGridCard("Carrot", "carrotte.jpg"),
              const SizedBox(width: 30),
              _buildGridCard("Cabbage", "cabbage.jpg"),
              const SizedBox(width: 30),
              _buildGridCard("Spinach", "spinach.jpg"),
              const SizedBox(width: 30),
              _buildGridCard("Broccoli", "broccoli.jpg"),
              const SizedBox(width: 30),
              _buildGridCard("Radis", "radis.jpg"),
              const SizedBox(width: 30),
              _buildGridCard("Cabbage", "cabbage.jpg"),
              const SizedBox(width: 30),
              _buildGridCard("Spinach", "spinach.jpg"),
              const SizedBox(width: 30),
              _buildGridCard("Broccoli", "broccoli.jpg"),
              _buildGridCard("Carrot", "carrotte.jpg"),
              const SizedBox(width: 30),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildGridCard(String title, String imageUrl) {
    return Container(
      width: 160, // obligatoire en horizontal
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(25)),
            child: SizedBox(
              height: 140, // ✅ hauteur FIXE
              width: double.infinity,
              child: Image.asset(imageUrl, fit: BoxFit.cover),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Text(
              title,
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
