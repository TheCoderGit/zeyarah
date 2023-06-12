import 'package:flutter/material.dart';
import 'package:zeyarah/core/language_helper.dart';
import 'package:zeyarah/core/widgets/custom_image_box.dart';
import 'package:zeyarah/features/trip_packages/data/model/package.dart';

class PackageDetails extends StatelessWidget {
  const PackageDetails({super.key});

  //final Package package = Get.arguments;

  @override
  Widget build(BuildContext context) {
    final pac = ModalRoute.of(context)!.settings.arguments as Package;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    pac.name,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    '${pac.price}',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    context.loc.listOfLandMarks,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  ...pac.listOfLandMarks
                      .map((e) => Container(
                          margin: const EdgeInsets.all(10),
                          width: double.infinity,
                          decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(20)),
                          child: Column(
                            children: [
                              SizedBox(
                                  height: 300,
                                  width: double.infinity,
                                  child:
                                      CustomImageBox(imagePath: e.imagePath)),
                              Text(e.name),
                              const SizedBox(
                                height: 4,
                              ),
                              Text('${e.time} ${context.loc.minutes}'),
                            ],
                          )))
                      .toList()
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
