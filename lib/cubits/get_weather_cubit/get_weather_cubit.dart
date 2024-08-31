import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/models/weather_model.dart';
import '../../services/weather_services.dart';

class GetWeatherCubit extends Cubit<WeatherState> {
  //the first state  , that run before cubit work
  //in this program the screen have no weather.
  GetWeatherCubit() : super(WeatherInitialState());
  WeatherModel? weatherModel;
  getWeather({required String cityname}) async {
    try {
      weatherModel =
          await Weatherservice(Dio()).getsCurrentWeather(cityname: cityname);
      emit(WeatherLoadedState(weatherModel!));
    } catch (e) {
      emit(WeatherFalureState());
    }
  }
}
