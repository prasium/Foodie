import 'package:flutter/material.dart';
import './dummy_data.dart';
import './models/meal.dart';
import './screens/filters_screen.dart';
import './screens/meal_detail.dart';
import './screens/tabs_screen.dart';
import 'screens/category_meals_screen.dart';

//call MyApp()
void main()=> runApp(MyApp());

// Stateless Widget Home Page rn
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  Map<String, bool> _filters = {
    'gluten':false,
    'lactose':false,
    'vegan':false,
    'vegetarian':false,
  };

  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favoriteMeals = [];

  void _setFilters(Map<String, bool> filterData)
  {
      setState(() {
        _filters = filterData;

        _availableMeals = DUMMY_MEALS.where((meal) {
          if(_filters['gluten'] && !meal.isGlutenFree)
            {
              return false;
            } // not include
          if(_filters['lactose'] && !meal.isLactoseFree)
          {
            return false;
          } // not include
          if(_filters['vegetarian'] && !meal.isVegetarian)
          {
            return false;
          } // not include
          if(_filters['vegan'] && !meal.isVegan)
          {
            return false;
          } // not include
          return true;
        }).toList();
      });
  }

  void _toggleFavorite(String mealId)
  {
   final existingIndex =
   _favoriteMeals.indexWhere((element) => element.id==mealId);
    // exists, so remove
       if(existingIndex>=0)
         {
           setState(() {
             _favoriteMeals.removeAt(existingIndex);
           });
         }
         else{
           setState(() {
             _favoriteMeals.add(DUMMY_MEALS.firstWhere(
                     (element) => element.id==mealId),
             );
           });

       }
  }

  bool _isMealFavorite(String id){
    return _favoriteMeals.any((element) => element.id==id);
  }
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Foodie',
       debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(250, 235, 239, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
          body1: TextStyle(
            color: Color.fromRGBO(20, 51, 51, 1),
          ),
          body2: TextStyle(
            color: Color.fromRGBO(20, 51, 51, 1),
          ),
          title: TextStyle(
            fontSize: 20,
            fontFamily: 'RobotoCondensed',
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      //home: CategoriesScreen(), //entry point (root screen) of app
      initialRoute: '/', //default is '/'
      routes: {
        '/': (ctx) => TabsScreen(_favoriteMeals), //default home route
        CategoryMealsScreen.routeName: (ctx) => CategoryMealsScreen(_availableMeals),
        MealDetail.routeName: (ctx) => MealDetail(_toggleFavorite, _isMealFavorite),
        FiltersScreen.routeName: (ctx)=> FiltersScreen(_filters, _setFilters),
      }, //List of Routes Map to screens
    // If any unregistered route is generated dynamically,it can be handled by onGenerateRoute
    // onGenerateRoute: (settings){
    //     print(settings.arguments);
    //     return MaterialPageRoute(builder: (ctx) => CategoriesScreen(),);
    // },
      // If a route does not exist we can use this to display 404
      // onUnknownRoute: (settings) {
      //   return MaterialPageRoute(builder: (ctx)=> CategoriesScreen());
      //},
    );
  }
}

