import 'dart:convert';

import 'package:flutter/material.dart';


void main() => runApp(MoviesApp());

class MoviesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MoviesListing(),
    );
  }
}

class MoviesListing extends StatefulWidget {
  @override
  _MoviesListingState createState() => _MoviesListingState();
}

class _MoviesListingState extends State<MoviesListing> {
  

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: Text("Let's get started"),
      ),
    );
  }
}
