class Weather {
  final String city;
  final double temperature;
  final int humidity;
  final double windSpeed;
  final int visibility;
  final int airPressure;

  Weather({
    required this.city,
    required this.temperature,
    required this.humidity,
    required this.windSpeed,
    required this.visibility,
    required this.airPressure,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      city: json['name'],
      temperature: json['temp'],
      humidity: json['humidity'],
      windSpeed: json['windSpeed'],
      visibility: json['visibility'],
      airPressure: json['pressure'],
    );
  }
}
