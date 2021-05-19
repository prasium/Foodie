import 'package:flutter/material.dart';
import '../screens/meal_detail.dart';
import '../models/meal.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;

  MealItem({
    @required this.id,
    @required this.title,
    @required this.imageUrl,
    @required this.duration,
    @required this.complexity,
    @required this.affordability,
  });

  // Enum getter Complexity
  String get complexityText {
    switch (complexity) {
      case Complexity.Simple:
        return 'Simple';
        break;
      case Complexity.Challenging:
        return 'Challenging';
        break;
      case Complexity.Hard:
        return 'Hard';
        break;
      default:
        return 'Unknown';
    }
  }

  // Enum getter Affordability
  String get affordabilityText {
    switch (affordability) {
      case Affordability.Affordable:
        return 'Affordable';
        break;
      case Affordability.Expensive:
        return 'Expensive';
        break;
      case Affordability.Luxurious:
        return 'Luxurious';
        break;
      default:
        return 'Unknown';
    }
  }

  // on Tap trigger this function to display details of the meals
  void selectMeal(BuildContext context) {
    Navigator.of(context).pushNamed(
      MealDetail.routeName,
    arguments: id,
    ).then((result) {
      if(result!=null){
 //       removeItem(result);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 5,
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                // Use to force any other widget to make it corner rounded
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child:
                      // Image from network to fetch it
                      Image.network(imageUrl,
                          height: 250,
                          width: double.infinity,
                          fit: BoxFit.cover),
                ),
                Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black54,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    width: 300,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: 26,
                        color: Colors.white,
                      ),
                      softWrap: true, // wrap long texts
                      overflow: TextOverflow.fade, //fade larger texts
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Icon(Icons.schedule,),
                      SizedBox(width: 6,),
                      Text('${duration} min'),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.work,),
                      SizedBox(width: 6,),
                      Text('${complexityText}'),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.attach_money,),
                      SizedBox(width: 6,),
                      Text('${affordabilityText}'),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
