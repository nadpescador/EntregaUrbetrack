import 'dart:async';

import 'package:ejercicio_urbetrack/src/blocs/login_bloc.dart';
import 'package:ejercicio_urbetrack/src/blocs/provider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;



void main() {
  runApp(MaterialApp(
    home: HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => new HomePageState();
}

class HomePageState extends State<HomePage> {

ScrollController _scrollController = new ScrollController();

  List<int> _numeros = new List();
  int _ultimoItem=0;
  bool _isLoading = false;



  @override
  void initState() {
    
    super.initState();
    _agregar10();

    _scrollController.addListener(() {
      if(_scrollController.position.pixels == _scrollController.position.maxScrollExtent){
        //_agregar10();
        fetchData();
      }

    });
  }


  @override
  Widget build(BuildContext context) {

    final _bloc = Provider.of(context);

    return Scaffold(
      appBar: AppBar(backgroundColor:Colors.deepPurpleAccent),
      drawer: _drawer(_bloc),
      body: Center(
        child: Container(
          child: _crearLista(),
        ),
      )
    );
  }


    Widget _drawer(LoginBloc _bloc ){
    return Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.supervised_user_circle, color: Colors.deepPurpleAccent),
                  SizedBox(width: 10),
                  Text(_bloc.username, style: TextStyle(fontSize: 35, color: Colors.deepPurpleAccent),),
                ],
              )),
              ListTile(
                title: Text("DarkMode"),
              ),
              Divider(thickness: 0.5),
              ListTile(
                title: Text("Salir de la app"),
                onTap: () => Navigator.pushNamed(context, "login"),
              ),
          ],
        ));
      }

   _agregar10(){
    for (var i=1;i<=10;i++){
      _ultimoItem++;
      _numeros.add(_ultimoItem);
    }
    setState(() {
      
    });
  }

    Future <Null> fetchData() async {

    _isLoading = true;
    setState(() {});
      final _duration = new Duration(seconds: 2);
      return new Timer(_duration, respuestaHTTP);
  }

  void respuestaHTTP(){

    _isLoading = false;

    _agregar10();

  }

  _crearLista() {
    return RefreshIndicator(
        onRefresh: obtenerPagina1,
        child: ListView.builder(
        controller: _scrollController,
        itemCount: _numeros.length,
        itemBuilder: (BuildContext context, int index){

          final imagen = _numeros[index];
          
          return FadeInImage(
           placeholder: AssetImage("lib/src/resources/assets/images/25.gif"),
           image: NetworkImage("https://picsum.photos/id/${_numeros[index]}/450/300"),
           );
        }),
    );
  }

 Future<Null> obtenerPagina1() async{

      final duration = new Duration( seconds:  2);
       new Timer(duration, (){
        _numeros.clear();
        _ultimoItem++;
        _agregar10();
      });

  return Future.delayed(duration);
  }
}




  
  


  