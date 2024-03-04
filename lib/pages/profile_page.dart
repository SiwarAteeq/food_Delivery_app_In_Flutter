import 'package:first_app/models/food_item.dart';
import 'package:first_app/pages/order_page.dart';
import 'package:first_app/wedgats/orders_coupons_widget.dart';
import 'package:first_app/wedgats/profile_list_tile.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  void refreshPage() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SafeArea(
      child: Center(
        child: Column(
          children: [
            const SizedBox(height: 32),
            CircleAvatar(
                radius: size.height * .16,
                backgroundColor: Color.fromARGB(166, 230, 229, 229),
                backgroundImage: NetworkImage(
                    "https://static.vecteezy.com/system/resources/thumbnails/020/911/732/small/profile-icon-avatar-icon-user-icon-person-icon-free-png.png")),
            const SizedBox(
              height: 16,
            ),
            const Text(
              "Siwar Ateeq",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 6,
            ),
            const Text(
              "Software Enginering",
              style: TextStyle(
                color: Colors.black45,
                fontWeight: FontWeight.w600,
                fontSize: 19,
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                OrdersCouponsWidget(title: 'Orders ', value: ordersFood.length),
                const SizedBox(
                  height: 50,
                  child: VerticalDivider(
                      //  color: Colors.grey[100],
                      ),
                ),
                const OrdersCouponsWidget(title: 'Coupons ', value: 5),
              ],
            ),
            const SizedBox(
              height: 14,
            ),
            const Divider(
              indent: 20,
              endIndent: 20,
            ),
            InkWell(
                onTap: () {
                  Navigator.of(context)
                      .push(
                        MaterialPageRoute(
                            builder: (context) => const OrdersPage()),
                      )
                      .then((value) => refreshPage());
                },
                child: const ProfileListTile(
                    icon: Icons.shopping_cart_outlined, title: "Orders")),
            const Divider(
              indent: 20,
              endIndent: 20,
            ),
            const ProfileListTile(icon: Icons.card_giftcard, title: "Coupons"),
            const Divider(
              indent: 20,
              endIndent: 20,
            ),
            const SizedBox()
          ],
        ),
      ),
    );
  }
}
