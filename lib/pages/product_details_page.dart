import 'package:first_app/models/food_item.dart';
import 'package:first_app/wedgats/product_details_property.dart';
import 'package:flutter/material.dart';

class ProductDetailsPage extends StatefulWidget {
  final FoodItem foodItem;
  final int index;
  const ProductDetailsPage(
      {super.key, required this.foodItem, required this.index});

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  int itemQuentite = 1;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        leading: IconButton(
            onPressed: () {
              setState(() {
                Navigator.of(context).pop(true);
              });
            },
            icon: const Icon(Icons.arrow_back_rounded)),
        title: Text(
          widget.foodItem.name,
          style: const TextStyle(
              fontWeight: FontWeight.w600, color: Colors.black54),
        ),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                food[widget.index].isFavorit = !widget.foodItem.isFavorit;
              });
            },
            icon: Icon(
              food[widget.index].isFavorit == true
                  ? Icons.favorite
                  : Icons.favorite_border,
              color: Colors.deepOrange,
            ),
          ),
          const SizedBox(width: 20)
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      color: Colors.grey[200],
                      child: Image.network(
                        widget.foodItem.imgUrl,
                        height: 350,
                        width: double.infinity,
                        fit: BoxFit.contain,
                      ),
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 22.0),
                      child: Column(
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    widget.foodItem.name,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 24,
                                    ),
                                  ),
                                  Text(
                                    widget.foodItem.category,
                                    style: const TextStyle(
                                      color: Colors.black45,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 17,
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                child: Row(
                                  children: [
                                    IconButton(
                                        onPressed: itemQuentite == 1
                                            ? null
                                            : () {
                                                setState(() {
                                                  itemQuentite--;
                                                });
                                              },
                                        icon: const Icon(
                                          Icons.remove,
                                          color: Colors.black45,
                                          size: 25,
                                        )),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    Text(
                                      itemQuentite.toString(),
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 22),
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    IconButton(
                                        onPressed: () {
                                          setState(() {
                                            itemQuentite++;
                                          });
                                        },
                                        icon: const Icon(
                                          Icons.add,
                                          color: Colors.black,
                                          size: 25,
                                        )),
                                  ],
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 32,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ProductDetailsProperty(
                                  title: 'Size', value: widget.foodItem.size),
                              const SizedBox(
                                  height: 45, child: VerticalDivider()),
                              ProductDetailsProperty(
                                  title: 'Calories',
                                  value: widget.foodItem.calories),
                              const SizedBox(
                                  height: 45, child: VerticalDivider()),
                              ProductDetailsProperty(
                                  title: 'Cooking',
                                  value: widget.foodItem.cooking),
                            ],
                          ),
                          const SizedBox(
                            height: 32,
                          ),
                          const Text(
                            'kgmheoshfbhoitijbjklhhhhhhhh jgfnbgfjbndlgsuvryugjhgfkd\tz;hjkgfdjghkfjhkjfjhkjhfgjkfdjkbjkfbjkbhjhjfhghjkghgjhkghjhkgjgefnlhbwhgbtrfljgbgwynhtgwjbtkfwnvgmkrjfhbofghnbxfghb  ihk jkgfdkj kdfbodn kdfbgbodbo kdhgoabg skgnblsn slaklsab klhsfkj .hvkh  kjksdgiudrg dhjggfd ligj jkfdguh  hjgdhjv hhg shdvuhi m vo h am efvjhdfvbjhbdddjjjjjjjjjjjj bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb rghiuagefrszuk \n enb hmvtrknbghytg',
                            style: TextStyle(
                              color: Colors.black45,
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: size.width > 800 ? size.height * .05 : 10,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 22.0, vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: size.width > 800 ? 3 : 1,
                    child: Text(
                      '\$ ${(widget.foodItem.price * itemQuentite).toStringAsFixed(2)}',
                      style: const TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepOrange,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: ElevatedButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (_) {
                            return AlertDialog(
                              title: const Icon(
                                Icons.shopping_cart_outlined,
                                color: Colors.deepOrange,
                              ),
                              content: const Text(
                                  'Do you whant to Add this item to the cart ??'),
                              actions: [
                                TextButton(
                                  onPressed: Navigator.of(context).pop,
                                  child: const Text('NO'),
                                ),
                                TextButton(
                                  onPressed: () {
                                    setState(() {
                                      if (!ordersFood
                                          .contains(widget.foodItem)) {
                                        widget.foodItem.quantity = itemQuentite;
                                        ordersFood.add(widget.foodItem);
                                      } else {
                                        ordersFood[ordersFood
                                                .indexOf(widget.foodItem)]
                                            .quantity += itemQuentite;
                                      }
                                    });
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text(
                                          'Your order is add',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16),
                                        ),
                                        backgroundColor: Colors.green,
                                        duration: Duration(seconds: 1),
                                      ),
                                    );
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text('YES'),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepOrange,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusDirectional.circular(8),
                        ),
                      ),
                      child: const Text(
                        'Checkout',
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
