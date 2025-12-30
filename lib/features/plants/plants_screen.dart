import 'package:flutter/material.dart';
import '../../theme.dart';

class PlantsScreen extends StatelessWidget {
  const PlantsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              _buildHeader(), // Titre "Discover Your Plant"
              const SizedBox(height: 20),
              _buildSearchBar(), // Barre de recherche spécifique
              const SizedBox(height: 30),
              _buildYourPlantsSection(), // Liste horizontale (Basil, Carrots...)
              const SizedBox(height: 30),
              _buildIncompleteVarietiesSection(), // Grille des variétés
              const SizedBox(height: 100), // Espace pour ne pas cacher le contenu par la barre flottante
            ],
          ),
        ),
      ),
    );
  }

  // 1. HEADER
  Widget _buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Discover Your Plant", style: LeafyTheme.lightTheme.textTheme.displayLarge),
        Text("Create a green town", style: TextStyle(color: LeafyTheme.davyGrey)),
      ],
    );
  }

  // 2. SEARCH BAR
  Widget _buildSearchBar() {
    return TextField(
      decoration: InputDecoration(
        hintText: "Find your plants",
        prefixIcon: const Icon(Icons.search),
      ),
    );
  }

  // 3. SECTION "YOUR PLANTS" (Horizontal)
  Widget _buildYourPlantsSection() {
    final List<Map<String, String>> myPlants = [
      {"name": "Basil", "icon": "🌿"},
      {"name": "Carrots", "icon": "🥕"},
      {"name": "Zucchini", "icon": "🥒"},
      {"name": "Gherkin", "icon": "🥒"},
    ];

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Your Plants", style: LeafyTheme.lightTheme.textTheme.titleMedium),
            TextButton(onPressed: () {}, child: const Text("Edit", style: TextStyle(color: Colors.grey))),
          ],
        ),
        SizedBox(
          height: 100,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: myPlants.length,
            itemBuilder: (context, index) {
              return Container(
                width: 80,
                margin: const EdgeInsets.only(right: 15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(myPlants[index]["icon"]!, style: const TextStyle(fontSize: 30)),
                    const SizedBox(height: 8),
                    Text(myPlants[index]["name"]!, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  // 4. GRILLE "INCOMPLETE VARIETIES"
  Widget _buildIncompleteVarietiesSection() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Incomplete varieties", style: LeafyTheme.lightTheme.textTheme.titleMedium),
            Text("See All", style: TextStyle(color: LeafyTheme.persianGreen)),
          ],
        ),
        const SizedBox(height: 15),
        GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          childAspectRatio: 0.8,
          crossAxisSpacing: 15,
          mainAxisSpacing: 15,
          children: [
            _buildPlantGridCard("Ungarischer Knoblauch", "https://via.placeholder.com/150"),
            _buildPlantGridCard("Gaindorfer Winter", "https://via.placeholder.com/150"),
          ],
        ),
      ],
    );
  }

  Widget _buildPlantGridCard(String name, String imageUrl) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(25)),
              child: Image.network(imageUrl, fit: BoxFit.cover, width: double.infinity),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(Icons.timelapse, size: 14, color: Colors.grey),
                    const SizedBox(width: 4),
                    Text("Incomplete", style: TextStyle(fontSize: 10, color: Colors.grey)),
                    const Spacer(),
                    const Icon(Icons.arrow_outward, size: 14, color: Colors.grey),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}