import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weatherme_website/model.dart';

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
          Positioned(
            top: size.width * 0.004,
            left: size.width * 0.004,
            child: Image.asset(
              'assets/cloud and sun.png',
              height: size.width * 0.06,
            ),
          ),

          SingleChildScrollView(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 18),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(width: size.width * 0.03),
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
                      SizedBox(width: size.width * 0.05),
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
                          SizedBox(width: size.width * 0.03),
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
                          SizedBox(width: size.width * 0.03),
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
                          // SizedBox(width: size.width * 0.03),
                        ],
                      )
                    ],
                  ),
                ),

                //unit switch
                Row(
                  children: [
                    TempUnitSwitch(),
                  ],
                ),
                SizedBox(height: size.width * 0.03),
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
                      padding: EdgeInsets.symmetric(
                        horizontal: size.width * 0.01,
                      ),
                      child: TextField(
                        style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontSize: size.width * 0.018,
                          fontWeight: FontWeight.w400,
                        ),
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                          prefixIcon: Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: size.width * 0.01,
                              horizontal: size.width * 0.015,
                            ),
                            child: Image.asset(
                              'assets/🦆 icon _search_.png',
                              // height: 1,
                              // width: size.width * 0.0007,
                            ),
                          ),
                          contentPadding: EdgeInsets.only(
                            left: size.width * 0.02,
                            right: size.width * 0.02,
                            // top: size.width * 0.0183,
                            bottom: size.width * 0.0183,
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

                //weather card
                SizedBox(height: size.width * 0.03),

                SizedBox(
                  width: size.width,
                  height: size.width * 0.3257,
                  child: PageView(
                    controller: pageController,
                    scrollDirection: Axis.horizontal,
                    children: [
                      WeatherCard(
                        pageController: pageController,
                        size: size,
                        weather: Weather(
                          city: 'New York',
                          temperature: 27,
                          humidity: 99,
                          windSpeed: 2,
                          visibility: 8,
                          airPressure: 1005,
                        ),
                        gradientColors: const [
                          Color.fromARGB(255, 39, 68, 59),
                          Color(0xff0F8894),
                        ],
                      ),
                      WeatherCard(
                        size: size,
                        weather: Weather(
                          city: 'New York',
                          temperature: 27,
                          humidity: 99,
                          windSpeed: 2,
                          visibility: 8,
                          airPressure: 1005,
                        ),
                        pageController: pageController,
                      ),
                      WeatherCard(
                        pageController: pageController,
                        size: size,
                        weather: Weather(
                          city: 'New York',
                          temperature: 27,
                          humidity: 99,
                          windSpeed: 2,
                          visibility: 8,
                          airPressure: 1005,
                        ),
                        gradientColors: const [
                          Color.fromARGB(255, 64, 68, 39),
                          Color(0xff270F94),
                        ],
                      ),
                    ],
                  ),
                ),

                SizedBox(height: size.width * 0.03),
                //time weather data
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TimeWeatherCard(
                      icon: 'assets/cloud and rain.png',
                      time: '19:00 pm',
                      temperature: '29°',
                    ),
                    TimeWeatherCard(
                      icon: 'assets/cloud and rain.png',
                      time: '21:00 pm',
                      temperature: '27°',
                    ),
                    TimeWeatherCard(
                      icon: 'assets/Cloud2.png',
                      time: '23:00 pm',
                      temperature: '27°',
                    ),
                    TimeWeatherCard(
                      icon: 'assets/cloud and light.png',
                      time: '1:00 am',
                      temperature: '26°',
                    ),
                    TimeWeatherCard(
                      icon: 'assets/cloud and storm.png',
                      time: '3:00 am',
                      temperature: '29°',
                    ),
                    TimeWeatherCard(
                      icon: 'assets/cloud and storm.png',
                      time: '5:00 am',
                      temperature: '31°',
                    ),
                    TimeWeatherCard(
                      icon: 'assets/cloud and sun.png',
                      time: '7:00 am',
                      temperature: '27°',
                    ),
                  ],
                )
              ],
            ),
          ),

          ///page view buttons: this is the button that changes the page view. Use if you want it to be stacked on the entire screen

          // Positioned(
          //   top: size.width * 0.42,
          //   left: size.width * 0.13,
          //   child: IconButton(
          //     onPressed: () {
          //       pageController.previousPage(
          //         duration: const Duration(milliseconds: 500),
          //         curve: Curves.easeInOut,
          //       );
          //     },
          //     icon: Icon(
          //       Icons.arrow_back_ios_new_outlined,
          //       color: Colors.black,
          //       size: size.width * 0.055,
          //     ),
          //   ),
          // ),
          // Positioned(
          //   top: size.width * 0.42,
          //   right: size.width * 0.13,
          //   child: IconButton(
          //     onPressed: () {
          //       pageController.nextPage(
          //         duration: const Duration(milliseconds: 500),
          //         curve: Curves.easeInOut,
          //       );
          //     },
          //     icon: Icon(
          //       Icons.arrow_forward_ios_rounded,
          //       color: Colors.black,
          //       size: size.width * 0.055,
          //     ),
          //   ),
          // ),
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
      colorBuilder: (b) => b == TempUnit.celsius
          ? const Color.fromARGB(255, 1, 47, 84)
          : const Color.fromARGB(255, 0, 51, 2),
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
  const WeatherCard({
    required this.size,
    required this.weather,
    required this.pageController,
    this.gradientColors = const [Color(0xFFAD36CB), Color(0xFF323233)],
    super.key,
  });
  final Size size;
  final Weather weather;
  final PageController pageController;
  final List<Color> gradientColors;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10),
        child: Stack(
          children: [
            Positioned.fill(
              child: Container(
                padding: EdgeInsets.only(
                  top: size.width * 0.02,
                  bottom: size.width * 0.01,
                  right: size.width * 0.015,
                  left: size.width * 0.015,
                ),
                margin: EdgeInsets.symmetric(horizontal: size.width * 0.03),
                // width: 817,
                // height: 425,
                decoration: ShapeDecoration(
                  gradient: LinearGradient(
                    begin: const Alignment(-0.9, 0),
                    end: const Alignment(0.5, 0.8),
                    colors: gradientColors,
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Text(
                          weather.city,
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: size.width * 0.022,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        Icon(
                          Icons.location_on_outlined,
                          color: Colors.white,
                          size: size.width * 0.022,
                          weight: 0.1,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/🦆 icon _temperature_.png',
                              height: size.width * 0.0457,
                            ),
                            SizedBox(width: size.width * 0.02),
                            Text(
                              '${weather.temperature.toInt()}°C',
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: size.width * 0.0512,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            SizedBox(width: size.width * 0.015),
                            Image.asset(
                              'assets/Cloud2.png',
                              height: size.width * 0.05,
                            ),
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
                        ),
                      ],
                    ),
                    // SizedBox(height: size.width * 0.0001),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            Text(
                              'HUMIDITY',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: size.width * 0.0146,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              '${weather.humidity}%',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: size.width * 0.0161,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              'VISIBILITY',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: size.width * 0.0146,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              '${weather.visibility}km',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: size.width * 0.0161,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              'AIR PRESSURE',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: size.width * 0.0146,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              '${weather.airPressure}hPa',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: size.width * 0.0161,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              'Wind',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: size.width * 0.0146,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              '${weather.windSpeed.toInt()}mph',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: size.width * 0.0161,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )

            //trying this: the weather card control buttons are stack on each card
            ,
            Positioned(
              top: size.width * 0.1,
              left: size.width * 0.02,
              child: IconButton(
                onPressed: () {
                  pageController.previousPage(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                  );
                },
                icon: Icon(
                  Icons.arrow_back_ios_new_outlined,
                  color: Colors.black,
                  size: size.width * 0.045,
                ),
              ),
            ),
            Positioned(
              top: size.width * 0.1,
              right: size.width * 0.02,
              child: IconButton(
                onPressed: () {
                  pageController.nextPage(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                  );
                },
                icon: Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: Colors.black,
                  size: size.width * 0.045,
                ),
              ),
            ),
          ],
        ));
  }
}

class TimeWeatherCard extends StatelessWidget {
  const TimeWeatherCard({
    required this.time,
    required this.icon,
    required this.temperature,
    this.iconSize = 0.05,
    super.key,
  });
  final String time;
  final String icon;
  final String temperature;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.width * 0.1,
      child: Stack(
        // alignment: Alignment.center,
        children: [
          Container(
            width: size.width * 0.0886,
            height: size.width * 0.0886,
            decoration: ShapeDecoration(
              gradient: const LinearGradient(
                begin: Alignment(0.00, -1.00),
                end: Alignment(0, 1),
                colors: [Color(0xFFB32DD4), Color(0x00D9D9D9)],
              ),
              shape: RoundedRectangleBorder(
                side: const BorderSide(width: 0.50),
                borderRadius: BorderRadius.circular(
                  size.width * 0.0183,
                ),
              ),
            ),
          ),
          Positioned(
            top: size.width * 0.0432,
            // bottom: (size.width * 0.00952),
            child: Container(
              width: size.width * 0.0886,
              height: size.width * 0.0527,
              decoration: ShapeDecoration(
                gradient: const LinearGradient(
                  begin: Alignment(-0.96, 0.30),
                  end: Alignment(0.96, -0.3),
                  colors: [Color(0xFF373232), Color.fromARGB(98, 55, 50, 50)],
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    size.width * 0.0183,
                  ),
                ),
                shadows: const [
                  BoxShadow(
                    color: Color.fromARGB(62, 0, 0, 0),
                    blurRadius: 0,
                    offset: Offset(1, 2),
                    spreadRadius: 0,
                  )
                ],
              ),
            ),
          ),
          Positioned(
            top: size.width * 0.023,
            left: 0,
            right: 0,
            child: Image.asset(icon, height: size.width * 0.05),
          ),
          Positioned(
            top: size.width * 0.01,
            left: 0,
            right: 0,
            child: Center(
              child: Text(
                time,
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: size.width * 0.0124,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: size.width * 0.074,
            // left: size.width * 0.018,
            // right: ,
            child: Center(
              child: Text(
                temperature,
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: size.width * 0.0154,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

enum TempUnit { celsius, fahrenheit }
