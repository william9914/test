import 'dart:convert';

import 'package:http/http.dart';
import 'package:test_app/model/football_model.dart';

class FootballApi {

  // final String apiUrl = "https://v3.football.api-sports.io/fixtures?season=2020&league=39";
  static const headers = {
    'x-rapidapi-host': "v3.football.api-sports.io",
    'x-apisports-key': "e2dc6bbcf93ec9ae2d94250f9708c125"
  };

  Future<List<FootballMatch>> getAllMatches() async {
    Response response = await get(Uri.parse("https://v3.football.api-sports.io/fixtures?season=2020&league=39"), headers: headers);
    var body;

    if(response.statusCode == 200){
      body = jsonDecode(response.body);
      List<dynamic> matchesList = body['response'];
      print("Api Service: ${body}");
      List<FootballMatch> matches = matchesList.map((dynamic item) => FootballMatch.fromJson(item)).toList();

      return matches;
    }
  }

}
