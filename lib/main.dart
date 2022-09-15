import 'package:flutter/material.dart';
import 'package:tmdb_api/tmdb_api.dart';

void main() {
  runApp(const MyApp());
}
/*
Can also do:
void main()=>runApp(new MyApp());
 */

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
      // debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.dark,
      primaryColor: Colors.green),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List trendingMovies = [];
  String apikey = '1484f0866973ccbe826f4e0affeba856';
  final readAccessToken = 'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIxNDg0ZjA4NjY5NzNjY2JlODI2ZjRlMGFmZmViYTg1NiIsInN1YiI6IjYzMWU5ZDEwY2U5ZTkxMDA3Y2NmOGM0MiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.4NY7pBHaYlyGt0nr5I4eZcCKyKifaV6USNOrp70yef8';

  @override
  void initState() {
    loadMovies();
    super.initState();
  }

  loadMovies() async {
    TMDB tmdbWithCustomLogs = TMDB(ApiKeys(apikey, readAccessToken),
        logConfig: ConfigLogger(
          showLogs: true,
          showErrorLogs: true));

    Map trendingresult = await tmdbWithCustomLogs.v3.trending.getTrending();
    // print(trendingresult);
    trendingMovies = trendingresult['results'];
    // setState((){
    //   trendingMovies = trendingresult['results'];
    // });
    print(trendingMovies);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Flutter Movie App'),),
    );
  }
}

