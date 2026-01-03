import 'package:flutter/material.dart';
import '../../theme.dart';

class CareScreen extends StatelessWidget {
  const CareScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7F6),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30),

              _buildSearchBar(),
              const SizedBox(height: 20),

              _buildWeatherHeader(),
              const SizedBox(height: 25),

              // ✅ SECTION PLANT HEALTH (comme Incomplete varieties)
              _buildDiseaseSection(),

              const SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }

  // 🔍 Barre de recherche
  Widget _buildSearchBar() {
    return TextField(
      decoration: InputDecoration(
        hintText: "Search ...",
        prefixIcon: const Icon(Icons.search),
        suffixIcon: const Icon(Icons.tune),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  // ☁️ Météo
  Widget _buildWeatherHeader() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "24°C",
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 4),
              Text("Cloudy sky", style: TextStyle(color: Colors.grey)),
            ],
          ),
          Icon(Icons.cloud, size: 50, color: Colors.blueAccent),
        ],
      ),
    );
  }

  // 🦠 SECTION Disease (IDENTIQUE à Incomplete varieties)
  Widget _buildDiseaseSection() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Plant Health",
              style: LeafyTheme.lightTheme.textTheme.titleMedium,
            ),
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
            _buildDiseaseGridCard("Angular", "Today 4:00 PM", "disease1.jpg"),
            _buildDiseaseGridCard("Ascochyta Blight", "Today 4:00 PM", "disease2.jpg"),
            _buildDiseaseGridCard("Leaf Spot", "Yesterday", "disease3.jpg"),
            _buildDiseaseGridCard("Mosaic Virus", "2 days ago", "disease4.jpg"),
            _buildDiseaseGridCard("Mosaic Virus", "2 days ago", "disease5.jpg")
          ],
        ),
      ],
    );
  }

  // 🧱 CARTE Disease (copie conforme à PlantGridCard)
  Widget _buildDiseaseGridCard(String title, String time, String imageUrl) {
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
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(25),
              ),
              child: Image.asset(
                imageUrl,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    const Icon(Icons.timelapse, size: 14, color: Colors.grey),
                    const SizedBox(width: 4),
                    Text(
                      time,
                      style: const TextStyle(fontSize: 10, color: Colors.grey),
                    ),
                    const Spacer(),
                    const Icon(
                      Icons.arrow_outward,
                      size: 14,
                      color: Colors.grey,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
