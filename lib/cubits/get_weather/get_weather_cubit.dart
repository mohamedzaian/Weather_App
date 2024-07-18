import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:weather_app/services/weather_service.dart';

import '../../models/weather_model.dart';

part 'get_weather_state.dart';

class GetWeatherCubit extends Cubit<GetWeatherState> {
  GetWeatherCubit() : super(GetWeatherInitial());
    WeatherModel? weatherModel;
  void getWeather (String cityName) async
  {
    try {
      emit(GetWeatherLoading());
      weatherModel =  await WeatherService().getWeather(cityName);
      emit(GetWeatherSucces(weatherModel:weatherModel! ));
    } on Exception catch (e) {
  emit(GetWeatherFail(message: e.toString()));
    }



  }

}
