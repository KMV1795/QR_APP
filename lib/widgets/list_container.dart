import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListContainer extends StatelessWidget {
  const ListContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black45,
      child: Stack(
       children: [
         Positioned(
             child: Container()
         ),
         Container(
           decoration: const BoxDecoration(
             color: Colors.grey
           ),
           child: Column(
             children: const [
               Text("IP Address"),
               Text("Address"),
             ],
           ),
         ),
       ],
      ),
    );
  }
}
