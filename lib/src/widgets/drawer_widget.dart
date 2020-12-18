import 'package:ejercicio_urbetrack/src/blocs/theme_controller.dart';
import 'package:ejercicio_urbetrack/src/pages/LoginPage/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DrawerWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final _loginController = Provider.of<LoginController>(context);
    final _theme         = Provider.of<ThemeController>(context);

    return Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.supervised_user_circle, color: Colors.deepPurpleAccent),
                  SizedBox(width: 10),
                  Text(_loginController.getUsername.value??'', style: TextStyle(fontSize: 35, color: Colors.deepPurpleAccent),),
                ],
              )),
              ListTile(
                leading: Icon(Icons.brush),
                title: Text(_theme.darkLight),
                onTap: () {

                    _theme.changeDarkAndWhite(context);
                
                }
              ),
              
              Divider(thickness: 0.5),
              ListTile(
                leading: Icon(Icons.vpn_key),
                title: Text("Salir de la app"),
                onTap: () {   
                  logoutCode(context, _loginController, _theme);
                } 
              ),
          ],
        ));
  }

  void logoutCode(BuildContext context, LoginController _loginController, ThemeController _theme ){
    Navigator.pushNamedAndRemoveUntil(context, 'login', (route) => false);
                  _loginController.clearPassword();
                  _loginController.clearSuccesfullLogin();
                  _loginController.clearUsername();
                  _theme.setTheme(ThemeData.light());
                  _theme.setDarkLight("Cambiar a modo oscuro");
  }


 
}

 