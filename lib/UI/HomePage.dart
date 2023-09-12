import 'package:fininfocom/NativeAndroid/bluetooth_channel.dart';
import 'package:fininfocom/Service/DetailService.dart';
import 'package:flutter/material.dart';
import 'package:fininfocom/UI/UserTestScreen.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';




class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  bool isloading = false;
  var dogimage;
  Detailservice detailService = Detailservice();

  @override
  void initState() {
    super.initState();
    getdata();
  }

  Future getdata() async {
    setState(() {
      isloading = true;
    });
    var _dogimage = await detailService.GetDogDetails();
    setState(() {
      dogimage = _dogimage;
    });
    setState(() {
      isloading = false;
    });
  }






  static const platform = MethodChannel('com.Fininfocom.fininfocom/bluetooth');

  Future<void> enableBluetooth() async {
    try {
      await platform.invokeMethod('enableBluetooth');
      // Bluetooth is enabled
    } on PlatformException catch (e) {
      // Error occurred while enabling Bluetooth
      print(e.message);
    }
  }

    @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: true,
        bottom: true,
        child: Container(
          padding: const EdgeInsets.only(top: 20, bottom: 20),
          child: Column(
            children: [

              const Center(
                child: Text(
                  'Dog Image',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),

              const SizedBox(height: 20,),

              isloading ?
              const SizedBox(
                height: 100,
                width: 100,
                child: Center(
                  child: CircularProgressIndicator(
                    color: Colors.black,
                    strokeWidth: 5,
                  ),
                ),
              ) :
              CircleAvatar(
                radius: MediaQuery.sizeOf(context).width/3,
                backgroundImage: NetworkImage(dogimage),
              ),

              const SizedBox(height: 20,),

              MaterialButton(
                elevation: 2,
                color: Colors.blue,
                onPressed: () => getdata(),
                height: 50,
                textColor: Colors.black,
                child: const Text(
                  'Refresh',
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),),
              ),

              const Spacer(),

              MaterialButton(
                elevation: 2,
                color: Colors.blue,
                onPressed: () => Navigator.push(context, MaterialPageRoute(
                  builder: (context) => UserTest()
                )),
                height: 50,
                textColor: Colors.black,
                child: const Text(
                  'Test User',
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),),
              ),

              const Spacer(),

              MaterialButton(
                elevation: 2,
                color: Colors.blue,
                onPressed: () => enableBluetooth(),
                height: 50,
                textColor: Colors.black,
                child: const Text(
                  'Enable Bluetooth',
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),),
              ),

              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}



