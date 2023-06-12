import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zeyarah/core/language_helper.dart';

class TripDetails extends StatelessWidget {
  const TripDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Card(
              child: Container(
                padding: const EdgeInsetsDirectional.symmetric(horizontal: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      context.loc.tripDetails,
                      textAlign: TextAlign.start,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    Text(
                      '${context.loc.tripName} : ',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Text(
                      '${context.loc.tripTime} :',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Text(
                      '${context.loc.tripCost} : ',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Text(
                      '${context.loc.tripStartTime} : ',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Text(
                      '${context.loc.tripEndTime} : ',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Text(
                      context.loc.data,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ],
                ),
              ),
            ),
            TextButton(
              child: Text(context.loc.home),
              onPressed: () => Navigator.pop(context),
            )
          ],
        ),
      ),
    );
  }
}
