import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'map_screen.dart';

class ParkingHomePage extends StatefulWidget {
  const ParkingHomePage({super.key});

  @override
  State<ParkingHomePage> createState() => _ParkingHomePageState();
}

class _ParkingHomePageState extends State<ParkingHomePage> {
  bool _carVisible = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 300), () {
      setState(() => _carVisible = true);
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    // define car dimensions and position
    final double carWidth = size.width * 0.8;
    final double carLeft  = ((size.width - carWidth) * 1.9) / 2;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: SvgPicture.asset(
                'assets/parking_spot.svg',
                width: size.width * 0.78,
                fit: BoxFit.contain,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 40),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Park\nAnywhere you Go.',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Barlow',
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 40), // Increased from 20 to 40
                  SizedBox(
                    width: size.width * 0.9,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 24),
                        elevation: 6,
                      ),
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const MapScreen()),
                      ),
                      child: const Text(
                        "Let's Go",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w900,
                          fontFamily: 'Barlow',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 2000),
            curve: Curves.decelerate,
            top: _carVisible ? -size.height * 0.04 : size.height,
            left: carLeft,
            child: SizedBox(
              width: carWidth,
              child: Image.asset('assets/car.png', fit: BoxFit.cover),
            ),
          ),
        ],
      ),
    );
  }
}
