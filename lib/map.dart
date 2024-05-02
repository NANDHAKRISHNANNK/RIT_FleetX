import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MapPage extends StatelessWidget {
  final double latitude = 13.037862; // Specify your latitude here
  final double longitude = 440.044913; // Specify your longitude here

  void _openMaps() async {
    final url = 'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Google Maps Example'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: _openMaps,
          child: Text('Open Google Maps'),
        ),
      ),
    );
  }
}
