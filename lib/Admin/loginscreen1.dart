import 'package:flutter/material.dart';
import 'package:user_reporter/Admin/home.dart';
import 'package:user_reporter/Admin/sing.dart';
import 'package:user_reporter/home.dart';
import 'package:user_reporter/responsive.dart';

class loginpage extends StatefulWidget {
  const loginpage({super.key});

  @override
  State<loginpage> createState() => _loginpageState();
}

class _loginpageState extends State<loginpage> {
  bool abc = false;
  bool passToggle = true;
  final formfield = GlobalKey<FormState>();
  final formfield1 = GlobalKey<FormState>();
  final passcontroller = TextEditingController();
  final emailcontroller = TextEditingController();
  String drop = "";
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
                            'assets/login.jpg',
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
                          "Sign In",
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
                                  DropdownButtonFormField(
                                    validator: (value) {
                                      if (value == null) {
                                        return "Select User";
                                      }
                                      return null;
                                    },
                                    value: drop.isEmpty ? null : drop,
                                    hint: Text("Select User"),
                                    decoration: InputDecoration(
                                      fillColor:
                                          Color.fromARGB(255, 171, 200, 225),
                                      filled: true,
                                      border: OutlineInputBorder(),
                                    ),
                                    items: [
                                      DropdownMenuItem(
                                        value: "1",
                                        child: Text("Admin"),
                                      ),
                                      DropdownMenuItem(
                                        value: "2",
                                        child: Text("Repoter"),
                                      ),
                                    ],
                                    onChanged: (value) {
                                      setState(() {
                                        drop = value!;
                                        print(drop);
                                      });
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
                                    // validator: (value) {
                                    //   if (value!.isEmpty) {
                                    //     return "Enter Email";
                                    //   }
                                    //   bool emailValid = RegExp(
                                    //           r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                    //       .hasMatch(value);
                                    //   if (!emailValid) {
                                    //     return "Please enter valid email";
                                    //   }
                                    //   return null;
                                    // },
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
                                    //   validator: (value) {
                                    //     if (value!.isEmpty) {
                                    //       return "Enter a Password";
                                    //     }
                                    //     return null;
                                    //   },
                                  )
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
                                  child:
                                      Container(child: Text("Keep me login"))),
                              Spacer(),
                              Expanded(
                                  child: Container(
                                      child: Text("Recovery Password"))),
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
                                  MaterialPageRoute(builder: (context) {
                                    if (drop == "1") {
                                      return Home_admin_admin();
                                    } else if (drop == "2") {
                                      return Home();
                                    } else {
                                      return SnackBar(
                                        content: Text("Select User"),
                                      );
                                    }
                                  }),
                                );
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
                                  "SIGN IN",
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
                          padding: const EdgeInsets.only(left: 100, right: 50),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            // crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Text(
                                  "Need an account ?",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 17),
                                ),
                              ),
                              SizedBox(
                                width: 3,
                              ),
                              Expanded(
                                child: TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => signup()));
                                  },
                                  child: Text(
                                    "SIGN UP",
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 1, 113, 204),
                                        fontSize: 17,
                                        decoration: TextDecoration.underline),
                                  ),
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
