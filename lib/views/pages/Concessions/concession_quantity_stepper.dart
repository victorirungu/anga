import 'package:anga/views/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class QuantityStepper extends StatefulWidget {
  final Map consession;
  RxMap cart = {}.obs;
  QuantityStepper({super.key, required this.consession, required this.cart});

  @override
  QuantityStepperState createState() => QuantityStepperState();
}

class QuantityStepperState extends State<QuantityStepper> {
  @override
  void initState() {
    super.initState();
  }

  RxInt _quantity = 0.obs;

  void _incrementQuantity() {
    setState(() {
      _quantity++;
    });
  }

  void _decrementQuantity() {
    setState(() {
      if (_quantity > 0) {
        _quantity--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 90.0,
      height: 28.0,
      child: Material(
        elevation: 1.0,
        color: secondaryColor().withOpacity(.7),
        borderRadius: BorderRadius.circular(0.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: Icon(
                Icons.remove,
                color: primaryForeGround(),
                size: 13.0,
              ),
              onPressed: _decrementQuantity,
            ),
            Container(
                padding: const EdgeInsets.symmetric(horizontal: 0),
                child: Obx(
                  () => Text(
                    '$_quantity',
                    style: TextStyle(fontSize: 13, color: primaryForeGround()),
                  ),
                )),
            IconButton(
              icon: Icon(
                Icons.add,
                color: primaryForeGround(),
                size: 13.0,
              ),
              onPressed: _incrementQuantity,
            ),
          ],
        ),
      ),
    );
  }
}
