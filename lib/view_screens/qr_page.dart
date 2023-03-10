import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_app/services/ip_address_provider.dart';
import 'package:qr_app/services/location_provider.dart';
import 'package:qr_app/services/login_time_provider.dart';
import 'package:qr_flutter/qr_flutter.dart';
import '../services/random_string_provider.dart';
import '../widgets/const_widgets.dart';
import 'login_details_page.dart';

class QrPage extends StatefulWidget {
  const QrPage({Key? key,}) : super(key: key);

  @override
  State<QrPage> createState() => _QrPageState();
}

class _QrPageState extends State<QrPage> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Stack(
        children: [
          /* Circle at the top right corner */
          const PositionedContainer(),
          /* Random Qr generation with Save Button */
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(
              top: 100,
            ),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
              color: Colors.black87,
            ),
            child: Stack(
              children: [
                /* Save Button */
                Button(
                  callback: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginDetails()),
                    );
                  },
                  actionName: 'SAVE',
                ),
                /* Last Login Time */
                Consumer<LoginTimeProvider>(
                  builder: (context,timeModel,child)=>
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: 60,
                      width: 280,
                      margin: const EdgeInsets.only(bottom: 80),
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(15),
                        ),
                        border: Border.all(
                          color: Colors.white70,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          "Last Login Today, ${timeModel.loginTime}",
                          style: const TextStyle(
                              color: Colors.white70,
                              fontWeight: FontWeight.normal,
                              fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                ),
                Consumer<IpAddressProvider>(
                  builder: (context,ipModel,child)=>
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          height: 60,
                          width: 280,
                          margin: const EdgeInsets.only(bottom: 30),
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(15),
                            ),
                            border: Border.all(
                              color: Colors.white70,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              ipModel.ipAddress,
                              style: const TextStyle(
                                  color: Colors.white70,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 20),
                            ),
                          ),
                        ),
                      ),
                ),
                /* Image at the Center */
                const ImageContainer(),
                /* Qr Image */
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Consumer<RandomStringProvider>(
                     builder: (context, model, child) =>
                      Container(
                        height: 200,
                        width: 200,
                        margin: const EdgeInsets.only(top: 70, left: 70),
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(15),
                          ),
                          color: Colors.white.withOpacity(0.7),
                        ),
                        child: Center(
                          child: SizedBox(
                            height: 180,
                            width: 180,
                            child: QrImage(
                              data: model.randomString,
                              version: QrVersions.auto,
                              size: 200.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(20),
                      padding: const EdgeInsets.only(
                        left: 60,
                      ),
                      child: const Text(
                        "Generated Number",
                        style: TextStyle(
                            color: Colors.white70,
                            fontWeight: FontWeight.normal,
                            fontSize: 23),
                      ),
                    ),
                    Consumer<RandomStringProvider>(
                      builder: (context, model, child) => Container(
                        margin: const EdgeInsets.all(20),
                        padding: const EdgeInsets.only(
                          left: 60,
                        ),
                        child: Text(
                          model.randomString,
                          style: const TextStyle(
                              color: Colors.white70,
                              fontWeight: FontWeight.normal,
                              fontSize: 30),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          /* Title Widget */
          const TitleWidget(
            title: 'PLUGIN',
          ),
          /* Logout Button */
          LogoutButton(
            callback: () {},
          ),
        ],
      ),
    );
  }
}
