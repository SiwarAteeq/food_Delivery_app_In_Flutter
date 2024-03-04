class FoodItem{
  final String id;
  final String name;
  final String category;
  final String imgUrl;
  final double price;
  final int numberOfSales;
  final String estimatedTime;
  final String size;
  final String cooking;
  final String calories;
   int quantity;
   
  bool isFavorit;

  FoodItem(
    {
    required this.id,
     required this.name,
      required this.category,
       required this.imgUrl,
        required this.price,
        this.estimatedTime="30 Mins",
        this.numberOfSales=2,
        this.isFavorit=false,
        required this.size,
        required this.cooking, 
        required this.calories,
        this.quantity=1, 
       
        }); 
}
 List<FoodItem>food=[
      
      FoodItem(id: "1", name: "Beef Burgur", category: "Burger", imgUrl: "https://img.freepik.com/free-photo/tasty-burger-isolated-white-background-fresh-hamburger-fastfood-with-beef-cheese_90220-1063.jpg?w=740&t=st=1708026172~exp=1708026772~hmac=0835c94f53899df5211153f54e026f2eba180cc907baae8bb7410ef830df1178", price: 6.78, size: 'Mediam', cooking: '10-15 Min', calories: '250 Kcal'),
      FoodItem(id: "2", name: "Chicken Burgur", category: "Burger", imgUrl: "https://assets.stickpng.com/images/58824b33e81acb96424ffab9.png", price: 6.35,size: 'Mediam', cooking: '5-10 Min', calories: '150 Kcal'),
      FoodItem(id: "3", name: " Chees Burger", category: "Burger", imgUrl: "https://freepngimg.com/save/159187-burger-double-cheese-free-png-hq/700x487", price: 6.68,size: 'Large', cooking: '15-20 Min', calories: '250 Kcal'),
      FoodItem(id: "4", name: "Mashrom Burgur", category: "Burger", imgUrl: "https://static.vecteezy.com/system/resources/previews/025/229/012/original/tasty-mushroom-swiss-burger-on-transparent-background-png.png", price: 6.99,size: 'Small', cooking: '5-10 Min', calories: '150 Kcal'),
      FoodItem(id: "5", name: "Margireta Pizza ", category: "Pizza", imgUrl: "https://www.hearthandfirepizza.com/cdn/shop/products/product-beauty-the-margherita_1500x.png?v=1656423819", price: 7.60,size: 'Mediam', cooking: '15-20 Min', calories: '150 Kcal'),
      FoodItem(id: "6", name: "Chicken Pizza", category: "Pizza", imgUrl: "https://img.cdn4dd.com/p/fit=cover,width=1200,height=1200,format=auto,quality=90/media/photosV2/69e196c8-379b-49c5-bb2f-0e6855a78876-retina-large.png", price: 8.00,size: 'Mediam', cooking: '25-30 Min', calories: '350 Kcal'),
      FoodItem(id: "7", name: "Lazanya", category: "Pasta", imgUrl: "https://static.vecteezy.com/system/resources/previews/026/773/250/non_2x/lasagna-with-ai-generated-free-png.png", price: 5.60,size: 'Mediam', cooking: '25-30 Min', calories: '250 Kcal'),
      FoodItem(id: "8", name: "Fettuccine", category: "Pasta", imgUrl: "https://static.vecteezy.com/system/resources/previews/027/729/296/original/bowl-of-fettucini-alfredo-isolated-png.png", price: 5.80,size: 'Mediam', cooking: '20-25 Min', calories: '300 Kcal'),
      FoodItem(id: "9", name: "Fraid Chicken", category: "Chicken", imgUrl: "https://www.freepnglogos.com/uploads/fried-chicken-png/crispy-fried-chicken-png-0.png", price:4.66,size: 'Mediam', cooking: '15-20 Min', calories: '150 Kcal'),
      FoodItem(id: "10", name: "Grilled Chichen", category: "Chicken", imgUrl: "https://static.vecteezy.com/system/resources/previews/021/665/568/original/delicious-grilled-chicken-cutout-png.png", price: 9.99,size: 'Large', cooking: '15-30 Min', calories: '450 Kcal'),
    
    ];
     List<FoodItem>favoriteFood=[];
     List<FoodItem>ordersFood=[];
    