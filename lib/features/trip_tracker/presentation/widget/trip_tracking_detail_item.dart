import 'package:flutter/material.dart';

class TripTrackingDetailItem extends StatelessWidget {
  final String name;
  final int time;
  const TripTrackingDetailItem({
    Key? key,
    required this.name,
    required this.time,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: AlignmentDirectional.centerStart,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const Icon(
                Icons.location_pin,
              ),
              const SizedBox(
                width: 8,
              ),
              Text(name),
              Text('   $time min'),
            ],
          ),
          const Icon(
            Icons.done,
          ),
        ],
      ),
    );
  }
}
