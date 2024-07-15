import 'package:flutter/material.dart';
import 'package:temperature_conversion/blocs/conversions.dart';
import 'package:temperature_conversion/components/empty_history.dart';
import 'package:temperature_conversion/utils/format_numbers.dart';
import 'package:temperature_conversion/models/conversion.dart';

class ConversionsList extends StatelessWidget {
  final ConversionsBloc conversionsBloc;
  final List<Conversion> conversions;

  const ConversionsList({
    super.key,
    required this.conversions,
    required this.conversionsBloc,
  });

  @override
  Widget build(BuildContext context) {
    if (conversions.isEmpty) return const EmptyHistory();

    // Reverse the list
    List<Conversion> conversionsReversed = conversions.reversed.toList();

    // Display the list of conversions
    return ListView.builder(
      itemCount: conversionsReversed.length,
      itemBuilder: (context, index) {
        Conversion conversion = conversionsReversed[index];
        return ListTile(
          title: Text(
            '${formatNumbers(conversion.input)} → ${formatNumbers(conversion.result)}',
          ),
          subtitle: Text(
            '${conversion.inputUnit} → ${conversion.resultUnit}',
          ),
          trailing: IconButton(
            onPressed: () async {
              void showSnackbar(String message) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    duration: const Duration(milliseconds: 250),
                    content: Text(message),
                  ),
                );
              }

              showSnackbar('Deleting conversion.');
              await conversionsBloc.deleteConversion(conversion.id!);
              showSnackbar('Deleted conversion.');
            },
            icon: const Icon(Icons.delete),
          ),
        );
      },
    );
  }
}
