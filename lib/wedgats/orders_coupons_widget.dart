import 'package:flutter/material.dart';
class OrdersCouponsWidget extends StatelessWidget {
  final String title;
final int value;
  const OrdersCouponsWidget({super.key,required this.title,required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
                     
                      children:[
                      Text(title,style: 
                      const TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,

                      ),),
                     const SizedBox(height: 6,),
                      Text(value.toString(),
                      style:const TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 26,
                      ),)
                      ],
                    );
  }
  
}