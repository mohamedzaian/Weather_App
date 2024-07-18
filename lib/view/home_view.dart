import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather/get_weather_cubit.dart';
import 'package:weather_app/view/search_view.dart';
import 'package:weather_app/widgets/weather_info_body.dart';

import '../widgets/noweather_body.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Weather App'),
          actions: [
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return SearchView();
                }));
              },
            ),
          ]),
      body: BlocConsumer<GetWeatherCubit, GetWeatherState>(
        listener: (context, state) {
        if (state is GetWeatherFail)
          {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message),
              backgroundColor: Colors.red,
            duration: Duration(seconds: 1),)

            );
          }
        },
        builder: (context, state) {
          if (state is GetWeatherLoading)
            {
              return Center(child: CircularProgressIndicator());
            }
          if (state is GetWeatherSucces)
            {
              return WeatherInfoBody();
            }
          return NoWeatherBody();


        },
      ),
    );
  }
}
