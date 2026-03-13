class Dish {
  final String id;
  final String name;
  final String category;
  final String description;
  final double price;
  final String imagePath;
  final bool isTrending;
  final String prepTime;
  final String servingSize;

  const Dish({
    required this.id,
    required this.name,
    required this.category,
    required this.description,
    required this.price,
    required this.imagePath,
    this.isTrending = false,
    this.prepTime = '20 Minutes',
    this.servingSize = 'Serving Size: 1',
  });
}
