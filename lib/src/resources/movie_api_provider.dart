import 'dart:async';
import 'package:http/http.dart' show Client;
import 'package:movies_apps/src/models/trailer_model.dart';
import 'dart:convert';
import '../models/item_model.dart';

class MovieApiProvider {
  Client client = Client();
  final _apiKey = '7f0abe452a1fa589837918e54e91514e';
  final _baseUrl = "http://api.themoviedb.org/3/movie";

  Future<ItemModel> fetchMovieList() async {
    print("entered");
    final response = await client.get(Uri.parse(
        'http://api.themoviedb.org/3/movie/popular?api_key=$_apiKey'));
    print(response.body.toString());
    if (response.statusCode == 200) {
      return ItemModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load post');
    }
  }
  Future<TrailerModel> fetchTrailer(int movieId) async{
    final response = await client.get(Uri.parse("$_baseUrl/$movieId/videos?api_key=$_apiKey"));
    if(response.statusCode == 200){
      return TrailerModel.fromJson(json.decode(response.body));
    }else{
      throw Exception('Failed to load trailers');
    }
  }
}
