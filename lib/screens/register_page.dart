import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:trip_mate/components/text_field.dart';
import 'package:trip_mate/screens/login_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formkey = GlobalKey<FormState>();
  // ignore: unused_field, prefer_final_fields
  List _gender = ['male', 'female', 'others'];
  String? hint;
  bool obscure = true;
  String selectedGender = 'Male';

  RegExp emailRegX = RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
  RegExp passwordRegX =
      RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{6,}$');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        // toolbarHeight: 130,
        backgroundColor: Colors.white,
        foregroundColor: Colors.grey,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 22, right: 22),
            child: Form(
              key: _formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Sign Up",
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                  ),
                  TextFieldComponent(
                    fieldName: "First Name",
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Can't be empty";
                      }
                      return null;
                    },
                    hintText: "Enter First Name",
                  ),
                  TextFieldComponent(
                    fieldName: "Last Name",
                    hintText: "Enter Last Name",
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Can't be empty";
                      }
                      return null;
                    },
                  ),
                  TextFieldComponent(
                    fieldName: "Email",
                    hintText: "Enter Email",
                    validator: (value) {
                      if (value == null ||
                          value.isEmpty ||
                          value.trim() == '') {
                        return 'Email is required';
                      } else if (!emailRegX.hasMatch(value)) {
                        return 'Invalid Email';
                      }
                      return null;
                    },
                  ),
                  TextFieldComponent(
                    obscure: obscure,
                    fieldName: "Password",
                    hintText: "Enter Password",
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "can't be empty";
                      }
                      if (value.length < 8) {
                        return "Must be greater than 8 char";
                      }
                      if (!passwordRegX.hasMatch(value)) {
                        return 'Invalid Password';
                      }
                      return null;
                    },
                    prefixIcon: const Icon(Icons.lock_open_outlined),
                    suffixIcon: IconButton(
                      icon: obscure
                          ? const Icon(Icons.visibility_off)
                          : const Icon(Icons.visibility),
                      onPressed: () {
                        setState(() {
                          obscure = !obscure;
                        });
                      },
                      color: Colors.black,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text(
                          "Gender:",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        DropdownButtonFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Can't be empty";
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                              hintText: 'Your Gender',
                              prefixIcon: Icon(Icons.people),
                              contentPadding: EdgeInsets.all(15),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(width: 1, color: Colors.grey),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(width: 1, color: Colors.grey),
                              )),
                          items: <String>['Male', 'Female', 'Others']
                              .map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (_) {},
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: Text.rich(
                            TextSpan(
                              text: 'By signing up you agree to our ',
                              style: const TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  text: 'Terms & Conditions',
                                  style: const TextStyle(
                                    fontSize: 15,
                                    color: Colors.blue,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      // code to open / launch terms of service link here
                                    },
                                ),
                                TextSpan(
                                  text: ' and ',
                                  style: const TextStyle(
                                      fontSize: 15, color: Colors.black),
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: 'Privacy Policy.*',
                                        style: const TextStyle(
                                          fontSize: 15,
                                          color: Colors.blue,
                                        ),
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {
                                            // code to open / launch privacy policy link here
                                          })
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 35),
                          child: Align(
                            child: ElevatedButton(
                              onPressed: () {
                                if (_formkey.currentState!.validate()) {}
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.deepPurple,
                                fixedSize: const Size(150, 55),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                              child: const Text(
                                "Register",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              ),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          // crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            const Text(
                              "Already Signed Up?",
                            ),
                            TextButton(
                                onPressed: (() {
                                  Navigator.of(context).push(
                                      MaterialPageRoute(builder: ((context) {
                                    return const LoginPage();
                                  })));
                                }),
                                child: const Text(
                                  "Log In",
                                  style: TextStyle(
                                      color: Color.fromARGB(
                                        255,
                                        15,
                                        140,
                                        243,
                                      ),
                                      fontWeight: FontWeight.bold),
                                ))
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
