import 'package:flutter/material.dart';
import '../screens/category_meals_screen.dart';

class CategoryItem extends StatelessWidget {

  final String id;
  final String title;
  final Color color;

  CategoryItem(this.id, this.title, this.color);

  //Navigate to Particular Category Screen
  void navigateCategory(BuildContext ctx)
  {
    // Add a page to the current page using Navigator
    // Navigator.of(ctx).push(
    //   MaterialPageRoute(
    //     builder: (_) {
    //       return CategoryMealsScreen(id, title);
    //     },),
    // );

    // pushNamed method of routing
    Navigator.of(ctx).pushNamed(CategoryMealsScreen.routeName, arguments: {
      'id':id,
      'title':title,
    },
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=> navigateCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),//so the ripple effect match the border radius of the card
      child: Container(
        padding: const EdgeInsets.all(20), // padding all sides 20px
        child: Text(
          title,
          style: Theme.of(context).textTheme.title,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              color.withOpacity(0.7),
              color,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
