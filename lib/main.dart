import 'package:flutter/material.dart';
import 'widgets/app_bar.dart';
import 'widgets/search_bar.dart' as custom; // Alias the custom SearchBar
import 'widgets/specialist_banner_slider.dart';
import 'widgets/categories_section.dart';
import 'widgets/medical_centers_section.dart';
import 'widgets/doctor_list_section.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Roboto'),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: buildAppBar(),
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverToBoxAdapter(
                // Adding Padding around the header content
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      custom.SearchBar(), // Use the aliased SearchBar here
                      SizedBox(height: 20),
                      SpecialistBannerSlider(),
                      SizedBox(height: 20),
                      CategoriesSection(),
                      SizedBox(height: 20),
                      MedicalCentersSection(),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ];
          },
          // Adding Padding around the DoctorListSection
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: DoctorListSection(), // Scrollable ListView.builder goes here
          ),
        ),
      ),
    );
  }
}
