import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class DesktopLayout extends StatelessWidget {
  DesktopLayout({super.key});
  final TempUnit tempUnit = TempUnit.celsius;
  final PageController pageController = PageController(
    initialPage: 1,
    viewportFraction: 0.65,
  );

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);

    return Container(
      height: size.height,
      width: size.width,
      decoration: const BoxDecoration(
        color: Color(0xff252323),
      ),
      child: Stack(
        children: [
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'WeatherMe',
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: size.width * 0.051,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        '21:00pm',
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: size.width * 0.014,
                          fontWeight: FontWeight.w400,
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'Today',
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: size.width * 0.022,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      SizedBox(width: size.width * 0.05),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'Tomorrow',
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: size.width * 0.022,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      SizedBox(width: size.width * 0.05),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'Monthly Forecast',
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: size.width * 0.022,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      SizedBox(width: size.width * 0.05),
                    ],
                  )
                ],
              ),

              //unit switch
              Row(
                children: [
                  TempUnitSwitch(),
                ],
              ),

              //search bar
              Container(
                width: size.width * 0.52,
                height: size.width * 0.048,
                decoration: ShapeDecoration(
                  color: const Color(0xFFD9D9D9),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(size.width * 0.0183),
                  ),
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: TextField(
                      style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontSize: size.width * 0.018,
                        fontWeight: FontWeight.w400,
                      ),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Image.asset(
                            'assets/🦆 icon _search_.png',
                            // height: 5,
                          ),
                        ),
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: size.width * 0.02,
                          vertical: size.width * 0.0183,
                        ),
                        hintText: 'Search location...',
                        hintStyle: GoogleFonts.poppins(
                          color: Colors.black,
                          fontSize: size.width * 0.022,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: size.width,
                height: size.width * 0.3257,
                child: PageView(
                  controller: pageController,
                  scrollDirection: Axis.horizontal,
                  children: [
                    WeatherCard(size: size),
                    WeatherCard(size: size),
                    WeatherCard(size: size),
                  ],
                ),

                //time weather data
              ),
              const Row(
                children: [],
              )
            ],
          )
        ],
      ),
    );
  }
}

class TempUnitSwitch extends StatefulWidget {
  TempUnitSwitch({this.tempUnit = TempUnit.celsius, super.key});
  TempUnit tempUnit;

  @override
  State<TempUnitSwitch> createState() => _TempUnitSwitchState();
}

class _TempUnitSwitchState extends State<TempUnitSwitch> {
  @override
  Widget build(BuildContext context) {
    return AnimatedToggleSwitch<TempUnit>.dual(
      current: widget.tempUnit,
      first: TempUnit.fahrenheit,
      second: TempUnit.celsius,
      dif: 1.0,
      borderColor: Colors.transparent,
      borderWidth: 5.0,
      height: 30,
      boxShadow: const [
        BoxShadow(
          color: Colors.black26,
          spreadRadius: 1,
          blurRadius: 2,
          offset: Offset(0, 1.5),
        ),
      ],
      onChanged: (b) {
        setState(() => widget.tempUnit = b);
        // return Future.delayed(const Duration(seconds: 1));
      },
      colorBuilder: (b) => b == TempUnit.celsius ? Colors.blue : Colors.green,
      iconBuilder: (value) => value == TempUnit.celsius
          ? SvgPicture.asset(
              'assets/°C.svg',
              height: 10,
              width: 18,
            )
          : SvgPicture.asset(
              'assets/°F.svg',
              height: 10,
              width: 18,
            ),
      textBuilder: (value) => value == TempUnit.celsius
          ? const Center(
              child: Text(
                '°F',
                style: TextStyle(color: Colors.black, fontSize: 12),
              ),
            )
          : const Center(child: Text('°C')),
    );
  }
}

class WeatherCard extends StatelessWidget {
  const WeatherCard({required this.size, super.key});
  final Size size;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: size.width * 0.03),
        // width: 817,
        // height: 425,
        decoration: ShapeDecoration(
          gradient: const LinearGradient(
            begin: Alignment(-0.9, 0),
            end: Alignment(0.5, 0.8),
            colors: [Color(0xFFAD36CB), Color(0xFF323233)],
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(size.width * 0.02343),
          ),
          shadows: [
            BoxShadow(
              color: const Color(0x3F000000),
              blurRadius: size.width * 0.003,
              offset: Offset(0, size.width * 0.003),
              spreadRadius: 0,
            ),
            BoxShadow(
              color: const Color(0x3FFFF9F9),
              blurRadius: size.width * 0.003,
              offset: Offset(0, size.width * 0.003),
              spreadRadius: 0,
            ),
            BoxShadow(
              color: const Color(0x3FFCF5F5),
              blurRadius: size.width * 0.003,
              offset: Offset(0, size.width * 0.003),
              spreadRadius: 0,
            )
          ],
        ),

        child: Column(
          children: [
            Row(
              children: [
                Text(
                  "London",
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: size.width * 0.03,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const Icon(Icons.location_on_outlined,
                    color: Colors.white, size: 20),
              ],
            ),
            Row(
              children: [
                Image.asset('assets/🦆 icon _temperature_.png'),
                Text(
                  '27°C',
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: size.width * 0.02,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Image.asset('assets/Cloud2.png'),
              ],
            ),
            Row(
              children: [
                Text(
                  'Aug 23, Tue',
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: size.width * 0.015,
                    fontWeight: FontWeight.w400,
                    decoration: TextDecoration.underline,
                    decorationColor: Colors.white,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

enum TempUnit { celsius, fahrenheit }
