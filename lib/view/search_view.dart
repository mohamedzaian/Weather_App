
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather/get_weather_cubit.dart';
import 'package:weather_app/main.dart';
import 'package:weather_app/widgets/weather_info_body.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.arrow_back),
        onPressed: ()
          {
            Navigator.pop(context);
          },),
      title: Text("Search a City")
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: TextField(
            onSubmitted:(value)async
            {
              context.read<GetWeatherCubit>().getWeather(value);
            Navigator.pop(context);
            },
            decoration: InputDecoration(



              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                  color: getThemeColor(weatherModel?.wearthCondition)
                )

              ),


              suffixIcon: IconButton(icon: Icon(Icons.search),onPressed: ()
                {

                },),
              labelText: "Search",
              hintText: 'Enter a city name',
            ),
          ),
        ),
      ),
    );
  }
}
