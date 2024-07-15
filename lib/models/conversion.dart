class Conversion {
  final int? id;
  final double input;
  final double result;
  final String inputUnit;
  final String resultUnit;

  const Conversion({
    this.id,
    required this.input,
    required this.result,
    required this.inputUnit,
    required this.resultUnit,
  });

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      'input': input,
      'result': result,
      'input_unit': inputUnit,
      'result_unit': resultUnit,
    };

    if (id != null) {
      map['id'] = id;
    }

    return map;
  }

  factory Conversion.fromMap(map) {
    return Conversion(
      id: map['id'],
      input: map['input'],
      result: map['result'],
      inputUnit: map['input_unit'],
      resultUnit: map['result_unit'],
    );
  }
}
