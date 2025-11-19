import 'package:flutter/material.dart';

List<String> images = [
  "assets/images/w4-s2/bird.jpg",
  "assets/images/w4-s2/bird2.jpg",
  "assets/images/w4-s2/insect.jpg",
  "assets/images/w4-s2/girl.jpg",
  "assets/images/w4-s2/man.jpg",
];

void main() => runApp(
  MaterialApp(
    debugShowCheckedModeBanner: false, // Why this line ? Can you explain it ?
    //the line is to hide the little debug banner
    home: ImageViewer(),
  ),
);

class ImageViewer extends StatefulWidget {
  const ImageViewer({super.key});

  @override
  State<ImageViewer> createState() => _ImageViewerState();
}

class _ImageViewerState extends State<ImageViewer> {
  int index = 0;

  void nextImage() {
    setState(() {
      index = (index + 1) % images.length;
    });
  }

  void previousImage() {
    setState(() {
      index = (index - 1) % images.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[50],
      appBar: AppBar(
        backgroundColor: Colors.green[400],
        title: const Text("Image Viewer"),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.navigate_before),
            tooltip: 'Go to the previous image',
            onPressed: previousImage,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 50, 0),
            child: IconButton(
              icon: const Icon(Icons.navigate_next),
              tooltip: "Go to the next image",
              onPressed: nextImage,
            ),
          ),
        ],
      ),
      body: Image.asset(images[index]),
    );
  }
}
