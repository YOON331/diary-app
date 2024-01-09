import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:project/login_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController userEmailController = TextEditingController();
  TextEditingController userIDController = TextEditingController();
  TextEditingController userPWController = TextEditingController();
  TextEditingController userPWConfirmController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Register"),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                children: [
                  NameInput(),
                  EmailInout(),
                  IDInput(),
                  PasswordInput(),
                  // RegistButton(),
                ],
              ),
            ),
          ),
        ));
  }

  Widget NameInput() {
    final _formKey = GlobalKey<FormState>();
    return Container(
      padding: const EdgeInsets.all(8),
      child: Form(
        key: _formKey,
        child: TextFormField(
          controller: userNameController,
          onChanged: (value) {},
          validator: (value) {
            if (value!.isEmpty) return 'Empty!';
            if (!RegExp(r"^[a-z A-Z ㄱ-ㅎ 가-힣]*$").hasMatch(value)) {
              return ('Incorrect Format!');
            }
            return null;
          },
          decoration: const InputDecoration(
            contentPadding: EdgeInsets.all(5),
            labelText: 'Name',
            errorMaxLines: 3,
            helperText: 'Eng, Kor only',
            helperMaxLines: 3,
          ),
          onSaved: (value) {},
          onTap: () {
            if (_formKey.currentState!.validate()) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Save Name')),
              );
            }
          },
        ),
      ),
    );
  }

  Widget EmailInout() {
    final _formKey = GlobalKey<FormState>();
    return Container(
      padding: const EdgeInsets.all(8),
      child: Form(
        key: _formKey,
        child: TextFormField(
          controller: userEmailController,
          onChanged: (value) {},
          validator: (value) {
            if (value!.isEmpty) return 'Empty!';
            if (!RegExp(
                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                .hasMatch(value)) {
              return ('Incorrect Format!');
            }
            return null;
          },
          decoration: const InputDecoration(
            contentPadding: EdgeInsets.all(5),
            icon: Icon(Icons.mail),
            errorMaxLines: 3,
            labelText: 'Email',
            helperText: 'Eng, Kor only',
          ),
          onSaved: (value) {},
          onTap: () {
            if (_formKey.currentState!.validate()) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Save Email')),
              );
            }
          },
        ),
      ),
    );
  }

  Widget IDInput() {
    final _formKey = GlobalKey<FormState>();
    return Container(
      padding: const EdgeInsets.all(8),
      child: Form(
        key: _formKey,
        child: Row(
          children: <Widget>[
            Expanded(
                flex: 3,
                child: Container(
                  child: TextFormField(
                    controller: userIDController,
                    onChanged: (value) {},
                    validator: (value) {
                      obscureText:
                      true;
                      if (value!.isEmpty) {
                        return 'Empty! Please enter at least 3 characters!';
                      } else if (value.length < 3) {
                        return ('Must be greater than 3 characters');
                      } else if (!RegExp(r"^[a-zA-Z0-9]{3,10}$")
                          .hasMatch(value)) {
                        return ('Incorrect Format!');
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.all(5),
                      icon: Icon(Icons.person),
                      labelText: 'ID',
                      errorMaxLines: 3,
                      helperMaxLines: 3,
                      helperText:
                          'Please enter at least 3 characters! Eng, number only',
                    ),
                    maxLength: 10,
                    onSaved: (value) {},
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Check duplicate ID!')),
                        );
                      }
                    },
                  ),
                )),
            Flexible(
              fit: FlexFit.loose,
              flex: 1,
              child: Center(
                child: TextButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      barrierDismissible: true,
                      builder: (context) {
                        return AlertDialog(
                            title: const Text('Check Duplicate ID'),
                            content: Padding(
                              padding: EdgeInsets.all(8),
                              child: Text('사용하시겠습니까?'),
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text('확인'),
                              )
                            ]);
                      },
                    );
                  },
                  child: const Text("confirm"),
                  style: TextButton.styleFrom(
                      backgroundColor: Colors.lightBlue.shade100),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget PasswordInput() {
    final _formKey = GlobalKey<FormState>();
    bool isVisible = true;

    return Container(
      padding: const EdgeInsets.all(8),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              obscureText: isVisible,
              maxLength: 12,
              controller: userPWController,
              onChanged: (value) {},
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Empty! Please enter at least 6 characters!';
                } else if (value.length < 6) {
                  return ('Must be greater than six characters');
                } else if (!RegExp(r"^[a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]{6,12}$")
                    .hasMatch(value)) {
                  return ('Incorrect Format!');
                }
                return null;
              },
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  onPressed: () {
                    Future.delayed(const Duration(microseconds: 100));
                    setState(() {
                      isVisible = !isVisible;
                    });
                  },
                  icon:
                      Icon(isVisible ? Icons.visibility : Icons.visibility_off),
                ),
                contentPadding: EdgeInsets.all(5),
                icon: Icon(Icons.password),
                labelText: 'Password',
                errorMaxLines: 3,
                helperMaxLines: 3,
                helperText:
                    'Please enter at least 6 characters! Eng, number only',
              ),
              onSaved: (value) {},
              onTap: () {
                if (_formKey.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Save Email')),
                  );
                }
              },
            ),
            TextFormField(
              obscureText: true,
              maxLength: 12,
              controller: userPWConfirmController,
              onChanged: (value) {},
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Empty! Please enter Password!';
                } else if (value.length < 6) {
                  return ('Must be greater than six characters');
                } else if (!RegExp(r"^[a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]{6,12}$")
                    .hasMatch(value)) {
                  return ('Incorrect Format!');
                }
                return null;
              },
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.all(5),
                icon: Icon(Icons.password),
                helperMaxLines: 3,
                errorMaxLines: 3,
                labelText: 'Password confirm',
                helperText: 'Please enter Password',
              ),
              onSaved: (value) {},
              // onTap: () {
              //   if (_formKey.currentState!.validate() &&
              //       userPWController.text
              //               .compareTo(userPWConfirmController.text) ==
              //           0) {
              //     ScaffoldMessenger.of(context).showSnackBar(
              //       SnackBar(
              //           content: Text(
              //               'Save Password${userPWConfirmController.text} and ${userPWController.text}')),
              //     );
              //   } else {
              //     ScaffoldMessenger.of(context).showSnackBar(
              //       SnackBar(
              //           content: Text(
              //               'Unmatched Password${userPWConfirmController.text} and ${userPWController.text}')),
              //     );
              //   }
              // },
            ),
            TextButton(
              onPressed: () {
                if (_formKey.currentState!.validate() &&
                    userPWController.text
                            .compareTo(userPWConfirmController.text) ==
                        0) {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return const LoginListPage();
                  }));
                } else {
                  Text('unmatch');
                }
              },
              child: const Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}
