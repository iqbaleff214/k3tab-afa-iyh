import 'package:afa_iyh/db/source.dart';
import 'package:flutter/material.dart';
import 'package:galleryimage/galleryimage.dart';
import 'package:google_fonts/google_fonts.dart';

import '../util/color.dart';

class QuestionPage extends StatefulWidget {
  final Engine engine;

  const QuestionPage({super.key, required this.engine});

  @override
  State<QuestionPage> createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {

  int questionIndex = 0;
  List<bool> answers = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: const Icon(Icons.arrow_back),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(widget.engine.name, style: GoogleFonts.poppins().copyWith(color: orangeColor, fontWeight: FontWeight.w600, fontSize: 16), textAlign: TextAlign.right,),
                          Text(widget.engine.category.name, style: GoogleFonts.poppins().copyWith(color: Colors.black54, fontWeight: FontWeight.w600, fontSize: 10),),
                        ],
                      ),
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: questionIndex >= 0 ? [
                    widget.engine.questions[questionIndex].images.length > 0 ? Center(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: widget.engine.questions[questionIndex].images.map((image) => Padding(
                            padding: const EdgeInsets.only(right: 8, top: 16),
                            child: ClipRRect(borderRadius: BorderRadius.circular(8.0), child: Image.asset(image, height: 200,)),
                          )).toList(),
                        ),
                      ),
                    ) : const SizedBox(height: 16,),
                    const SizedBox(height: 16,),
                    Center(child: Text(widget.engine.questions[questionIndex].question, style: GoogleFonts.poppins().copyWith(fontWeight: FontWeight.w600, fontSize: 16), textAlign: TextAlign.center,)),
                  ] : [
                    (widget.engine.results[answers.toString()]?.images.length ?? 0) > 0 ? Center(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: widget.engine.results[answers.toString()]?.images.map((image) => Padding(
                            padding: const EdgeInsets.only(right: 8, top: 16),
                            child: ClipRRect(borderRadius: BorderRadius.circular(8.0), child: Image.asset(image, height: 200,)),
                          )).toList() ?? [],
                        ),
                      ),
                    ) : const SizedBox(height: 16,),
                    const SizedBox(height: 16,),
                    Center(child: Text(widget.engine.results[answers.toString()]?.title ?? 'No result found, sorry!', style: GoogleFonts.poppins().copyWith(fontSize: 14, fontWeight: FontWeight.w600), textAlign: TextAlign.center,)),
                    const SizedBox(height: 12,),
                    Center(child: Text(widget.engine.results[answers.toString()]?.definition ?? '-', style: GoogleFonts.poppins().copyWith(fontSize: 12), textAlign: TextAlign.center,)),
                    const SizedBox(height: 24),
                    (widget.engine.results[answers.toString()]?.causes.length ?? 0) > 0 ? Center(child: Text('Probable causes', style: GoogleFonts.poppins().copyWith(fontWeight: FontWeight.w600, fontSize: 12, color: Colors.red), textAlign: TextAlign.center,)) : const SizedBox(),
                    ...widget.engine.results[answers.toString()]?.causes.map((String cause) => Padding(
                      padding: const EdgeInsets.only(top: 8, left: 8),
                      child: Text('•  ' + cause, style: GoogleFonts.poppins().copyWith(fontWeight: FontWeight.w500, fontSize: 12), textAlign: TextAlign.start,),
                    )).toList() ?? [],
                  ],
                ),
                const SizedBox(height: 45,),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: questionIndex >= 0 ? [
                      TextButton(
                        onPressed: () {
                          setState(() {
                            answers = [...answers, true];
                            questionIndex = widget.engine.questions[questionIndex].positiveAnswerIndexCursor;
                          });
                        },
                        style: TextButton.styleFrom(
                            backgroundColor: orangeColor,
                            padding: const EdgeInsets.symmetric(horizontal: 32)
                        ),
                        child: Text("Yes", style: GoogleFonts.poppins().copyWith(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 16),),
                      ),
                      const SizedBox(width: 8,),
                      TextButton(
                        onPressed:  () {
                          setState(() {
                            answers = [...answers, false];
                            questionIndex = widget.engine.questions[questionIndex].negativeAnswerIndexCursor;
                          });
                        },
                        style: TextButton.styleFrom(
                            backgroundColor: const Color(0xffefefef),
                            padding: const EdgeInsets.symmetric(horizontal: 32)
                        ),
                        child: Text("No", style: GoogleFonts.poppins().copyWith(color: Colors.black, fontWeight: FontWeight.w600, fontSize: 16),),
                      ),
                    ] : [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: TextButton.styleFrom(
                            backgroundColor: orangeColor,
                            padding: const EdgeInsets.symmetric(horizontal: 32)
                        ),
                        child: Text("OK", style: GoogleFonts.poppins().copyWith(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 16),),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
