import 'package:flutter/material.dart';

class TrendingMovies extends StatelessWidget {
  final List trending;

  const TrendingMovies({Key? key, required this.trending}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Trending Movies", style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),),
          ],
        ),
    );
  }
}
