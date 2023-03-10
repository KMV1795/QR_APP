import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_app/services/ip_address_provider.dart';
import 'package:qr_app/services/login_time_provider.dart';
import 'package:qr_app/view_screens/qr_page.dart';
import '../services/location_provider.dart';
import '../services/random_string_provider.dart';
import '../widgets/const_widgets.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {


  TextEditingController phoneNumber = TextEditingController();
  TextEditingController otp = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Stack(
        children: [
          /* Circle at the top right corner */
          const PositionedContainer(),
          /* Login Details Widget */
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
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 100, bottom: 20),
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 30),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        inputName("Phone Number"),
                        const SizedBox(height: 20),
                        textFieldWidget(phoneNumber),
                        const SizedBox(height: 30),
                        inputName("OTP"),
                        const SizedBox(height: 20),
                        textFieldWidget(otp),
                      ],
                    ),
                  ),
                  const SizedBox(height: 50),
                  Button(
                    callback: () {
                      Provider.of<RandomStringProvider>(context, listen: false).generateRandomString();
                      Provider.of<LoginTimeProvider>(context, listen: false).getDateTime();
                      Provider.of<LocationProvider>(context, listen: false).getLocation();
                      Provider.of<IpAddressProvider>(context, listen: false).getIpAddress();
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const QrPage(),),
                      );
                    },
                    actionName: 'LOGIN',
                  ),
                ],
              ),
            ),
          ),
          /* Title Widget */
          const TitleWidget(title: 'LOGIN',),
        ],
      ),
    );
  }



  Widget textFieldWidget(TextEditingController controller){
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.number,
      maxLength: 10,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide:
          const BorderSide(color: Colors.black87),
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide:
          const BorderSide(color: Colors.black87),
          borderRadius: BorderRadius.circular(10),
        ),
        filled: true,
        fillColor: Colors.deepPurple,
        // hintText: 'Enter Phone Number',
        // hintStyle: const TextStyle(color: Colors.white70),
      ),
    );
  }


}
