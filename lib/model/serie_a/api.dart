import 'dart:convert';

import 'package:http/http.dart';
import 'package:test_app/model/serie_a/football_model.dart';

class FootballApi {

  final String apiUrl = "https://v3.football.api-sports.io/fixtures?season=2021&league=135&last=39";
  static const headers = {
    'x-rapidapi-host': "v3.football.api-sports.io",
    'x-apisports-key': "52812cec6b4b33a0088fd9a9d7203e00"
  };

  Future<List<FootballMatchs>> getAllMatches() async {
    Response response = await get(Uri.parse(apiUrl), headers: headers);
    var body;

    if(response.statusCode == 200){
      body = jsonDecode(response.body);
      List<dynamic> matchesList = body['response'];
      print("Api Service: ${body}");
      List<FootballMatchs> matches = matchesList.map((dynamic item) => FootballMatchs.fromJson(item)).toList();

      return matches;
    }
  }

}
