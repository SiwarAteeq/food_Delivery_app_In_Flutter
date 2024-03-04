import 'package:first_app/models/category_item.dart';
import 'package:first_app/models/food_item.dart';
import 'package:first_app/pages/product_details_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int? selectedCategoryIndex;

  late List<FoodItem> filteredFood;
  late Icon favoriteIcon = const Icon(
    Icons.favorite,
    color: Colors.deepOrange,
  );

  @override
  void initState() {
    super.initState();

    filteredFood = food;

    // favoriteFood=food;
  }

  void refreshPage() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(4),
                      child: InkWell(
                        onTap: () {},
                        child: const DecoratedBox(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            color: Colors.white,
                          ),
                          child: Icon(
                            Icons.menu,
                            size: 30,
                          ),
                        ),
                      ),
                    ),
                    const Column(
                      children: [
                        Text(
                          "Current location",
                          style: TextStyle(color: Colors.black45),
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.location_on,
                              color: Colors.green,
                              size: 20,
                            ),
                            SizedBox(
                              width: 6,
                            ),
                            Text(
                              "Jenin, Palestine ",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            )
                          ],
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4),
                      child: InkWell(
                        onTap: () {},
                        child: const DecoratedBox(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                          ),
                          child: Icon(
                            Icons.notifications_active_outlined,
                            size: 30,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 25),
                ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    child: Image.network(
                      "https://www.shutterstock.com/image-vector/beef-burger-tomato-onion-lettuce-600nw-2105590823.jpg",
                      height: size.width > 800
                          ? size.height * .53
                          : size.height * .23,
                      fit: BoxFit.fill,
                      width: double.infinity,
                    )),
                const SizedBox(
                  height: 32,
                ),
                const TextField(
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      borderSide: BorderSide.none,
                    ),
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.grey,
                      size: 30,
                    ),
                    hintText: "Find your food ...",
                    hintStyle: TextStyle(color: Colors.grey),
                  ),
                ),
                const SizedBox(
                  height: 32,
                ),
                SizedBox(
                  height: size.height * .155,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: categories.length,
                    itemBuilder: (context, index) => Padding(
                      padding:
                          EdgeInsetsDirectional.only(end: size.width * .0563),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            if (index == selectedCategoryIndex) {
                              selectedCategoryIndex = null;
                            } else {
                              selectedCategoryIndex = index;
                            }
                          });
                          if (selectedCategoryIndex == null) {
                            filteredFood = food;
                          } else {
                            filteredFood = food
                                .where((FoodItem) =>
                                    FoodItem.category ==
                                    categories[selectedCategoryIndex!].name)
                                .toList();
                          }
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: index == selectedCategoryIndex
                                ? const Color.fromARGB(255, 255, 76, 22)
                                : Colors.white,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(children: [
                              Image.asset(
                                categories[index].assetPath,
                                height: 50,
                                width: 50,
                                color: index == selectedCategoryIndex
                                    ? Colors.white
                                    : null,
                              ),
                              const SizedBox(height: 8),
                              Text(
                                categories[index].name,
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: index == selectedCategoryIndex
                                      ? Colors.white
                                      : Colors.black54,
                                ),
                              ),
                            ]),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 32,
                ),
                GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: size.width > 800 ? 4 : 2,
                    mainAxisSpacing: 30,
                    crossAxisSpacing: 20,
                  ),
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: filteredFood.length,
                  itemBuilder: (context, index) =>
                      LayoutBuilder(builder: (context, Constraints) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProductDetailsPage(
                                  foodItem: filteredFood[index],
                                  index: food.indexOf(filteredFood[index])),
                            )).then((res) => refreshPage());
                      },
                      child: Container(
                        height: Constraints.maxHeight * .5,
                        // color:Colors.white,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: Colors.white),
                        child: Padding(
                          padding: EdgeInsets.only(
                              top: size.width > 800
                                  ? Constraints.maxHeight * .1
                                  : Constraints.maxHeight * .01),
                          child: Stack(
                            alignment: AlignmentDirectional.center,
                            children: [
                              Column(
                                children: [
                                  Image.network(
                                    filteredFood[index].imgUrl,
                                    fit: BoxFit.fill,
                                    height: Constraints.maxHeight * .5,
                                    width: size.width * .14,
                                  ),
                                  Text(
                                    filteredFood[index].name,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: Constraints.maxHeight * .09,
                                    ),
                                  ),
                                  Text(filteredFood[index].category,
                                      style: TextStyle(
                                        color: Colors.black45,
                                        fontWeight: FontWeight.bold,
                                        fontSize: Constraints.maxHeight * .07,
                                      )),
                                  Text(
                                    "\$ ${filteredFood[index].price}",
                                    style: TextStyle(
                                      color: Colors.deepOrangeAccent,
                                      fontWeight: FontWeight.bold,
                                      fontSize: Constraints.maxHeight * .09,
                                    ),
                                  ),
                                ],
                              ),
                              Positioned(
                                  top: 0,
                                  right: 0,
                                  child: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        final indexFilter =
                                            food.indexOf(filteredFood[index]);
                                        food[indexFilter].isFavorit =
                                            !filteredFood[index].isFavorit;
                                        //  filteredFood[index].isFavorit=food[indexFilter].isFavorit;
                                        // favoriteFood=food.where((FoodItem) => FoodItem.isFavorit==true).toList();
                                        // print(favoriteFood);
                                      });
                                    },
                                    icon: Icon(
                                        filteredFood[index].isFavorit == true
                                            ? Icons.favorite
                                            : Icons.favorite_border,
                                        color: Colors.deepOrange),
                                  )),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
                )
              ]),
            ),
          ),
        ),
      ),
    );
  }
  // @override
  // void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  //   super.debugFillProperties(properties);
  //   properties.add(IterableProperty<FoodItem>('filuterFood', filuterFood));
  // }
}
