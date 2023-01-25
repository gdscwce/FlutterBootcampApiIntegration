import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(MoviesApp());

//REPLACE: Replace YOUR_API_KEY with your API key
final apiKey = "YOUR_API_KEY";

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
  //Variable to hold movies information
  var movies;

  //NOTE: Method to make http requests
  static dynamic getJson() async {
    //URL to fetch movies information
    final apiEndPoint =
        "http://api.themoviedb.org/3/discover/movie?api_key=${apiKey}&sort_by=popularity.desc";
    final apiResponse = await http.get(apiEndPoint);
    //'Instance of Response'
    return apiResponse;
  }

  //Method to fetch movies from network
  fetchMovies() async {
    //Getting json
    var data = await getJson();

    setState(() {
      movies = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    //Fetch movies
    fetchMovies();

    return Scaffold(
      //SingleChildScrollView to provide scrolling for flexible data rendering
      body: SingleChildScrollView(
        //Print API response on screen.
        //RESULT: At this point only text 'instance of Response' will be printed
        child: movies != null
            ? Text("TMDB Api response\n $movies")
            : Text("Loading api response"),
      ),
    );
  }
}
