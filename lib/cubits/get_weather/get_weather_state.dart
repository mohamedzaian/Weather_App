part of 'get_weather_cubit.dart';

@immutable
abstract class GetWeatherState {}

class GetWeatherInitial extends GetWeatherState {}
class GetWeatherLoading extends GetWeatherState {}
class GetWeatherSucces extends GetWeatherState {
  final WeatherModel weatherModel;

  GetWeatherSucces({required this.weatherModel});


}
class GetWeatherFail extends GetWeatherState {
  final String message;

  GetWeatherFail({required this.message});
}
