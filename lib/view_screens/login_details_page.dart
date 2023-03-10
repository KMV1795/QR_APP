import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/const_widgets.dart';

class LoginDetails extends StatefulWidget {
  const LoginDetails({Key? key}) : super(key: key);

  @override
  State<LoginDetails> createState() => _LoginDetailsState();
}

class _LoginDetailsState extends State<LoginDetails> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Stack(
        children: [
          /* Circle at the top right corner */
          const PositionedContainer(),
          /* Tabs */
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(top: 100),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
              color: Colors.black87,
            ),
            child: DefaultTabController(
              length: 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 30),
                    child: const TabBar(
                      indicatorSize: TabBarIndicatorSize.label,
                      labelStyle:  TextStyle(color: Colors.white70),
                      indicator:  UnderlineTabIndicator(
                          borderSide: BorderSide(
                            width: 4,
                            color:Colors.white70,
                          ),),
                      tabs: [
                         Tab(text: "TODAY",),
                        Tab(text: "YESTERDAY",),
                        Tab(text: "OTHERS",),
                      ],
                    ),
                  ),
                  Container(
                    height:  MediaQuery.of(context).size.height * 0.72,
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.only(top: 05,bottom: 10,left: 10,right: 10),
                    child:  TabBarView(
                      children: [
                        todayList(),
                        todayList(),
                        todayList(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          /* Title Widget */
          const TitleWidget(title: 'LAST LOGIN',),
          Container(
            margin: const EdgeInsets.only(top: 30),
            padding: const EdgeInsets.only(left: 10, right: 10, top: 02, bottom: 05),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(onPressed:(){Navigator.pop(context);}, icon: const Icon(Icons.arrow_back_ios_sharp,color: Colors.white,)),
                TextButton(
                  onPressed: () {  },
                  child: const Text(
                    "LOGOUT",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget todayList(){
    return ListView.builder(
        shrinkWrap: true,
        itemCount: 15,
        itemBuilder: (context, index){
          return Container(
            padding: const EdgeInsets.symmetric(vertical: 05,horizontal: 05),
            child: Stack(
              children: [
                Container(
                  height:80,
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.only(top: 25),
                  padding: const EdgeInsets.only(left: 10,top: 10,bottom: 10),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.white10,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text("2.50 PM",style: TextStyle(color: Colors.white70),),
                      Spacer(),
                      Text("IP: 123.123.123.123",style: TextStyle(color: Colors.white70),),
                      Spacer(),
                      Text("CHENNAI",style: TextStyle(color: Colors.white70),),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    height: 100,
                    width: 100,
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(05)),
                      color: Colors.white,
                    ),
                    child: const Center(child: Image(image: AssetImage("assets/background.jpg"),)),
                  ),
                ),
              ],
            ),
          );
        }
    );
  }


}
