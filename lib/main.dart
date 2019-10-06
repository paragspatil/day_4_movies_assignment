import 'package:day_4_movies_assignment/movies.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'movies.dart';
import 'dart:io';
import 'package:carousel_slider/carousel_slider.dart';

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
List imglist(List img){
  List imglist = [];
  for(i=0;i<30;i++) {
    Map m = map[i];
    imglist.add(m['poster']);
  }
  return imglist;
}
// Convert the string to List of maps using jsonDecode and then use it

// Create a stateful widget called MoviesPage here
class Moviepage extends StatefulWidget {
  @override
  _MoviepageState createState() => _MoviepageState();
}

class _MoviepageState extends State<Moviepage> {
  @override

  List temp =imglist(map);







  Widget build(BuildContext context) {

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
                child: CarouselSlider(
                  height: 400.0,
                  items: temp.map((i) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.symmetric(horizontal: 5.0),
                            decoration: BoxDecoration(
                                color: Colors.amber
                            ),
                            child: Image.network(
                                 i,
                              fit: BoxFit.fill,
                            ),
                        );
                      },
                    );
                  }).toList(),
                )


            ),

          ],





      ),

    );
  }
}


