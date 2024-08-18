import 'package:afa_iyh/util/color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFAFAFA),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Column(
          children: [
            const Center(child: Text("MAIN PAGE")),
            DefaultTabController(length: 4, child: Column(
              children: [
                TabBar(tabs: [
                  Tab(child: Text("All", style: GoogleFonts.poppins().copyWith(fontSize: 11),),),
                  Tab(child: Text("Engine", style: GoogleFonts.poppins().copyWith(fontSize: 11),),),
                  Tab(child: Text("Powertrain", style: GoogleFonts.poppins().copyWith(fontSize: 11),),),
                  Tab(child: Text("Hydraulic", style: GoogleFonts.poppins().copyWith(fontSize: 11),),),
                ], indicatorColor: orangeColor, dividerColor: orangeColor,)
              ],
            )),
          ],
        ),
      ),
    );
  }
}