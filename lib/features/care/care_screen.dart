import 'package:flutter/material.dart';
import '../../theme.dart';

class CareScreen extends StatelessWidget {
  const CareScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(height: 20),
              _buildWeatherHeader(), // Section météo
              const SizedBox(height: 30),
              Text("Plant Health", style: LeafyTheme.lightTheme.textTheme.titleMedium),
              const SizedBox(height: 15),
              _buildDiseaseCard(
                "Angular", 
                "Today 4:00 PM", 
                "https://via.placeholder.com/150",
                Colors.orange.shade100
              ),
              const SizedBox(height: 15),
              _buildDiseaseCard(
                "Ascochyta Blight", 
                "Today 4:00 PM", 
                "https://via.placeholder.com/150",
                Colors.blue.shade100
              ),
              const SizedBox(height: 100), // Espace pour la barre de navigation
            ],
          ),
        ),
      ),
    );
  }

  // Widget Météo
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
              Text("24°C", style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold)), //
              Text("Cloudy sky", style: TextStyle(color: Colors.grey)),
            ],
          ),
          Icon(Icons.cloud, size: 50, color: Colors.blue.shade200),
        ],
      ),
    );
  }

  // Widget Carte de Maladie
  Widget _buildDiseaseCard(String title, String time, String imageUrl, Color bgColor) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.network(imageUrl, width: 80, height: 80, fit: BoxFit.cover),
          ),
          const SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              Text(time, style: const TextStyle(color: Colors.grey, fontSize: 12)),
            ],
          ),
          const Spacer(),
          const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
        ],
      ),
    );
  }
}