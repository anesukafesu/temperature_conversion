class Converters {
  static double celsiusToFahrenheit(double temperature) {
    return temperature * 9 / 5 + 32;
  }

  static double fahrenheitToCelsius(double temperature) {
    return (temperature - 32) * 5 / 9;
  }
}
