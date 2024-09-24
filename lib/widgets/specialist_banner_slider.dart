import 'dart:async'; // To use Timer
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'specialist_banner.dart';

class SpecialistBannerSlider extends StatefulWidget {
  @override
  _SpecialistBannerSliderState createState() => _SpecialistBannerSliderState();
}

class _SpecialistBannerSliderState extends State<SpecialistBannerSlider> {
  final PageController _controller = PageController();
  Timer? _timer;
  int _currentPage = 0;
  final int _totalPages = 3; // Total number of pages

  @override
  void initState() {
    super.initState();
    startAutoPlay();
  }

  void startAutoPlay() {
    _timer = Timer.periodic(Duration(seconds: 3), (Timer timer) {
      if (_currentPage < _totalPages - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      _controller.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  void stopAutoPlay() {
    _timer?.cancel(); // Cancel the timer
  }

  @override
  void dispose() {
    _timer?.cancel(); // Cancel the timer when the widget is disposed
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter, // Align dots at the bottom center
      children: [
        GestureDetector(
          onPanDown: (details) {
            stopAutoPlay(); // Stop autoplay when the user starts interacting
          },
          onPanEnd: (details) {
            startAutoPlay(); // Resume autoplay when the user finishes interacting
          },
          child: SizedBox(
            height: 160, // Height of the slider
            child: PageView(
              controller: _controller,
              onPageChanged: (int index) {
                _currentPage = index; // Update current page index
              },
              children: [
                SpecialistBanner(
                  title: 'Looking for Specialist Doctors?',
                  subtitle: 'Schedule an appointment with our top doctors.',
                  imagePath: 'assets/images/clinic.png',
                  backgroundColor: Color(0xFF7DBD86), // Green background
                ),
                SpecialistBanner(
                  title: 'Discover Top Cardiologists',
                  subtitle: 'We connect you with the best professionals.',
                  imagePath: 'assets/images/doctor2.png',
                  backgroundColor: Colors.blue, // Blue background
                ),
                SpecialistBanner(
                  title: 'Get the Best Medical Advice',
                  subtitle: 'Your health is our top priority.',
                  imagePath: 'assets/images/doctor3.png',
                  backgroundColor: Colors.red, // Red background
                ),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 8,
          child: SmoothPageIndicator(
            controller: _controller, // Attach the PageController
            count: 3, // Number of pages in the PageView
            effect: WormEffect(
              activeDotColor: Colors.white, // Set active dot color to white
              dotColor: Colors.white.withOpacity(0.5),
              dotHeight: 8,
              dotWidth: 8,
              spacing: 16,
            ),
          ),
        ),
      ],
    );
  }
}
