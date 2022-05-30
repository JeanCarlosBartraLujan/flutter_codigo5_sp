import 'package:flutter/material.dart';
import 'package:flutter_codigo5_sp/pages/profile_page.dart';
import 'package:flutter_codigo5_sp/utils/sp_global.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //then
  //async - await

  int n = 10;

  TextEditingController _fullNameController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  bool darkMode = false;
  int gender = 1;
  SPGlobal mandarina = SPGlobal();

  @override
  initState() {
    super.initState();
    //_saveData();
    _getDataFull();
  }

  Future<int> getNumberMandarina() async {
    return Future.delayed(Duration(seconds: 3), () {
      return 100;
    });
  }

  _saveData() async {
    /* SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("fullName", _fullNameController.text);
    prefs.setString("address", _addressController.text);
    prefs.setBool("darkMode", darkMode);
    prefs.setInt("gender", gender);
    print("Guardando..."); */

    mandarina.fullName = _fullNameController.text;
    mandarina.address = _addressController.text;
    mandarina.darkMode = darkMode;
    mandarina.gender = gender;
  }

  _getDataFull() async {
    /*  SharedPreferences prefs = await SharedPreferences.getInstance();
    print(prefs.getString("fullName"));
    print(prefs.getString("address"));
    print(prefs.getBool("darkMode"));
    print(prefs.getInt("gender")); */

    /* _fullNameController.text = prefs.getString("fullName") ?? "";
    _addressController.text = prefs.getString("address") ?? "";
    darkMode = prefs.getBool("darkMode") ?? false;
    gender = prefs.getInt("gender") ?? 1; */

    _fullNameController.text = mandarina.fullName;
    _addressController.text = mandarina.address;
    darkMode = mandarina.darkMode;
    gender = mandarina.gender;
    //setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff262626),
        title: Text("Home"),
      ),
      drawer: Drawer(
        elevation: 0,
        child: Column(
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Color(0xff262626),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      "https://images.pexels.com/photos/1910236/pexels-photo-1910236.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"),
                ),
              ),
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    CircleAvatar(
                      radius: 28,
                      backgroundImage: NetworkImage(
                          "https://images.pexels.com/photos/1516680/pexels-photo-1516680.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940"),
                    ),
                    SizedBox(
                      height: 6.0,
                    ),
                    Text(
                      "Juan Ramón Lopez",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 18.0),
                    ),
                    Text(
                      "Administrador",
                      style: TextStyle(
                        color: Colors.white70,
                        fontWeight: FontWeight.w400,
                        fontSize: 14.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ProfilePage()));
              },
              leading: Icon(
                Icons.person,
              ),
              title: Text("My Profile"),
            ),
            ListTile(
              leading: Icon(
                Icons.file_copy,
              ),
              title: Text("Portfolio"),
            ),
            ListTile(
              leading: Icon(
                Icons.lock,
              ),
              title: Text("Change Password"),
            ),
            Divider(
              thickness: 0.6,
              indent: 12,
              endIndent: 12,
            ),
            ListTile(
              leading: Icon(
                Icons.exit_to_app,
              ),
              title: Text("Logout"),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Settings",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w500,
                color: Color(0xff424242),
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            TextField(
              controller: _fullNameController,
              decoration: InputDecoration(hintText: "Full name"),
            ),
            const SizedBox(
              height: 20.0,
            ),
            TextField(
              controller: _addressController,
              decoration: InputDecoration(hintText: "Address"),
            ),
            /* Switch(
              value: darkMode,
              onChanged: (bool value) {
                darkMode = value;
                setState(() {});
              },
            ), */
            const SizedBox(
              height: 20.0,
            ),
            SwitchListTile(
              title: Text("Dark Mode"),
              value: darkMode,
              onChanged: (bool value) {
                darkMode = value;
                // print(darkMode);
                setState(() {});
              },
            ),
            /*  Radio(
              value: 1,
              groupValue: 2,
              onChanged: (value) {},
            ),
            Radio(
              value: 2,
              groupValue: 2,
              onChanged: (value) {},
            ),
             */
            Text(
              "Gender",
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
            RadioListTile(
              title: Text("Male"),
              value: 1,
              groupValue: gender,
              onChanged: (int? value) {
                gender = value!;
                setState(() {});
              },
            ),
            RadioListTile(
              title: Text("Female"),
              value: 2,
              groupValue: gender,
              onChanged: (int? value) {
                gender = value!;
                setState(() {});
              },
            ),
            const SizedBox(
              height: 30.0,
            ),
            SizedBox(
              width: double.infinity,
              height: 50.0,
              child: ElevatedButton.icon(
                icon: Icon(Icons.save),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  primary: Colors.black87,
                ),
                onPressed: () {
                  n = 10000;
                  _saveData();
                },
                label: const Text(
                  "Save data",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



/* import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //String nombre = "No hay nombre";
  int n = 10;
  TextEditingController _fullNameController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  @override
  initState() {
    super.initState();
    //getData();
    _getDataFull();
  }

/*   getData() async {
    /* getName().then((value) {
      nombre = value;
      setState(() {});
    }); */

    nombre = await getName();
    setState(() {});
  } */

  Future<String> getName() async {
    return Future.delayed(Duration(seconds: 3), () {
      return "Manolo Rojas";
      //return 100;
    });
  }
/* 
  String getName2() {
    return "Jean";
  } */

  Future<List<String>> getProducts() async {
    print("Estoy en metodo get Product");
    return Future.delayed(Duration(seconds: 3), () {
      return [
        "Corbatas"
            "Camisas "
            "Polos"
            "Sacos"
      ];
    });
  }

  /*  _saveData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("fullName", "Jean Carlos Bartra Lujan");
    prefs.setInt("age", 20);

    print("Guardando..");
    String? name = prefs.getString("name") ?? "-";
    int age = prefs.getInt("age") ?? 0;
    print(name);
    print("Guadando...");
  } */
  /*   _getDataFull() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print(prefs.getString("name"));
    print(prefs.getInt("age"));
  } */
  _saveData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("fullName", _fullNameController.text);
    prefs.setString("address", _addressController.text);
    print("Guardando...");
    print(prefs.getString("fullName"));
    print(prefs.getString("address"));
  }

  _getDataFull() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _fullNameController.text = (prefs.getString("fullName")) ?? "FullName";
    _addressController.text = (prefs.getString("address")) ?? "address";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: Text("Home"),
      ),
      drawer: Drawer(
        elevation: 0,
        child: Column(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.pinkAccent,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      "https://images.pexels.com/photos/1910236/pexels-photo-1910236.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"),
                ),
              ),
              child: Container(
                width: 300,
                height: 200,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(
                          "https://images.pexels.com/photos/38554/girl-people-landscape-sun-38554.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"),
                    ),
                    Text(
                      "Nombre:Jean Bartra",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 18.0),
                    ),
                    Text(
                      "Phone:+51 980547988",
                      style: TextStyle(
                        color: Colors.white70,
                        fontWeight: FontWeight.w400,
                        fontSize: 14.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.person,
              ),
              title: Text("My Profile"),
            ),
            ListTile(
              leading: Icon(
                Icons.file_copy,
              ),
              title: Text("Portfolio"),
            ),
            ListTile(
              leading: Icon(
                Icons.lock,
              ),
              title: Text("Change Password"),
            ),
            Divider(
              thickness: 0.6,
              indent: 12,
              endIndent: 12,
            ),
            ListTile(
              leading: Icon(
                Icons.exit_to_app,
              ),
              title: Text("Logout"),
            ),
          ],
        ),
      ),

      /* body: FutureBuilder(
        future: getProducts(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          /*  print(snapshot.connectionState);

          print(snapshot.hasData);
          print(snapshot.data); */
          /*  return Center(
            child: CircularProgressIndicator(),
          ); */

          print(snapshot.connectionState);
          print(snapshot.hasData);
          print(snapshot.data);

          if (snapshot.hasData) {
            List<String> lista = snapshot.data;
            /* return ListView.builder(
              itemCount: lista.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(lista[index]),
                );
              },
            ); */
            return Center(
              child: ElevatedButton(
                onPressed: () {
                  setState(() {});
                },
                child: Text("Click"),
              ),
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
     */
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Settings",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w500,
                color: Color(0xff424242),
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            TextField(
              controller: _fullNameController,
              decoration: InputDecoration(hintText: "Full name"),
            ),
            const SizedBox(
              height: 20.0,
            ),
            TextField(
              controller: _addressController,
              decoration: InputDecoration(hintText: "Address"),
            ),
            const SizedBox(
              height: 30.0,
            ),
            SizedBox(
              width: double.infinity,
              height: 50.0,
              child: ElevatedButton.icon(
                icon: Icon(Icons.save),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  primary: Colors.black87,
                ),
                onPressed: () {
                  // _saveData();
                  _saveData();
                },
                label: const Text(
                  "Save data",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
 */