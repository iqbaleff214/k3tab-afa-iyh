import 'package:afa_iyh/util/color.dart';
import 'package:afa_iyh/view/main_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController tokenController = TextEditingController();
  final db = FirebaseFirestore.instance;
  final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();

  bool isLoading = false;
  Map<String, dynamic> deviceData = <String, dynamic>{};

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  Future<void> initPlatformState() async {
    AndroidDeviceInfo build = await deviceInfoPlugin.androidInfo;
    var result = {
      'version.sdkInt': build.version.sdkInt,
      'version.release': build.version.release,
      'version.codename': build.version.codename,
      'version.baseOS': build.version.baseOS,
      'board': build.board,
      'brand': build.brand,
      'device': build.device,
      'host': build.host,
      'id': build.id,
      'manufacturer': build.manufacturer,
      'model': build.model,
      'product': build.product,
      'serialNumber': build.serialNumber,
    };
    setState(() { deviceData = result; });
  }

  Future<void> signIn() async {
    if (tokenController.text.isEmpty) {
      Fluttertoast.showToast(
          msg: "Sign in code is required",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
      return;
    }

    setState(() { isLoading = true; });
    await db.collection('credential').doc(tokenController.text).get().then((event) {
      var data = event.data();
      if (data == null) {
        Fluttertoast.showToast(
            msg: "Sign in code is invalid",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0
        );
        return;
      }

      var log = data['log'] ?? [];
      db.collection('credential').doc(tokenController.text).set({
        'log': [...log, {
          ...deviceData,
          'accessTime': DateTime.now().toIso8601String(),
        }],
      }).onError((e, s) {
        Fluttertoast.showToast(
            msg: e.toString(),
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0
        );
      }).whenComplete(() {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MainPage()),
        );
      });
    }).onError((e, s) {
      Fluttertoast.showToast(
          msg: e.toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
    }).whenComplete(() { setState(() { isLoading = false; }); });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFAFAFA),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('asset/background.webp'),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(Colors.black54, BlendMode.darken),
          ),
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 32),
                child: Image.asset('asset/logo.png', height: 65,),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    TextField(
                      controller: tokenController,
                      decoration: InputDecoration(
                        hintText: "Sign In Code",
                        hintStyle: GoogleFonts.poppins().copyWith(
                            fontSize: 14, color: const Color(0xFF8D92A3)),
                        border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                            borderSide: BorderSide.none),
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 32, vertical: 16),
                        isDense: true,
                        fillColor: Colors.white,
                        filled: true,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: TextButton(
                          onPressed: isLoading ? null : signIn,
                          style: TextButton.styleFrom(
                            backgroundColor: orangeColor,
                            padding: const EdgeInsets.symmetric(horizontal: 32)
                          ),
                          child: isLoading ? const SizedBox(width: 14, height: 14, child: CircularProgressIndicator(color: Colors.white,)) : Text("Sign In", style: GoogleFonts.poppins().copyWith(color: Colors.white, fontWeight: FontWeight.w600),),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Applied Failure Analysis", style: GoogleFonts.poppins().copyWith(color: Colors.white, fontSize: 14),),
                    Text("in Your Hand", style: GoogleFonts.poppins().copyWith(color: Colors.white, fontSize: 14),),
                    Text("By K3TAB 2024", style: GoogleFonts.poppins().copyWith(color: orangeColor, fontSize: 18, fontWeight: FontWeight.w600),),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}