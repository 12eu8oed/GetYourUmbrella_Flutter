class Weather {
  final String cityName;
  final double temperature;
  final String mainCondition;

  Weather({
    required this.cityName
    , required this.temperature
    , required this.mainCondition
  });

  factory Weather.fromJson(Map<String, dynamic> json) {  //json객체로 변환하는!
    return Weather(
      cityName: json['name']
    , temperature: json['main']['temp'].toDouble()
    , mainCondition: json['weather'][0]['main']
    ,
    );
  }
}