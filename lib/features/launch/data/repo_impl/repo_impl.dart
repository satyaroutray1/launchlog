import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:launchlog/core/constants.dart';
import 'package:launchlog/features/launch/data/model/launches_model.dart';
import 'package:launchlog/features/launch/domain/repo/repo.dart';

class LaunchRepoImpl extends LaunchRepo {

  http.Client client = http.Client();
  LaunchRepoImpl({required this.client});

  @override
  Future<List<LaunchModel>> fetchData() async{
    final response = await client.get(Uri.parse(Constants.allLaunchesUrl));
    if(response.statusCode == 200) {
      //final a = json.decode(response.body);
      return (json.decode(response.body) as List).map((json) =>
          LaunchModel.fromJson(json)).toList();
    }
    throw Exception(HttpStatus);
  }

}