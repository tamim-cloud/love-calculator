import 'package:flutter/material.dart';
import 'package:login_form/screens/input_output.dart';
import 'package:login_form/screens/registraion_page.dart';

final _formkey = GlobalKey<FormState>();

class LoginPage extends StatelessWidget {
  final emainController = TextEditingController();
  final passwordControlar = TextEditingController();
  LoginPage({
    super.key,
  });

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
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/bgi.jpg"), // সঠিক ইমেজ রেফারেন্স
              fit: BoxFit.cover, // ইমেজকে পুরো ব্যাকগ্রাউন্ডে ফিট করবে
            ),
          ),
          child: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0), // লেআউটের চারপাশে প্যাডিং
                child: Form(
                  key: _formkey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 20),
                      Card(
                        elevation: 34,
                        child: Text(
                          "Login Form",
                          style: TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      const SizedBox(height: 50),
                      TextFormField(
                        controller: emainController,
                        style: const TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontWeight: FontWeight.bold,
                        ),
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          hintText: "Email",
                          prefix: const Icon(Icons.email_outlined),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(color: Colors.green),
                            gapPadding: 3,
                          ),
                        ),
                        validator: validateEmail,
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: passwordControlar,
                        obscureText: true,
                        style: const TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          hintText: "Password",
                          prefix: const Icon(Icons.key),
                          suffix: const Icon(Icons.visibility),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(color: Colors.green),
                            gapPadding: 3,
                          ),
                        ),
                        validator: validatePassword,
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          if (_formkey.currentState!.validate()) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => InputOutput(),
                              ),
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text("Please fix the errors!"),
                              ),
                            );
                          }
                        },
                        child: const Text("Login"),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Do you have any account?",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(width: 10),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => RegistrationPage(),
                                ),
                              );
                            },
                            child: const Text(
                              "Register Here",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email can not empty';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password can not empty';
    }
    if (value.length < 6) {
      return 'Password at least 6 Charecter';
    }
    return null;
  }
}
