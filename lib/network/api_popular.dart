import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pmsnb1/models/popular_model.dart';

class ApiPopular {
  
  final URL = "https://api.themoviedb.org/3/movie/popular?api_key=5019e68de7bc112f4e4337a500b96c56&language=es-MX&page=1";

  Future<List<PopularModel>?> getAllPopular() async {
    final response = await http.get(Uri.parse(URL));
    if( response.statusCode == 200 ){
      var popular = jsonDecode(response.body)['results'] as List;
      var listPopular = popular.map((video) => PopularModel.fromMap(video)).toList();
      return listPopular;
    }
    return null;
  }


}