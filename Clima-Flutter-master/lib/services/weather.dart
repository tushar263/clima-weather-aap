import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const String apikey = '12c21d26aa79426846c7d047ccfdaa73';

class WeatherModel {
  Future<dynamic> getcityweather(String cityname) async {
    var url =
        'https://api.openweathermap.org/data/2.5/weather?q=$cityname&appid=$apikey&units=metric';
    Networkhelper networkhelper = Networkhelper(url);

    return await networkhelper.getdata();
  }

  Future<dynamic> getweatherdata() async {
    Location location = Location();
    await location.getcurrentlocation();

    Networkhelper networkhelper = Networkhelper(
        'https://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.longitude}&appid=$apikey&units=metric');
    var data = await networkhelper.getdata();

    return data;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
