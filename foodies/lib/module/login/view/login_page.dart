import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final formKey = GlobalKey<FormState>();

  Widget usernameText() {
    return TextFormField(
      style: TextStyle(
        color: Colors.white,
      ),
      decoration: InputDecoration(
        icon: Icon(
          Icons.face,
          color: Color.fromRGBO(255, 201, 41, 1),
          size: 32.0,
        ),
        labelText: 'Display Name: ',
        labelStyle: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      validator: (String? value) {
        if (value!.isEmpty) {
          return "Please Fill Your Username";
        } else {
          return "";
        }
      },
    );
  }

  Widget passwordText() {
    return TextFormField(
      obscureText: true,
      style: TextStyle(
        color: Colors.white,
      ),
      decoration: InputDecoration(
        icon: Icon(
          Icons.lock,
          color: Color.fromRGBO(255, 201, 41, 1),
          size: 32.0,
        ),
        labelText: 'Password: ',
        labelStyle: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      validator: (String? value) {
        if (value!.length < 8) {
          return "Password More 8 Charactor";
        } else {
          return "";
        }
      },
    );
  }

  Widget signUpButton() {
    return ElevatedButton(
      onPressed: () {
        print('You Click Sign Up');
        if (formKey.currentState!.validate()) {
          formKey.currentState!.save();
        }
      },
      child: Text('SIGN UP'),
    );
  }

  Widget loginButton() {
    return ElevatedButton(
      onPressed: () {
        print('You Click Login');
        if (formKey.currentState!.validate()) {
          formKey.currentState!.save();
        }
      },
      style: ElevatedButton.styleFrom(
        foregroundColor: Color.fromRGBO(255, 201, 41, 1),
        backgroundColor: Color.fromRGBO(255, 201, 41, 1),
        disabledForegroundColor: Color.fromRGBO(249, 226, 157, 1),
        disabledBackgroundColor: Color.fromRGBO(249, 226, 157, 1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
          side: BorderSide(color: Colors.transparent, width: 1)
        ),
        shadowColor: const Color.fromRGBO(0, 0, 0, 1),
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5.0),
        minimumSize: const Size(150, 45),
      ),
      child: Text('LOGIN'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/jay-wennington-N_Y88TWmGwA-unsplash.jpg"),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(Colors.black.withValues(alpha: 0.2), BlendMode.darken)
                ),
              ),
            ),
            ListView(
              shrinkWrap: true,
              padding: EdgeInsets.symmetric(horizontal: 20),
              children: <Widget>[
                Container(
                  height: 150,
                  child: Image.asset('assets/images/Bright_Yellow_Tree_Icon_Landscaping_Logo__1_-removebg-preview.png'),
                ),
                Text(
                  'Foodies',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color.fromRGBO(255, 201, 41, 1),
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Find your own meals',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                usernameText(),
                passwordText(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    signUpButton(),
                    loginButton(),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Center(
                    child: Text(
                      'Forgot your password?',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
