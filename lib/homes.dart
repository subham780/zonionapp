import 'package:flutter/material.dart';
import 'package:zonionap/categories.dart';
//import 'package:zonionap/corousel.dart';
import 'package:zonionap/title.dart';
import 'commonscol.dart';

//import 'hlistview.dart';

class Homescreen extends StatefulWidget {
  @override
  _HomescreenState createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      backgroundColor: white,
      body: SafeArea(
              child: ListView(
             children: <Widget>[
               Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: <Widget>[
                   Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: CustomText(
                       text: "What are you looking for??",
                       size: 18,
                        ),
                     
                     ),
                     IconButton(icon:Icon(Icons.notifications_none) , onPressed: () {}),
                 ],

               ),
               SizedBox(
                 height: 5,

               ),
               Container(
                 decoration: BoxDecoration(
                   color: white,
                   boxShadow: [
                     BoxShadow(
                       color: red[300],
                       offset: Offset(1, 1),
                       blurRadius: 4,

                     ),
                   ]

                 ),
                 child: ListTile(
                   leading: Icon(Icons.search,color: Colors.red,),
                   title: TextField(
                     decoration: InputDecoration(
                       hintText: 'find items and stores near you',
                       border: InputBorder.none,

                     ),

                   ),
                   trailing: Icon(
                     Icons.filter_list,
                     color: Colors.red,
                     ),
                   

                 ),

               ),
               SizedBox(
                 height: 5,

              ), 
               Categories(),
               Divider(),
                Padding(
                  
                  padding: const EdgeInsets.all(8.0),
                  child: CustomText(
                    text: "HOT STORES NEAR YOU",
                    size: 15,
                    color: black,
                    
                   

               ),
                ),

               
             
          ],

        ),
      ),
      
    );
  }
}