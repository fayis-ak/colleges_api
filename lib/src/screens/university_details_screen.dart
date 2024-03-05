import 'package:colleges_api/src/constants/colors.dart';
import 'package:colleges_api/src/models/univercity.dart';
import 'package:colleges_api/src/screens/university_list_screen.dart';
import 'package:colleges_api/src/services/university_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class UniversityDetailsScreen extends StatefulWidget {
  const UniversityDetailsScreen({super.key});

  @override
  State<UniversityDetailsScreen> createState() =>
      _UniversityDetailsScreenState();
}

List<University> data = [];

class _UniversityDetailsScreenState extends State<UniversityDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'UniversityDetails screen',
            style: GoogleFonts.acme(),
          ),
        ),
        body: FutureBuilder(
          future: UniversityService.getUniversities(),
          builder: (BuildContext context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              data = snapshot.data!;
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * .030,
                        vertical: MediaQuery.of(context).size.width * .020,
                      ),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => UniversityListScreen(
                                university: data[index],
                              ),
                            ),
                          );
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width * .030,
                          height: MediaQuery.of(context).size.height * 0.10,
                          decoration: BoxDecoration(
                            boxShadow: const [
                              BoxShadow(
                                color: Colorsclass.shadowblackcolor,
                                blurRadius: 2,
                                offset: Offset(0, 3),
                              ),
                            ],
                            border: Border.all(),
                            color: Colors.green.shade100,
                            borderRadius: BorderRadius.circular(
                              MediaQuery.of(context).size.width * .020,
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                data[index].name,
                                style: GoogleFonts.acme(
                                  color: Colors.blueGrey,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ));
                },
              );
            }
          },
        ));
  }
}
