class WeatherModel {
  final String name;
  final DateTime date;
  final String temp;
  final String maxTemp;
  final String minTemp;
  final String wearthCondition;
  final String? image;

  WeatherModel( {required this.name, required this.date, required this.temp, required this.maxTemp, required this.minTemp, required this.wearthCondition, this.image });
  factory WeatherModel.fromJson(json)
  {
    return WeatherModel(
      name: json['location']['name'],
      date: DateTime.parse(json['current']['last_updated']),
      temp: json['forecast']['forecastday'][0]['day']['avgtemp_c'].toString(),
      maxTemp: json['forecast']['forecastday'][0]['day']['maxtemp_c'].toString(),
      minTemp: json['forecast']['forecastday'][0]['day']['mintemp_c'].toString(),
      wearthCondition: json['forecast']['forecastday'][0]['day']['condition']['text'],
      image: json['forecast']['forecastday'][0]['day']['condition']['icon'],
    );
  }
}
