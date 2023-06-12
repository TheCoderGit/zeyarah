import 'package:flutter/material.dart';

class CustomImageBox extends StatelessWidget {
  final double height;
  final String imagePath;
  const CustomImageBox({
    Key? key,
    required this.imagePath,
    this.height = 300,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(12),
      decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(imagePath),
            fit: BoxFit.cover,
          ),
          border: Border.all(width: 0, color: Colors.brown),
          borderRadius: BorderRadius.circular(6)),
      height: height,
      width: double.infinity,
      //child: Image.asset('assets/images/masjidnabawi.jpg'),
    );
  }
}
