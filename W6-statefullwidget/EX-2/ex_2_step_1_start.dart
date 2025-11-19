import 'package:flutter/material.dart';

void main() =>
    runApp(const MaterialApp(debugShowCheckedModeBanner: false, home: MyApp()));

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Favorite Card"),
      ),
      body: Column(
        children: [FavouriteCard(), FavouriteCard(), FavouriteCard()],
      ),
    );
  }
}

class FavouriteCard extends StatefulWidget {
  const FavouriteCard({super.key});

  @override
  State<FavouriteCard> createState() => _FavouriteCardState();
}

class _FavouriteCardState extends State<FavouriteCard> {
  bool isFavourite = false;

    IconData get favouriteIcon =>
      isFavourite ? Icons.favorite : Icons.favorite_border;

    Color get iconColor => 
      isFavourite ? Colors.red : Colors.grey;

  void onFavourite() {
    setState(() {
      isFavourite = !isFavourite;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(width: .5, color: Colors.grey)),
      ),
      padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            flex: 7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "title",
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                SizedBox(height: 10),
                Text("description"),
              ],
            ),
          ),
          IconButton(
            onPressed: onFavourite,
            icon: Icon(favouriteIcon),
            color: iconColor,
          ),
        ],
      ),
    );
  }
}
