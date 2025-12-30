
// class pour les plantes du bouton home
class Plant {
  final String id;
  final String name;         
  final String imagePath;      
  final bool isIncomplete;      
  final String varietyName;     

  Plant({
    required this.id,
    required this.name,
    required this.imagePath,
    this.isIncomplete = false,
    required this.varietyName,
  });
}

// class pour les maladies du bouton care
class PlantDisease {
  final String name;         
  final String description;  
  final String imagePath;    
  final DateTime detectedAt; 

  PlantDisease({
    required this.name,
    required this.description,
    required this.imagePath,
    required this.detectedAt,
  });
}

//class pour le bouton profile

class AppUser {
  final String name;          
  final String role;          
  final String bio;           
  final int followers;        
  final double rating;        
  final String profileImg;

  AppUser({
    required this.name,
    required this.role,
    required this.bio,
    required this.followers,
    required this.rating,
    required this.profileImg,
  });
}