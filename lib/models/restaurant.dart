class Restaurant {
  final String name;
  final String tagline;
  final String description;
  final String heroImagePath;
  final List<String> atmosphereImagePaths;

  const Restaurant({
    required this.name,
    required this.tagline,
    required this.description,
    required this.heroImagePath,
    required this.atmosphereImagePaths,
  });
}
