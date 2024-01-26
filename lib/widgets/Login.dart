import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:holohive/screens/launcher.dart';
import 'package:holohive/services/FirebaseServices.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({super.key});

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  FirebaseServices fb = FirebaseServices();
  final TextEditingController _textControllerName = TextEditingController();
  final TextEditingController _textControllerPass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(children: [
          const Expanded(
            flex: 2,
            child: Text("User: "),
          ),
          Expanded(
              flex: 3,
              child: TextFormField(

                controller: _textControllerName,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Enter User Name';
                  }
                  return null;
                },
              ))
        ]),
        Row(children: [
          Expanded(flex: 2, child: const Text("Password: ")),
          Expanded(
            flex: 3,
            child: TextFormField(
              obscureText: true,
              controller: _textControllerPass,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Enter Password';
                }
                return null;
              },
            ),
          )
        ]),
        const Padding(padding: EdgeInsets.only(top: 50)),
        IconButton(
            onPressed: () async {
              if (_textControllerName.text.isNotEmpty &&
                  _textControllerPass.text.isNotEmpty) {
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  // Prevent closing dialog by tapping outside
                  builder: (context) =>
                      const Center(child: CircularProgressIndicator()),
                );

                try {
                  await fb.signIn(
                      _textControllerName.text, _textControllerPass.text);
                  Navigator.pop(
                      context); // Close the dialog after successful authentication

                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const Launcher(),
                    ),
                  );
                } on FirebaseAuthException catch (e) {
                  Navigator.pop(context); // Close the dialog on error
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Error Authenticating...")),
                  );
                }
              }
            },
            icon: const Icon(Icons.fingerprint_outlined)),
      ],
    );
  }
}
