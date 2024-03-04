import 'package:first_app/models/food_item.dart';
import 'package:flutter/material.dart';
class OrdersPage extends StatefulWidget {
  const OrdersPage({super.key});

  @override
  State<OrdersPage> createState() => _OrdersPageState();
}



double calucaliteTotalsPrice(){
  double totalPrice=0;
    for(int i=0;i<ordersFood.length;i++) {
      totalPrice+=(ordersFood[i].quantity*ordersFood[i].price) ;
    }
     return totalPrice;
}
  double totPr=0;
class _OrdersPageState extends State<OrdersPage> {
 
@override
  Widget build(BuildContext context) {
    return  
               Scaffold(
                appBar: AppBar(
                  title: const Text("Orders Details"),
                 
                ),
                bottomNavigationBar: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 2,
                        child: Text(
                          "total price=\$ ${(calucaliteTotalsPrice()).toStringAsFixed(2)}",
                        style:const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black54,
                          fontSize: 18,
                          // backgroundColor: Colors.deepOrange,
                        ) ,),
                      ),
                      
                     Expanded(
                      flex: 2,
                       child: ElevatedButton(onPressed: (){},
                       style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepOrange,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)
                        ),
                        
                       ), child: const Text('Pay these Orders',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),),
                     ),
                    ],
                  ),
                ) ,
                body:ordersFood.isEmpty?const Column(mainAxisAlignment: MainAxisAlignment.center,
                  children: [Center(child: Text("There is no ordered yet !!",style: TextStyle(color: Colors.black45,fontWeight: FontWeight.bold,fontSize: 22),))],) 
             
                   : ListView.builder(
                    
                    itemCount: ordersFood.length,
                    itemBuilder: (BuildContext context,int index) =>Container(
                      color: Colors.white,
                      child: Padding(
                       
                        padding: const EdgeInsets.all(4.0),
                        child: Card(
                          color: Colors.white,
                          child: 
                          Stack(
                            children: [
                                  Padding(
                                padding: const EdgeInsets.symmetric(horizontal:5.0,vertical: 8),
                                child: SizedBox(
                                  height: 100,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                     Image.network(ordersFood[index].imgUrl,height: 100,width: 80,),
                                     const SizedBox(width: 13,),
                                    Column(
                                      // crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(ordersFood[index].name,style: 
                                        const TextStyle(fontSize: 18,fontWeight: FontWeight.w800),),
                                         const SizedBox(height: 6,),
                                        Text(ordersFood[index].category,style: const TextStyle(fontSize: 16,color: Colors.black54),),
                                         const SizedBox(height: 8,),
                                      Text(('\$${(ordersFood[index].price*ordersFood[index].quantity).toStringAsFixed(2)}'),style: 
                                      const TextStyle(
                                        color: Colors.deepOrange,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),),
                                      ],
                                    ),
                                  
                                     DecoratedBox(
                                        decoration:BoxDecoration(
                                       
                                          
                                          borderRadius: BorderRadius.circular(25)
                                          
                                        ),
                                     
                                        
                                        child: Row(
                                        
                                          children: [
                                            IconButton(onPressed:ordersFood[index].quantity==1?null: (){
                                              setState(() {
                                                ordersFood[index].quantity--;
                                                totPr=calucaliteTotalsPrice();
                                              });
                                            }, icon: const Icon(Icons.remove,color: Colors.black,)),
                                            Text(ordersFood[index].quantity.toString(),style:
                                             const TextStyle(fontWeight: FontWeight.w900,color: Colors.black),),
                                             IconButton(onPressed:(){
                                              setState(() {
                                              ordersFood[index].quantity++;
                                                totPr=calucaliteTotalsPrice();
                                              });
                                            }, icon: const Icon(Icons.add,color: Colors.black,)),
                                          ],
                                          ),
                                      ),
                                     
                                    ], ),
                               
                                ),
                              ),
                                Positioned(
                                      top: 0,
                                      right: 0,
                                      // left:0,
                                      child: IconButton(onPressed: () {
                                        setState(() {
                                          // totalPrice-=ordersFood[index].quantity*ordersFood[index].price;
                                          ordersFood[index].quantity=1;
                                          ordersFood.removeAt(index);
                                           totPr=calucaliteTotalsPrice();
                                        });
                                       },icon:const Icon(Icons.highlight_remove_outlined,size:17),))
                            ],
                          ),
                        ),
                      ),
                    ),),
                        // Expanded(child: Column(
                        //   children: [
                         
                        //       Text(('\$${(totalsPrice()).toStringAsFixed(2)}'),style: 
                        //                   const TextStyle(
                        //                     color: Colors.deepOrange,
                        //                     fontWeight: FontWeight.bold,
                        //                     fontSize: 18,
                        //                   ),),
                        //   ],
                        // ))
                        
                      
                    
                 );
                  
               
              

              
          
  }
}