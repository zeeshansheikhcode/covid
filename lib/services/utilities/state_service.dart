import 'dart:convert';
import 'package:covid_app/services/utilities/app_url.dart';
import 'package:http/http.dart' as http;
import '../../Model/world_state_model.dart';

class StateServices
{
  WorldStateModel? worldlist ;
  Future<WorldStateModel> fetchWorldStates() async
  {
    final response = await http.get(Uri.parse(AppUrl.worldStates));
    if(response.statusCode == 200)
      {
        var data = jsonDecode(response.body.toString());
        worldlist = WorldStateModel.fromJson(data);
         return WorldStateModel.fromJson(data);
      }
    else
      {
        throw Exception('Error');
      }
  }

   Future<List<dynamic>> fetchCountries() async
  {
    final response = await http.get(Uri.parse(AppUrl.countriesList));
    if(response.statusCode == 200)
      {
        var data = jsonDecode(response.body.toString());
         return data;
      }
    else
      {
        throw Exception('Error');
      }
  }
}