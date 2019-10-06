import 'package:day_4_movies_assignment/movies.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'movies.dart';
import 'dart:io';

void main() {
  runApp(
      MaterialApp(
    home: Moviepage(),
  )
  );
}

// You are given json string of movies list (see file movies.dart)
String moviesList = MoviesList.moviesJsonList;
List map = jsonDecode(moviesList);
int i = 0;
// Convert the string to List of maps using jsonDecode and then use it

// Create a stateful widget called MoviesPage here
class Moviepage extends StatefulWidget {
  @override
  _MoviepageState createState() => _MoviepageState();
}

class _MoviepageState extends State<Moviepage> {
  @override



  void nextmovie() {
    setState(() {
      i = i+1;

      print(i);
    });
  }





  Widget build(BuildContext context) {
    Map p =map[i];
    String j = p['poster'];
    return  Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        centerTitle: true,
        title: Text(
            'Movie Poster',
         style: TextStyle(
           color: Colors.black,

         ),
        ),

      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
                margin: EdgeInsets.fromLTRB(50, 0, 0, 50),
                height: 400,
                width: 300,


                child: Image.network('$j')


            ),
            Container(
              margin: EdgeInsets.fromLTRB(100, 50, 25, 0),
              height: 30,
              width: 150,
              color: Colors.yellow,
              child: FlatButton(
                child: Text(
                  'Next Movie',
                  style: TextStyle(
                    color: Colors.black,

                  ),
                ),
            onPressed: () {
                  nextmovie();
            },
              ),
            ),

          ],





      ),

    );
  }
}


