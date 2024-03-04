
import 'package:first_app/models/food_item.dart';
import 'package:flutter/material.dart';
class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {

    @override
  Widget build(BuildContext context) {
   
    return favoriteFood.isEmpty? const Center(child: Text("Ther is no favorite Item ..!!",style: 
    TextStyle(
      fontWeight: FontWeight.bold,
      color: Colors.deepOrange,
      fontSize:28,
      fontStyle: FontStyle.italic,
      // backgroundColor: Color.fromARGB(255, 255, 60, 0)
      
    ),))
         :ListView.builder(
        itemCount: favoriteFood.length,
         itemBuilder: (BuildContext context, int index) =>
          Padding(
           padding: const EdgeInsets.all(3.0),
           child: Card(
            color: Colors.white,
            
           
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical:10),
              child: ListTile(
             
                leading:Image.network(favoriteFood[index].imgUrl,height: 90,width: 100,
                fit:BoxFit.fill),
                title: Text(favoriteFood[index].name,style: 
                const TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
              
                ),),
                subtitle: Text("${favoriteFood[index].category} - \$ ${favoriteFood[index].price}",style: 
                const TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold
                ), ),
                trailing: IconButton(onPressed: (){
                   
                  setState(() {
                    
                     final indexFilter=food.indexOf(favoriteFood[index]);
                    food[indexFilter].isFavorit=!favoriteFood[index].isFavorit;
                    favoriteFood[index].isFavorit=food[indexFilter].isFavorit;
                    // favoriteFood=food.where((FoodItem) => FoodItem.isFavorit==true).toList();
                   
                  });
                },
                   icon: Icon(favoriteFood[index].isFavorit==true?Icons.favorite:Icons.favorite_border,color:Colors.deepOrange ),),
              ),
                          ),
            ),
         ),

    



    );  }
}