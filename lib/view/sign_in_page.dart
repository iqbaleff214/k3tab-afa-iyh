import 'package:afa_iyh/util/color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController tokenController = TextEditingController();

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
                          onPressed: () {},
                          style: TextButton.styleFrom(
                            backgroundColor: orangeColor,
                            padding: const EdgeInsets.symmetric(horizontal: 32)
                          ),
                          child: Text("Sign In", style: GoogleFonts.poppins().copyWith(color: Colors.white, fontWeight: FontWeight.w600),),
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