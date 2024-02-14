import 'package:flutter/material.dart';

class CustomAlbumScreen extends StatefulWidget {
  static String get routeName => "customAlbum";
  static String get routeLocation => "/customAlbum";

  const CustomAlbumScreen({super.key});

  @override
  State<CustomAlbumScreen> createState() => _CustomAlbumScreenState();
}

class _CustomAlbumScreenState extends State<CustomAlbumScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 100,
          height: 100,
          color: Colors.red,
        ),
      ),
    );
  }
}
