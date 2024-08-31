import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_model.dart';

class Weatherservice {
  // create object from Dio() to use in methodes
  final Dio dio;
  // if i define many methods i have to create baseUrl that fixed in them to be easy modifing it
  // Any value able to change , make variable for it
  final String baseUrl = 'https://api.weatherapi.com/v1';
  final String apiKey = '511bed2d19594757a24161313241908';
  Weatherservice(this.dio);
  Future<WeatherModel> getsCurrentWeather({required String cityname}) async {
    try {
      Response response = await dio
          .get('$baseUrl/forecast.json?key=$apiKey&q=$cityname&days=1');

      WeatherModel weatherModel = WeatherModel.fromjson(response.data);
      return weatherModel;
    } on DioException catch (e) {
      final String errexeption = e.response?.data['error']['message'] ??
          "There was an error , Try later ..";
      throw Exception(errexeption);
    } catch (e) {
      log(e.toString());
      throw Exception('Oop there was an error , Try later');
    }
  }
}
