import 'package:afa_iyh/db/source.dart';
import 'package:afa_iyh/util/color.dart';
import 'package:afa_iyh/view/question_page.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

class MainPage extends StatefulWidget {
  late List<String> categories;

  MainPage({super.key}) {
    categories = Category.values.map((e) { return e.name; }).toList();
    categories.insert(0, 'all');
  }

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  var selectedCategory = 'all';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
                  children: widget.categories.map((category) {
                    var selected = category == selectedCategory;
                    return Padding(
                      padding: const EdgeInsets.only(right: 4, bottom: 8),
                      child: TextButton(
                          onPressed: () {
                            setState(() {
                              selectedCategory = category;
                            });
                          },
                          style: TextButton.styleFrom(
                              backgroundColor: selected ? orangeColor : Colors.white38,
                              padding: const EdgeInsets.symmetric(horizontal: 18),
                          ),
                          child: Text(category, style: GoogleFonts.poppins().copyWith(color: selected ? Colors.white : orangeColor, fontWeight: FontWeight.w600, fontSize: 12),)
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
                        children: engines.where((Engine e) { return e.category.name == selectedCategory || selectedCategory == 'all'; }).map((Engine e) {
                          return GestureDetector(
                            onTap: () {
                              if (!e.availability) {
                                Fluttertoast.showToast(
                                    msg: e.name + " is currently unavailable",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.BOTTOM,
                                    backgroundColor: Colors.red,
                                    textColor: Colors.white,
                                    fontSize: 16.0
                                );
                                return;
                              }

                              Navigator.push(context, MaterialPageRoute(builder: (builder) => QuestionPage(engine: e)));
                            },
                            child: Card(
                              // elevation: 2,
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
                                        e.availability ? const SizedBox() : const Icon(
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
                                        Text(e.name, style: GoogleFonts.poppins().copyWith(color: orangeColor, fontWeight: FontWeight.w600, fontSize: 14), textAlign: TextAlign.right,),
                                        Text(e.category.name, style: GoogleFonts.poppins().copyWith(color: Colors.black54, fontWeight: FontWeight.w600, fontSize: 12),),
                                      ],
                                    ),
                                  ],
                                ),
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