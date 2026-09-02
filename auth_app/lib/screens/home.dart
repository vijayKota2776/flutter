import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
    Widget build (BuildContext context){
        return Scaffold(
            appBar:AppBar(
                title:Text("Home")
            ),
            body:Center(
                child:Column(
                    children:[
                        TextButton(
                            onPressed: () {
                                Navigator.of(context).pushNamed("/Register");
                            },
                            child: Text("Register"),
                        ),
                        TextButton(
                            onPressed: () {
                                Navigator.of(context).pushNamed("/Login");
                            },
                            child: Text("Login"),
                        ),
                    ]
                )
            )
        );
    }
}