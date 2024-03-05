import 'package:colleges_api/src/constants/colors.dart';
import 'package:colleges_api/src/models/univercity.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class UniversityListScreen extends StatelessWidget {
  final University university;
  const UniversityListScreen({super.key, required this.university});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'University List screen',
          style: GoogleFonts.acme(),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * .030,
          vertical: MediaQuery.of(context).size.width * .020,
        ),
        child: Container(
          width: MediaQuery.of(context).size.width * 3,
          height: MediaQuery.of(context).size.height * 0.200,
          decoration: BoxDecoration(
              boxShadow: const [
                BoxShadow(
                  color: Colorsclass.shadowblackcolor,
                  blurRadius: 6,
                  offset: Offset(0, 3),
                ),
              ],
              border: Border.all(),
              color: Colors.teal,
              borderRadius: BorderRadius.circular(
                MediaQuery.of(context).size.width * .020,
              )),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'CollegeName : ${university.name}',
                    style: GoogleFonts.acme(
                      color: Colors.lime,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .010,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Country : ${university.country}',
                    style: GoogleFonts.acme(
                      color: Colors.white60,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .010,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      launch(university.webpage.toString());
                    },
                    child: Text(
                      'web page :  ${university.webpage}',
                      style: GoogleFonts.acme(
                        color: Colors.white60,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
