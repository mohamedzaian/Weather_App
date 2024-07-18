
import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherService{
  final Dio dio = Dio();
  final String apiKey = '737c375dc51849d1bf1170609241407';
  final String baseUrl = 'http://api.weatherapi.com';
  Future<WeatherModel> getWeather (
      String city, 

      )
  async
  {
    try {
      final res = await dio.get('$baseUrl/v1/forecast.json?key=$apiKey&q=$city&days=1&aqi=no&alerts=no'
      );
      final weatherModel = WeatherModel.fromJson(res.data);
      return weatherModel;
    } on DioException catch (e) {
     final String mesError = e.response?.data['error']['message'] ?? 'oops try later';
     throw mesError;
    }
 catch(e){
      throw e.toString();
 }


    
  }

  
}
void main ()async

{
  final WeatherModel weatherModel = await WeatherService().getWeather('london');
  print(weatherModel.temp);
}