import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search City'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Center(
          child: TextField(
            //used when you want data when it changed like add character or remove it.
            //onChanged: (value) {(value);},
            //used when you want to recive data just one time..
            onSubmitted: (String value) async {
              // this line to get object from GetweatherCubit
              var getweathercubit = BlocProvider.of<GetWeatherCubit>(context);
              //pass city name to get data
              getweathercubit.getWeather(cityname: value);
              Navigator.pop(context);
            },
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 32,
              ),
              //text on the border
              labelText: 'Search',
              hintText: 'Enter Search name',
              suffixIcon: Icon(Icons.search),
              //editing the border
              border: OutlineInputBorder(
                //borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(color: Colors.green),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
