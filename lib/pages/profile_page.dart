import 'package:flutter/material.dart';
import 'package:flutter_codigo5_sp/utils/sp_global.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String fullName = "";
  String address = "";
  bool darkMode = false;
  int gender = 1;
  SPGlobal matasquita = SPGlobal();

  @override
  initState() {
    super.initState();
    //getData();
  }
/* 
  Future<void> getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    fullName = prefs.getString("fullName") ?? "";
    address = prefs.getString("address") ?? "";
    darkMode = prefs.getBool("darkMode") ?? false;
    gender = prefs.getInt("gender") ?? 1;
    setState(() {});
  } */

  Future<String> getDataTest() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("fullName") ?? "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: darkMode ? Colors.black : Colors.white,
      appBar: AppBar(
        backgroundColor: matasquita.darkMode ? Colors.black : Colors.pinkAccent,
        title: Text("Profile"),
      ),

      body: Center(
        child: Container(
          margin: const EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            color: Colors.pinkAccent.withOpacity(0.2),
            borderRadius: BorderRadius.circular(14.0),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: Icon(Icons.person),
                title: Text("❤️🔥#${matasquita.fullName}🔥❤️"),
                // title: Text(fullName),
                subtitle: Text("Full name"),
              ),
              ListTile(
                leading: Icon(Icons.location_on),
                title: Text(matasquita.address),
                // title: Text(address),
                subtitle: Text("Address"),
              ),
              ListTile(
                leading: Icon(Icons.dark_mode),
                title: Text(matasquita.darkMode ? "On" : "Off"),
                // title: Text(darkMode ? "On" : "Off"),
                subtitle: Text("Dark mode"),
              ),
              ListTile(
                leading: Icon(Icons.circle),
                title: Text(matasquita.gender == 1 ? "Male" : "Female"),
                // title: Text(gender == 1 ? "Male" : "Female"),
                subtitle: Text("Gender"),
              ),
            ],
          ),
        ),
      ),
      // body: FutureBuilder(
      //   future: getDataTest(),
      //   builder: (BuildContext context, AsyncSnapshot snap){
      //     if(snap.hasData){
      //       return Center(child: Text(snap.data));
      //     }
      //     return Center(
      //       child: Text("Cargando"),
      //     );
      //   },
      // ),
    );
  }
}
