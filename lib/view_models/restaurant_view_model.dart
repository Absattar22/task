import '../data/dummy_data.dart';
import '../models/dish.dart';
import '../models/restaurant.dart';

class RestaurantViewModel {
  Restaurant get restaurant => DummyData.restaurant;
  List<Dish> get dishes => DummyData.dishes;
}
