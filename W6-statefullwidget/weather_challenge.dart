import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(200),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Season',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                WeatherCard(countryname: 'Cambodia', seasons: Season.autumn),
                WeatherCard(countryname: 'France', seasons: Season.winter),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class WeatherCard extends StatefulWidget {
  final String countryname;
  final Season seasons;
  const WeatherCard({
    super.key,
    required this.countryname,
    required this.seasons,
  });

  @override
  State<WeatherCard> createState() => _WeatherCardState();
}

enum Season {
  winter(path: 'assets/images/weathers/winter.jpg'),
  spring(path: 'assets/images/weathers/spring.jpg'),
  summer(path: 'assets/images/weathers/summer.jpg'),
  autumn(path: 'assets/images/weathers/autumn.jpg');  

  final String path;
  const Season({required this.path});
}

class _WeatherCardState extends State<WeatherCard> {
  late Season currentseason;

  @override
  void initState() {
    super.initState();
    currentseason = widget.seasons;
  }

  void changeseason() {
    setState(() {
      int nextIndex = (currentseason.index + 1) % Season.values.length;
      currentseason = Season.values[nextIndex];
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: changeseason,
      child: Card(
        elevation: 6,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              currentseason.path,
              height: 200,
              width: 150,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 10),
            Text(
              widget.countryname,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
