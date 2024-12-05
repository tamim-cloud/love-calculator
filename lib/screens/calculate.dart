import 'package:flutter/material.dart';
import 'package:login_form/screens/appbar.dart';

class Calculate extends StatelessWidget {
  final String selfName;
  final String partnerName;

  const Calculate(
      {super.key, required this.selfName, required this.partnerName});

  @override
  Widget build(BuildContext context) {
    int partner1 = 0;
    int partner2 = 0;

    for (int i = 0; i < selfName.length; i++) {
      partner1 += selfName.codeUnitAt(i);
    }
    for (int i = 0; i < partnerName.length; i++) {
      partner2 += partnerName.codeUnitAt(i);
    }
    double lovePercentage;
    if (partner1 > partner2) {
      lovePercentage = (partner2 / partner1) * 100;
    } else {
      lovePercentage = (partner1 / partner2) * 100;
    }

    return Scaffold(
        appBar: CustomAppBar(),
        body: Stack(children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/lovecute.jpg'),
                  fit: BoxFit.fill),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Love Calculation Result",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.redAccent,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "Your Name: $selfName",
                    style: const TextStyle(fontSize: 15,fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                  Text(
                    "Partner's Name: $partnerName",
                    style: const TextStyle(fontSize: 15,fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "Love Percentage: ${lovePercentage.toStringAsFixed(2)}%",
                    style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.pink,
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context, lovePercentage.toString());
                    },
                    child: const Text("Back"),
                  ),
                ],
              ),
            ),
          ),
        ]));
  }
}
