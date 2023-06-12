import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:zeyarah/core/language_helper.dart';
import 'package:zeyarah/features/trip_packages/data/model/package.dart';
//import 'package:get/get.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  var paymentDone = true;
  var paymentInProcess = true;
  @override
  void initState() {
    paymentDone = false;
    paymentInProcess = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final pac = ModalRoute.of(context)!.settings.arguments as Package;

    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('${context.loc.youSelectedThePackage} ${pac.name}'),
          Text('${context.loc.thisPackagePriceIs} ${pac.price}'),
          const CardNumberField(),
          const CardHolderNameField(),
          TextButton(
              onPressed: () {
                setState(() {
                  paymentInProcess = true;
                });
                Future.delayed(const Duration(seconds: 1)).then((value) {
                  setState(() {
                    paymentInProcess = false;
                    paymentDone = true;
                  });
                }).whenComplete(() {
                  setState(() {
                    paymentInProcess = false;
                    paymentDone = true;
                  });
                });
              },
              child: Text(context.loc.pay)),
          Visibility(
            visible: paymentInProcess,
            child: const CircularProgressIndicator(),
          ),
          Visibility(
            visible: paymentDone,
            child: const Icon(Icons.done),
          ),
          Visibility(
            visible: paymentDone,
            child: TextButton(
              onPressed: () async {
                if(kIsWeb){
                  Navigator.of(context)
                      .pushReplacementNamed('/tracking', arguments: pac);
                }else{
                  var mapPermissionStatus = await Permission.location.status;
                  if (mapPermissionStatus.isDenied) {
                    if (await Permission.location.request().isGranted) {
                      if (mounted) {
                        Navigator.of(context)
                            .pushReplacementNamed('/tracking', arguments: pac);
                      }
                    }
                  } else if (mapPermissionStatus.isGranted ||
                      mapPermissionStatus.isLimited) {
                    if (mounted) {
                      Navigator.of(context)
                          .pushReplacementNamed('/tracking', arguments: pac);
                    }
                  }
                }

              },
              child: Text(context.loc.startTrip),
            ),
          ),
        ],
      )),
    );
  }
}

class CardHolderNameField extends StatelessWidget {
  const CardHolderNameField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          prefixIcon: const Icon(Icons.person),
          hintText: context.loc.cardHolderName,
        ),
        autocorrect: false,
        keyboardType: TextInputType.name,
      ),
    );
  }
}

class CardNumberField extends StatelessWidget {
  const CardNumberField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          prefixIcon: const Icon(Icons.payment),
          hintText: context.loc.cardNumber,
        ),
        autocorrect: false,
        keyboardType: TextInputType.number,
      ),
    );
  }
}
