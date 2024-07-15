import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:temperature_conversion/blocs/conversions.dart';
import 'package:temperature_conversion/components/conversions_list.dart';
import 'package:temperature_conversion/components/heading.dart';
import 'package:temperature_conversion/models/conversion.dart';

class History extends StatefulWidget {
  const History({super.key});

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  @override
  Widget build(BuildContext context) {
    final conversionsBloc = Provider.of<ConversionsBloc>(context);
    return Card(
      elevation: 0.0,
      surfaceTintColor: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const Heading(label: 'Conversion History'),
            Expanded(
              child: StreamBuilder<List<Conversion>>(
                stream: conversionsBloc.conversions,
                builder: (context, snapshot) {
                  // Display loading indicator
                  if (!snapshot.hasData) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  // Display the conversions list
                  return ConversionsList(
                    conversions: snapshot.data!,
                    conversionsBloc: conversionsBloc,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
