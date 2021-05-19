import 'package:flutter/cupertino.dart';
import '../models/meal.dart';
import '../widgets/meal_item.dart';

class FavoritesScreen extends StatelessWidget {

  final List<Meal> favorites;

  FavoritesScreen(this.favorites);

  @override
  Widget build(BuildContext context) {
    if(favorites.isEmpty){
      return Center(
        child: Text('No favourites added...'),
      );
    }
    else{
     return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: favorites[index].id,
            title: favorites[index].title,
            imageUrl: favorites[index].imageUrl,
            duration: favorites[index].duration,
            complexity: favorites[index].complexity,
            affordability: favorites[index].affordability,
          );
        },
        itemCount: favorites.length,
      );
    }

  }
}
