import 'package:flutter/material.dart';
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

  bool _isVisible1 = true;
  bool _isVisible2 = true;

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
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: (value) {
            if (value!.isEmpty) {
              return 'Empty!';
            }
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
          autovalidateMode: AutovalidateMode.onUserInteraction,
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
            helperText: 'Enter Email Format',
          ),
          onSaved: (value) {},
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
                child: TextFormField(
                  controller: userIDController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
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
                        'Please enter at least 3 characters!\nEng, number only',
                  ),
                  maxLength: 10,
                  onSaved: (value) {},
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
                            content: const Padding(
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
                  style: TextButton.styleFrom(
                      backgroundColor: Colors.lightBlue.shade100),
                  child: const Text("confirm"),
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

    return Container(
      padding: const EdgeInsets.all(8),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              obscureText: _isVisible1,
              maxLength: 12,
              controller: userPWController,
              autovalidateMode: AutovalidateMode.onUserInteraction,
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
                    setState(() {
                      _isVisible1 = !_isVisible1;
                    });
                  },
                  icon: Icon(
                    _isVisible1 ? Icons.visibility_off : Icons.visibility,
                  ),
                ),
                contentPadding: const EdgeInsets.all(5),
                icon: const Icon(Icons.password),
                labelText: 'Password',
                errorMaxLines: 3,
                helperMaxLines: 3,
                helperText:
                    'Please enter at least 6 characters!\nEng, number only',
              ),
            ),
            TextFormField(
              obscureText: _isVisible2,
              maxLength: 12,
              controller: userPWConfirmController,
              autovalidateMode: AutovalidateMode.onUserInteraction,
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
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      _isVisible2 = !_isVisible2;
                    });
                  },
                  icon: Icon(
                    _isVisible2 ? Icons.visibility_off : Icons.visibility,
                  ),
                ),
                contentPadding: const EdgeInsets.all(5),
                icon: const Icon(Icons.password),
                helperMaxLines: 3,
                errorMaxLines: 3,
                labelText: 'Password confirm',
                helperText: 'Please enter Password',
              ),
            ),
            TextButton(
              onPressed: () {
                if (_formKey.currentState!.validate() &&
                    userPWController.text
                            .compareTo(userPWConfirmController.text) ==
                        0) {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    //register info save in DB

                    return const LoginListPage();
                  }));
                } else if (userNameController.text.isEmpty) {
                  showDialog(
                      context: context,
                      barrierDismissible: true,
                      builder: (context) {
                        return AlertDialog(
                            content: const Text("name is wrong!"),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text("confirm"),
                              )
                            ]);
                      });
                } else if (userEmailController.text.isEmpty) {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                            content: const Text("Email is wrong!"),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text("confirm"),
                              )
                            ]);
                      });
                } else if (userIDController.text.isEmpty) {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                            content: const Text("ID is wrong!"),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text("confirm"),
                              )
                            ]);
                      });
                } else if (userPWController.text.isEmpty ||
                    userPWConfirmController.text.isEmpty) {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                            content: const Text("Password is Empty!"),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text("confirm"),
                              )
                            ]);
                      });
                } else {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                            content: const Text("Password is unmatch."),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text("confirm"),
                              )
                            ]);
                      });
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
