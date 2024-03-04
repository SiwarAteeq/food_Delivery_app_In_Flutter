import 'package:flutter/material.dart';
class ProductDetailsProperty extends StatelessWidget {
  final String title,value;
  const ProductDetailsProperty({super.key,required this.title,required this.value});

  @override
  Widget build(BuildContext context) {
    return   Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:[
                      Text(title,style: 
                      const TextStyle(
                        color: Colors.black45,
                        fontWeight: FontWeight.w500,
                        fontSize: 18,

                      ),),
                     const SizedBox(height: 6,),
                      Text(value,
                      style:const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 19,
                      ),)
                      ],
                    );
  }
}