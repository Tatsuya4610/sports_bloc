import 'package:flutter_bloc_first/model/model_league.dart';
import 'package:flutter_bloc_first/model/model_sport.dart';
import 'package:flutter_bloc_first/model/model_team.dart';
import 'package:http/http.dart' as http;
import 'dart:convert'show json;
class SportsDBApi {
  final _baseUrl = "https://www.thesportsdb.com/api/v1/json/1/";
  String _allSports() => _baseUrl + "all_sports.php";
  String _allLeagues(String name) => _baseUrl + 'search_all_leagues.php?s=' + name;
  String _allTeamFromLeague(String id) => _baseUrl + 'lookup_all_teams.php?id=' + id;

  Future<List<dynamic>> request(String urlString, String key) async {
    final result = await http.get(urlString);
    final body = json.decode(result.body);
    return body[key];
  }

  Future<List<Sport>> fetchSports() async { //fetchSportsで課程をコメント記入済み。
    final List<dynamic> list = await request(_allSports(), "sports");
    return list.map((json) => Sport.fromJson(json)).toList();  //sportsのIDやnameや画像のリストデーター。
  }

  Future<List<League>> fetchLeagues(String name) async {
    final List<dynamic> list = await request(_allLeagues(name), "countrys");
    return list.map((json) => League.fromJson(json)).toList();
  }

  Future<List<Team>> fetchTeams(String id) async {
    final List<dynamic> list = await request(_allTeamFromLeague(id), "teams");
    return list.map((json) => Team.fromJson(json)).toList();
  }

}