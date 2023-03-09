import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(top: 50),
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
                      indicatorColor: Colors.white,
                      tabs: [
                        Tab(text: "TODAY",),
                        Tab(text: "YESTERDAY",),
                        Tab(text: "OTHERS",),
                      ],
                    ),
                  ),
                  Container(
                    height:  MediaQuery.of(context).size.height * 0.8,
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.only(top: 20,bottom: 20,left: 10,right: 10),
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
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              height: 50,
              width: 150,
              margin: const EdgeInsets.only(top: 25),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Colors.blue,
              ),
              child: const Center(
                child: Text(
                  "LOGIN DETAILS",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10,right: 10,top: 02,bottom: 05),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(onPressed:(){}, icon: const Icon(Icons.arrow_back_ios_sharp,color: Colors.white,)),
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
                  margin: const EdgeInsets.only(top: 30),
                  padding: const EdgeInsets.only(left: 20,top: 05,bottom: 05),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(05)),
                    color: Colors.grey,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text("IP Address",style: TextStyle(color: Colors.white),),
                      Text("Address",style: TextStyle(color: Colors.white),),
                      Text("Date",style: TextStyle(color: Colors.white),),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    height: 100,
                    width: 100,
                    padding: const EdgeInsets.symmetric(vertical: 02,horizontal: 05),
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
