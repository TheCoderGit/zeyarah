import 'package:flutter/material.dart';
import 'package:zeyarah/core/dummy_data/dummy_data.dart';
import 'package:zeyarah/core/language_helper.dart';
import 'package:zeyarah/core/widgets/custom_image_box.dart';
import 'package:zeyarah/features/trip_packages/data/model/package.dart';

class PackagesScreen extends StatelessWidget {
  const PackagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Text(
            context.loc.packageSelectText,
            textAlign: TextAlign.start,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: DummyData.packages.length,
              itemBuilder: ((context, index) {
                List<Package> packages = DummyData.packages;
                return Container(
                  margin: const EdgeInsets.all(10),
                  child: Card(
                    elevation: 6,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          packages[index].name,
                        ),
                        GestureDetector(
                            onTap: () {
                              Navigator.of(context).pushReplacementNamed(
                                  '/payment',
                                  arguments: packages[index]);
                            },
                            child: CustomImageBox(
                                height: 200,
                                imagePath: packages[index]
                                    .listOfLandMarks
                                    .last
                                    .imagePath)),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '${packages[index].price}',
                              ),
                              TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pushNamed(
                                        '/packages_details',
                                        arguments: packages[index]);
                                  },
                                  child: Text(context.loc.details))
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
            ),
          ),
        ],
      )),
    );
  }
}
