import 'package:first_app/models/food_item.dart';
import 'package:first_app/pages/favorites_page.dart';
import 'package:first_app/pages/home_page.dart';
import 'package:first_app/pages/profile_page.dart';
import 'package:flutter/material.dart';
class CustomBottomNavbar extends StatefulWidget {
  const CustomBottomNavbar({super.key});

  @override
  State<CustomBottomNavbar> createState() => CustomBottomNavbarState();
}

class CustomBottomNavbarState extends State<CustomBottomNavbar> {
  
  int selectedIndex=0;
  List<Widget>widgetBuld=const [
    HomePage(),
    FavoritesPage(),
    ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:widgetBuld[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(items: const[
        BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.favorite),label: 'Favorites'),
        BottomNavigationBarItem(icon: Icon(Icons.person),label: 'Profile'),
        
        ],
        currentIndex: selectedIndex,
        onTap: (index)=>{
          setState(() { 
            favoriteFood=food.where((FoodItem) => FoodItem.isFavorit==true).toList();
            selectedIndex=index;
                        }
          ),
        },
        ),
    );
  }
}