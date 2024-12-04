import 'package:flutter/material.dart';

class InputOutput extends StatelessWidget {
  final selfNameController = TextEditingController();
  final partnerNameController = TextEditingController();

  InputOutput({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        title: const Text(
          "Love Calculator",
          style: TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bgi.jpg"),
            fit: BoxFit.cover, // ইমেজ পুরো স্ক্রিনে ফিট হবে
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0), // চারপাশে প্যাডিং
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 45,),
                  Card(
                    elevation: 23,
                    child: Text(
                      "<3>",
                      style: TextStyle(
                        fontSize: 17,
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
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text("Calculation Result"),
                          content: Text(
                            "Your name: ${selfNameController.text}\nPartner's name: ${partnerNameController.text}",
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text('Close'),
                            ),
                          ],
                        ),
                      );
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
