import 'package:afa_iyh/db/source.dart';
import 'package:afa_iyh/util/color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MainPage extends StatefulWidget {
  late List<String> categories;

  MainPage({super.key}) {
    categories = dataSourceCategory.map((d) { return d['category'].toString(); }).toSet().toList();
    categories.insert(0, 'All');
  }

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  var selectedCategoryIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfffffaf0),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: Image.asset('asset/instruction.png',),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: widget.categories.asMap().entries.map((entry) {
                    var selected = entry.key == selectedCategoryIndex;
                    return Padding(
                      padding: const EdgeInsets.only(right: 4, bottom: 8),
                      child: TextButton(
                          onPressed: () {
                            setState(() {
                              selectedCategoryIndex = entry.key;
                            });
                          },
                          style: TextButton.styleFrom(
                              backgroundColor: selected ? orangeColor : Colors.white,
                              padding: const EdgeInsets.symmetric(horizontal: 18)
                          ),
                          child: Text(entry.value, style: GoogleFonts.poppins().copyWith(color: selected ? Colors.white : orangeColor, fontWeight: FontWeight.w600, fontSize: 12),)
                      ),
                    );
                  }).toList(),
                ),
              ),
              Expanded(
                child: CustomScrollView(
                  primary: false,
                  slivers: <Widget>[
                    SliverPadding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      sliver: SliverGrid.count(
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        crossAxisCount: 2,
                        children: dataSourceCategory.where((dynamic e) { return e['category'] == widget.categories[selectedCategoryIndex] || selectedCategoryIndex == 0; }).map((dynamic e) {
                          return Card(
                            elevation: 0,
                            color: Colors.white,
                            child: Padding(
                              padding: const EdgeInsets.all(16),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      const SizedBox(),
                                      e['available'] as bool ? const SizedBox() : const Icon(
                                        Icons.lock,
                                        color: Colors.black38,
                                        size: 18.0,
                                        semanticLabel: 'Text to announce in accessibility modes',
                                      ),
                                    ],
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(e['name'].toString(), style: GoogleFonts.poppins().copyWith(color: orangeColor, fontWeight: FontWeight.w600, fontSize: 14), textAlign: TextAlign.right,),
                                      Text(e['category'].toString(), style: GoogleFonts.poppins().copyWith(color: Colors.black54, fontWeight: FontWeight.w600, fontSize: 12),),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        }).toList(),
                      )
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}