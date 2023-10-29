import 'package:flutter/material.dart';
import 'package:user_reporter/Admin/loginscreen1.dart';
import 'package:user_reporter/home.dart';
import 'package:user_reporter/responsive.dart';

class signup extends StatefulWidget {
  const signup({super.key});

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  bool abc = false;
  bool passToggle = true;
  final formfield = GlobalKey<FormState>();
  final formfield1 = GlobalKey<FormState>();
  final passcontroller = TextEditingController();
  final emailcontroller = TextEditingController();
  final namecontroller = TextEditingController();
  final lnamecontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 216, 230, 242),
        body: Center(
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              (Responsive.isdekstop(context))
                  ? Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: double.infinity,
                          color: Color.fromARGB(255, 216, 230, 242),
                          child: Image.asset(
                            'assets/sign.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    )
                  : SizedBox(),
              Expanded(
                child: Container(
                  color: Color.fromARGB(255, 216, 230, 242),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Sign Up",
                          style: TextStyle(
                              color: Colors.blue,
                              fontSize: 28,
                              fontWeight: FontWeight.w800),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 50, right: 50),
                          child: Form(
                              key: formfield,
                              autovalidateMode: AutovalidateMode.always,
                              child: Column(
                                children: [
                                  TextFormField(
                                    controller: namecontroller,
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor:
                                          Color.fromARGB(255, 171, 200, 225),
                                      border: OutlineInputBorder(),
                                      hintText: "  Enter Frist Name",
                                    ),
                                    keyboardType: TextInputType.visiblePassword,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "Enter a Frist Name";
                                      }
                                      return null;
                                    },
                                  ),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  TextFormField(
                                    controller: lnamecontroller,
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor:
                                          Color.fromARGB(255, 171, 200, 225),
                                      border: OutlineInputBorder(),
                                      hintText: "  Enter Last Name",
                                    ),
                                    keyboardType: TextInputType.visiblePassword,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "Enter a Last Name";
                                      }
                                      return null;
                                    },
                                  ),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  TextFormField(
                                    controller: emailcontroller,
                                    decoration: InputDecoration(
                                      fillColor:
                                          Color.fromARGB(255, 171, 200, 225),
                                      filled: true,
                                      border: OutlineInputBorder(),
                                      hintText: "  Enter Your Email Address",
                                    ),
                                    keyboardType: TextInputType.emailAddress,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "Enter Email";
                                      }
                                      bool emailValid = RegExp(
                                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                          .hasMatch(value);
                                      if (!emailValid) {
                                        return "Please enter valid email";
                                      }
                                      return null;
                                    },
                                  ),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  TextFormField(
                                    controller: passcontroller,
                                    obscureText: passToggle,
                                    decoration: InputDecoration(
                                        filled: true,
                                        fillColor:
                                            Color.fromARGB(255, 171, 200, 225),
                                        border: OutlineInputBorder(),
                                        hintText: "  Password",
                                        suffix: InkWell(
                                          onTap: () {
                                            setState(() {
                                              passToggle = !passToggle;
                                            });
                                          },
                                          child: Icon(
                                              passToggle
                                                  ? Icons.visibility
                                                  : Icons.visibility_off,
                                              size: 15),
                                        )),
                                    keyboardType: TextInputType.visiblePassword,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "Enter a Password";
                                      }
                                      return null;
                                    },
                                  ),
                                ],
                              )),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 50, right: 50),
                          child: Row(
                            children: [
                              Container(
                                child: Checkbox(
                                  fillColor:
                                      MaterialStateProperty.all(Colors.black),
                                  value: abc,
                                  onChanged: (value) {
                                    setState(() {
                                      abc = value!;
                                    });
                                  },
                                ),
                              ),
                              Expanded(
                                  child: Container(
                                      child:
                                          Text("Accept Terms & Conditions"))),
                              Spacer(),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 50, left: 50),
                          child: InkWell(
                            onTap: () {
                              if (formfield.currentState!.validate()) {
                                print("success");
                                emailcontroller.clear();
                                passcontroller.clear();

                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Home()));
                              }
                            },
                            child: Container(
                                width: double.infinity,
                                height: 50,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color:
                                        const Color.fromARGB(255, 1, 113, 204)),
                                child: const Center(
                                    child: Text(
                                  "Create Acoount",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 19,
                                      fontWeight: FontWeight.w400),
                                ))),
                          ),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 50, right: 50),
                          child: Row(
                            children: [
                              Expanded(
                                child: Container(
                                  height: 1,
                                  color: Colors.black,
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              const Expanded(
                                child: Text(
                                  "or continue with",
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: Container(
                                  height: 1,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 50, right: 50),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Expanded(
                                child: Container(
                                  child: Icon(
                                    Icons.g_mobiledata_rounded,
                                    color: Colors.red,
                                    size: 50,
                                  ),
                                  decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 201, 218, 223),
                                      borderRadius: BorderRadius.circular(9)),
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                child: Container(
                                  child: Icon(
                                    Icons.apple,
                                    color: Colors.black,
                                    size: 50,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(9),
                                    color: Color.fromARGB(255, 201, 218, 223),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                child: Container(
                                  child: Icon(
                                    Icons.facebook,
                                    color: Colors.blue,
                                    size: 50,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(9),
                                    color: Color.fromARGB(255, 201, 218, 223),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 50, right: 50),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Already have an acoount ?",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 17),
                              ),
                              SizedBox(
                                width: 3,
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => loginpage()));
                                },
                                child: Text(
                                  "Login In",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 1, 113, 204),
                                      fontSize: 17,
                                      decoration: TextDecoration.underline),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
