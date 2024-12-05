import 'package:flutter/material.dart';
import 'package:login_form/screens/appbar.dart';

class RegistrationPage extends StatelessWidget {
  final namController = TextEditingController();
  final passController = TextEditingController();
  final namControllers = TextEditingController();
  final passControllers = TextEditingController();

  RegistrationPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/bgi.jpg"),
                fit: BoxFit.cover
              ),
            ),
          ),
       Padding( padding: EdgeInsets.all(21),
         child: SingleChildScrollView(
           child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Card(
                  elevation: 35,
                  //shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(78)),
                  child: const Text(
                    "Registration Form",
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 45,
                ),
                visibleMethod(
                  controller: namController,
                  hintText: 'Fullname',
                  prefix: const Icon(Icons.person_outline),
                ),
                
                const SizedBox(
                  height: 11,
                ),
                visibleMethod(
                  controller: namControllers,
                  hintText: 'Email',
                  prefix: const Icon(Icons.email_outlined),
                ),
                const SizedBox(
                  height: 11,
                ),
                nonVisibleMethod(
                  controllers: passController,
                  hintTexts: 'Enter Password',
                  prefixs: const Icon(Icons.key),
                  suffixs: const Icon(Icons.visibility),
                ),
                const SizedBox(
                  height: 11,
                ),
                nonVisibleMethod(
                  controllers: passControllers,
                  hintTexts: 'Confirm Password',
                  prefixs: const Icon(Icons.key),
                  suffixs: const Icon(Icons.visibility),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (_validateInputs(context)) {
                      Navigator.pop(context);
                    }
                  },
                  child: const Text("Registration"),
                ),
              ],
            ),
           ),
         ),
       )
        ]
      ),
    );
  }

  bool _validateInputs(BuildContext context){
    if(namController.text.isEmpty){
      _showError(context, "Fullname is required");
      return false;
    }
    if(namControllers.text.isEmpty || !namControllers.text.contains('@')){
      _showError(context, "Valid email is required");
      return false;
    }
    if(passController.text.isEmpty || passController.text.length < 6){
      _showError(context, "Password must be at least 6 characters");
      return false;
    }
    if(passController.text != passControllers.text){
      _showError(context, "Passwords do not match");
      return false;
    }
    return true;
  }

  void _showError(BuildContext context, String message){
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message))
    );
  }

  TextFormField nonVisibleMethod({
    required TextEditingController controllers,
    required String hintTexts,
    required Widget prefixs,
    required Widget suffixs,
  }) {
    return TextFormField(
      controller: controllers,
      obscureText: true,
      style: const TextStyle(
        color: Color.fromARGB(255, 228, 34, 235),
      ),
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        hintText: hintTexts,
        prefixIcon: prefixs,
        suffixIcon: suffixs,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.green),
          gapPadding: 3,
        ),
      ),
    );
  }

  TextFormField visibleMethod({
    required TextEditingController controller,
    required String hintText,
    required Widget prefix,
  }) {
    return TextFormField(
      controller: controller,
      style: const TextStyle(
        color: Color.fromARGB(255, 228, 24, 255),
      ),
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: prefix,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.green),
          gapPadding: 3,
        ),
      ),
    );
  }
}
