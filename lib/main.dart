import 'dart:async'; // Add this import
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

void main() {
  runApp(RotatingPictureFrameApp());
}

class RotatingPictureFrameApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PictureFrameScreen(),
    );
  }
}

class PictureFrameScreen extends StatefulWidget {
  @override
  _PictureFrameScreenState createState() => _PictureFrameScreenState();
}

class _PictureFrameScreenState extends State<PictureFrameScreen> {
  final List<String> imageUrls = [
    'https://th.bing.com/th/id/OIP.gFI6m9EsNQ7G9a6xYbsQjgHaE8?rs=1&pid=ImgDetMain',
    'https://th.bing.com/th/id/OIP.q1lpystVE8LWVE0p_gxvxAHaE0?w=263&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7',
    'https://th.bing.com/th/id/R.e83d0e89565dd6c9bc3f44b8619e082e?rik=DaNpu2nJ7DF59A&pid=ImgRaw&r=0',
    'https://th.bing.com/th/id/OIP.aUqf65MSOdYYaqpDJA1VQAHaE5?rs=1&pid=ImgDetMain',


  ];

  int currentIndex = 0;
  late Timer _timer;
  bool _isPaused = false;

  @override
  void initState() {
    super.initState();
    _startImageRotation();
  }

  void _startImageRotation() {
    _timer = Timer.periodic(Duration(seconds: 10), (timer) {
      if (!_isPaused) {
        setState(() {
          currentIndex = (currentIndex + 1) % imageUrls.length;
        });
      }
    });
  }

  void _pauseRotation() {
    setState(() {
      _isPaused = true;
    });
  }

  void _resumeRotation() {
    setState(() {
      _isPaused = false;
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Rotating Picture Frame')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 4),
                borderRadius: BorderRadius.circular(10),
              ),
              child: CachedNetworkImage(
                imageUrl: imageUrls[currentIndex],
                width: 300,
                height: 300,
                fit: BoxFit.cover,
                placeholder: (context, url) => CircularProgressIndicator(),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _isPaused ? _resumeRotation : _pauseRotation,
              child: Text(_isPaused ? 'Resume' : 'Pause'),
            ),
          ],
        ),
      ),
    );
  }
}
