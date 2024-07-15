import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:temperature_conversion/blocs/conversions.dart';
import 'package:temperature_conversion/components/heading.dart';
import 'package:temperature_conversion/components/primary_action_button.dart';
import 'package:temperature_conversion/services/converters.dart';
import 'package:temperature_conversion/models/conversion.dart';
import 'package:temperature_conversion/utils/format_numbers.dart';

class Converter extends StatefulWidget {
  const Converter({super.key});

  @override
  State<Converter> createState() => _ConverterState();
}

enum ConversionOptions {
  celsiusToFahrenheit,
  fahrenheitToCelsius,
}

class _ConverterState extends State<Converter> {
  final TextStyle labelStyle = TextStyle(
    color: Colors.grey.shade600,
    fontSize: 16,
    fontWeight: FontWeight.w300,
  );

  final UnderlineInputBorder border = UnderlineInputBorder(
    borderSide: BorderSide(
      color: Colors.grey.shade300,
    ),
  );

  final TextStyle temperatureValuesStyle = const TextStyle(
    color: Colors.black,
    fontSize: 34,
    fontWeight: FontWeight.w800,
  );

  ConversionOptions currentConversion = ConversionOptions.celsiusToFahrenheit;
  TextEditingController inputController = TextEditingController(text: '0');
  double result = 32;

  @override
  Widget build(BuildContext context) {
    ConversionsBloc conversionsBloc = Provider.of<ConversionsBloc>(context);

    void calculateResult() {
      double? input = double.tryParse(inputController.text);
      double convertedValue = 0;

      if (input != null) {
        if (currentConversion == ConversionOptions.celsiusToFahrenheit) {
          convertedValue = Converters.celsiusToFahrenheit(input);
        } else {
          convertedValue = Converters.fahrenheitToCelsius(input);
        }

        setState(() {
          result = convertedValue;
        });

        conversionsBloc.addConversion(Conversion(
          input: input,
          result: result,
          inputUnit: currentConversion == ConversionOptions.celsiusToFahrenheit
              ? 'Celsius'
              : 'Fahrenheit',
          resultUnit: currentConversion == ConversionOptions.celsiusToFahrenheit
              ? 'Fahrenheit'
              : 'Celsius',
        ));
      }
    }

    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Center(
            child: Heading(
              label: 'Temperature Converter',
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Text(
                      currentConversion == ConversionOptions.celsiusToFahrenheit
                          ? 'Celsius'
                          : 'Fahrenheit',
                      style: labelStyle,
                    ),
                    SizedBox(
                      height: 40,
                      child: Center(
                        child: TextField(
                          keyboardType: TextInputType.number,
                          controller: inputController,
                          cursorColor: Colors.grey,
                          textAlign: TextAlign.center,
                          style: temperatureValuesStyle,
                          decoration: InputDecoration(
                            focusedBorder: border,
                            enabledBorder: border,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    if (currentConversion ==
                        ConversionOptions.celsiusToFahrenheit) {
                      currentConversion = ConversionOptions.fahrenheitToCelsius;
                    } else {
                      currentConversion = ConversionOptions.celsiusToFahrenheit;
                    }
                    calculateResult();
                  });
                },
                icon: const Icon(
                  Icons.swap_horiz_outlined,
                  color: Colors.black,
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Text(
                      currentConversion == ConversionOptions.celsiusToFahrenheit
                          ? 'Fahrenheit'
                          : 'Celsius',
                      style: labelStyle,
                    ),
                    SizedBox(
                      height: 40,
                      child: Center(
                        child: Text(
                          formatNumbers(result),
                          style: temperatureValuesStyle,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 50,
          ),
          PrimaryActionButton(
            onPressed: calculateResult,
            label: 'Convert',
          ),
        ],
      ),
    );
  }
}
