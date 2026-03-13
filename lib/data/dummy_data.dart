import '../models/dish.dart';
import '../models/restaurant.dart';

abstract final class DummyData {
  static const Restaurant restaurant = Restaurant(
    name: 'CEANO',
    tagline: 'Lorem',
    description:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
        'Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.\n'
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
        'Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
    heroImagePath: 'assets/images/main.png',
    atmosphereImagePaths: [
      'assets/images/atmo_1.png',
      'assets/images/atmo_2.png',
    ],
  );

  static const List<Dish> dishes = [
    Dish(
      id: '1',
      name: 'Tenderloin Steak with Grilled Vegetables',
      category: 'Main Course',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
          'Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.\n'
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
          'Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
      price: 24.95,
      imagePath: 'assets/images/steak.png',
      isTrending: true,
      prepTime: '20 Minutes',
      servingSize: 'Serving Size: 1',
    ),
    Dish(
      id: '2',
      name: '25 Piece Sushi Boat with Three Sides',
      category: 'Main Course',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
          'Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.\n'
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
          'Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
      price: 49.95,
      imagePath: 'assets/images/sushi_1.png',
      prepTime: '30 Minutes',
      servingSize: 'Serving Size: 1',
    ),
    Dish(
      id: '3',
      name: 'Shared Meal and Drinks',
      category: 'Main Course',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
          'Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.\n'
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. ',
      price: 34.50,
      imagePath: 'assets/images/meal.png',
      prepTime: '25 Minutes',
      servingSize: 'Serving Size: 1',
    ),
    Dish(
      id: '4',
      name: 'Salmon Rose Sushi Bowl',
      category: 'Main Course',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
          'Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.\n'
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. ',
      price: 18.75,
      imagePath: 'assets/images/sushi_2.png',
      prepTime: '20 Minutes',
      servingSize: 'Serving Size: 1',
    ),
  ];
}
