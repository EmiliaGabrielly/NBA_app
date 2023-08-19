import 'package:NBA_app/model/team.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  List <Team> teams = [];

  //get teams 
  Future getTeams () async {
     var response = await http.get(Uri.https('balldontlie.io', 'api/v1/teams'));
    var responses = jsonDecode(response.body);  
     
     for (var eachTeam in jsonData ('data')) {
      final team = Team(
        abbreviation: eachTeam ['abbreviation'], 
         city: eachTeam ['city'],
         );
         teams.add(team);
    }
    print(teams.length);
  }


  @override
  Widget build(BuildContext context) {
     getTeams ();
    return Scaffold(  
      body: FutureBuilder(
        future: getTeams(),
        
        builder: (context, snapshot) {

          if ( snapshot.connectionState = ConnectionState.done) {
           return ListView.builder(
            itemCount: teams.length,
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(color: Colors.grey[200]) ,
                child: ListTile(
                  title: Text(teams [index].abbreviation) ,
                  subtitle:  Text(teams[index].city),
              
                ),
              );
            },
           );
          }

          else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          
        },
        ), 
    );
  }
}