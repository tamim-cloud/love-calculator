import 'package:flutter/material.dart';
import 'package:login_form/screens/calculate.dart';
import 'package:login_form/screens/appbar.dart';

class InputOutput extends StatefulWidget {
  const InputOutput({super.key});

  @override
  State<InputOutput> createState() => _InputOutputState();
}

class _InputOutputState extends State<InputOutput> {
  final selfNameController = TextEditingController();
  final partnerNameController = TextEditingController();

  String? loveResult;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bgi.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 45),
                  Card(
                    elevation: 23,
                    child: const Text(
                      "Let's See",
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 65),
                  TextFormField(
                    controller: selfNameController,
                    style: const TextStyle(
                      color: Colors.purpleAccent,
                      fontWeight: FontWeight.bold,
                    ),
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      hintText: "Your Name",
                      prefix: const Icon(Icons.person),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: Colors.green),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: partnerNameController,
                    style: const TextStyle(
                      color: Colors.pinkAccent,
                    ),
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      hintText: "Enter Your Partner Name",
                      prefix: const Icon(Icons.person_3),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: Colors.green),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () async {
                      final result = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Calculate(
                            selfName: selfNameController.text,
                            partnerName: partnerNameController.text,
                          ),
                        ),
                      );

                      if (result != null) {
                        setState(() {
                          loveResult = result as String;
                        });
                      }
                    },
                    child: const Text("Calculate"),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
