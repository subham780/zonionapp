import 'package:flutter/material.dart';
import 'package:zonionap/Utilities/constants.dart';
import 'package:zonionap/Utilities/customtext.dart';
import 'package:zonionap/Models/category.dart';

List<Category> categorieslist = [
  Category(name: 'Ex-Del', image: 'express.png'),
  Category(name: 'Grocery', image: 'groceries.png'),
  Category(name: 'Pick&drop', image: 'shipping-and-delivery.png'),
  Category(name: 'Sweets', image: 'sweets.png'),
  Category(name: 'Wines', image: 'whiskey.png'),
  Category(name: 'Food', image: 'plate.png'),
  Category(name: 'Cakes', image: 'birthday-cake.png'),
  Category(name: 'Medicines', image: 'capsules.png'),
];

class Categories extends StatelessWidget {
  Widget getCategories({int index}) {
    return Expanded(
      child: Column(
        children: <Widget>[
          Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: FlatButton(
                  onPressed: () {
                    print('tapped');
                  },
                  child: Image.asset(
                    'image/${categorieslist[index].image}',
                    width: 50,
                  ),
                ),
              ),
              CustomText(
                text: categorieslist[index].name,
                size: 14,
                color: black,
              ),
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: boxDecoration,
      height: 200,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              getCategories(index: 0),
              getCategories(index: 1),
              getCategories(index: 2),
              getCategories(index: 3),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              getCategories(index: 4),
              getCategories(index: 5),
              getCategories(index: 6),
              getCategories(index: 7),
            ],
          ),
        ],
      ),
    );
  }
}

//  Column(
//               children: <Widget>[
//                 Padding(
//                   padding: EdgeInsets.all(4),
//                   child: Image.asset(
//                     'image/${categorieslist[0].image}',
//                     width: 50,
//                   ),
//                 ),
//                 CustomText(
//                   text: categorieslist[0].name,
//                   size: 14,
//                   color: black,
//                 ),
//                 Padding(
//                   padding: EdgeInsets.all(4),
//                   child: Image.asset(
//                     'image/${categorieslist[0].image}',
//                     width: 50,
//                   ),
//                 ),
//                 CustomText(
//                   text: categorieslist[0].name,
//                   size: 14,
//                   color: black,
//                 ),
//               ],
//             )
