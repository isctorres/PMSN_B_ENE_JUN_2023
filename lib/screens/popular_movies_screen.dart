import 'package:flutter/material.dart';
import 'package:pmsnb1/models/popular_model.dart';
import 'package:pmsnb1/network/api_popular.dart';
import 'package:pmsnb1/widgets/item_popular_movie.dart';

class PopularMoviesScreen extends StatefulWidget {
  const PopularMoviesScreen({super.key});

  @override
  State<PopularMoviesScreen> createState() => _PopularMoviesScreenState();
}

class _PopularMoviesScreenState extends State<PopularMoviesScreen> {

  ApiPopular? apiPopular;

  @override
  void initState() {
    super.initState();
    apiPopular = ApiPopular();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: apiPopular!.getAllPopular(),
        builder: (context, AsyncSnapshot<List<PopularModel>?> snapshot) {
          return GridView.builder(
            padding: const EdgeInsets.all(10),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: .8,
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10
            ),
            itemBuilder: (context, index) {
              if( snapshot.hasData ){
                return ItemPopularMovie(popularModel: snapshot.data![index]);
              }else if( snapshot.hasError ){
                return const Center(child: Text('Algo salio mal :()'),);
              }else{
                return const CircularProgressIndicator();
              }
            },
            itemCount: snapshot.data != null ? snapshot.data!.length : 0,
          );
        },
      ),
    );
  }
}