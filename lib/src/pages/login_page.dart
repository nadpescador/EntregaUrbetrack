import 'dart:ui';

import 'package:ejercicio_urbetrack/src/providers/login_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with TickerProviderStateMixin{
  
  AnimationController _controller;
  AnimationController _formController;
  Animation<Offset> _offsetAnimation;
  


  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..forward();
    _offsetAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(0.0, -3.5),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.decelerate,
    ));


  _formController = AnimationController(
      duration: const Duration(milliseconds: 2200),
      vsync: this,
    )..forward();
    
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
  

  @override
  Widget build(BuildContext context) {

  final loginProvider = Provider.of<LoginProvider>(context); 

    return Scaffold(
      body: SafeArea(
        top: true,
        child: Center(
          child: Stack(
            alignment: Alignment.center,
            children: [
              _loginForm(loginProvider),
              _logoAnimated(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _logoAnimated(){
      return Container(
        padding: EdgeInsets.only(bottom: 130),
        width: 350,
        child: SlideTransition(
        position: _offsetAnimation,
          child: FadeTransition(
            opacity: _controller,
            child: Image.asset('lib/src/resources/assets/images/urbelogo.png'),
          )
        ),
      );
  }

  Widget _loginForm(loginProvider){
    return  FadeTransition(
      opacity: _formController,
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 5,
              sigmaY: 5,
            ),
              child: Container(
              alignment: Alignment.center,
              height: 370,
              width: 330,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    spreadRadius: 2,
                    blurRadius: 11,
                  )
                ],
                borderRadius: BorderRadius.circular(5)
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Text("Logueo de usuario", style: TextStyle(fontSize: 20, color: Colors.deepPurple)),
                    _nameForm(loginProvider),
                    _passwordForm(loginProvider),
                    _loginButton(loginProvider),
              ],
            ),
        ),
      ),
          ),
    );
  }

  Widget _nameForm(loginProvider) {
    return Container(
      padding: EdgeInsets.all(20.0),
      child: TextField(
        onChanged: (value) => {
          loginProvider.setUsername(value)
        },
        maxLength: 10,
        decoration: InputDecoration(
          labelText: "Usuario",
          hintText: "Santiago",
          errorText:  loginProvider.getUsername.error,
          icon: Icon(Icons.account_circle, color: Colors.deepPurple[300]),
          focusColor: Colors.blue
        ),
      ),
    );  
  }

  Widget _passwordForm(loginProvider){
        return Container(
          padding: EdgeInsets.all( 20.0),
          child: TextField(
            obscureText: true,
            maxLength: 10,
            onChanged: (value) => {
              loginProvider.setPassword(value)             
            },
            decoration: InputDecoration(
              labelText: "Password",
              hintText: "123456",
              errorText: loginProvider.getPassword.error,
              icon: Icon(Icons.lock, color: Colors.deepPurple[300]),
              focusColor: Colors.blue
            ),
          ),
          
        );
    
  }

  Widget _loginButton(loginProvider){
           return FlatButton(
            onPressed: () {
                loginProvider.validatePassword(loginProvider.getPassword.value);
                loginProvider.getSuccesfullLogin==true&&loginProvider.getUsername.value!=null?Navigator.pushNamed(context, 'home'):null;
              },
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.deepPurple,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text("LOGIN", style: TextStyle(color: Colors.white),),
      ));
      }

  }


   







