import 'package:flutter/material.dart';
import 'commonscol.dart';
import 'title.dart';
import 'category.dart';

List<Category> categorieslist = [
  Category(
    name: 'Ex-Del',
    image: 'express.png'
  ),
  Category(
    name: 'Grocery',
    image: 'groceries.png'
  ),
  Category(
    name: 'Pick&drop',
    image: 'shipping-and-delivery.png'
  ),
  Category(
    name: 'Sweets',
    image: 'sweets.png'
  ),
   Category(
    name: 'Wines',
    image: 'whiskey.png'
  ),
   Category(
    name: 'Food',
    image: 'plate.png'
  ),
   Category(
    name: 'Cakes',
    image: 'birthday-cake.png'
  ),
   Category(
    name: 'Medicines',
    image: 'capsules.png'
   ),



];


class Categories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(

                 height: 100,
                 
                 child: ListView.builder(
                   scrollDirection: Axis.horizontal,
                   itemCount: categorieslist.length ,
                   itemBuilder: (_, index) {
                     return Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: Column(
                       children: <Widget>[
                         Container(
                           decoration: BoxDecoration(

                             color: white,
                             boxShadow: [
                               BoxShadow(
                                 color: red[50],
                                 offset: Offset(4, 6),
                                 blurRadius: 20,

                               ),
                             ],
                           ),
                           child: Padding(padding: EdgeInsets.all(4),
                           child: Image.asset(
                             'image/${categorieslist[index].image}',width: 50,
                             ),
                           ),

                         ),
                         SizedBox(
                           height: 5,


                             

                         ),
                         CustomText(text: categorieslist[index].name,size: 14,color: black,
                         ),
                       ],

                     ),
                   );
                   }
                                     
                 ),

               );
  }
}