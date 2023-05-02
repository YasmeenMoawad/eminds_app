import 'package:eminds_app/views/screens/books_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Login extends StatelessWidget {
   Login({Key? key}) : super(key: key);

  Color myHexColor = const Color(0xff06D6A0);
  String email = "";
  String pass = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Create Account",
              style: GoogleFonts.cairo(
                fontSize: 25,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 80,),
            Stack(
              alignment: Alignment.center,
              children: [
                ElevatedButton(onPressed: (){},
                  style: ButtonStyle(
                    fixedSize: MaterialStateProperty.all(Size(
                        MediaQuery.of(context).size.height, 50)),
                    backgroundColor:
                    MaterialStateProperty.all(Colors.white12),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          side: const BorderSide(color: Colors.transparent)),
                    ),
                  ),
                  child: Container(),

                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    style: const TextStyle(color: Colors.white),
                    decoration: const InputDecoration(labelText: "Email",fillColor: Colors.teal, labelStyle: TextStyle(fontSize: 20,color: Colors.white54),icon: Icon(Icons.email,color: Colors.white70),),
                    onChanged: (val){
                      email = val;
                    },
                  ),
                ),
              ],
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                ElevatedButton(onPressed: (){},
                  style: ButtonStyle(
                    fixedSize: MaterialStateProperty.all(Size(
                        MediaQuery.of(context).size.height, 50)),
                    backgroundColor:
                    MaterialStateProperty.all(Colors.white12),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          side: const BorderSide(color: Colors.transparent)),
                    ),
                  ),
                  child: Container(),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    style: const TextStyle(color: Colors.white),
                    decoration: const InputDecoration(labelText: "Password",fillColor: Colors.teal, labelStyle: TextStyle(fontSize: 20,color: Colors.white54),icon: Icon(Icons.vpn_key,color: Colors.white70),),
                    onChanged: (val){
                      pass = val;
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40,),
            ElevatedButton(
              onPressed: () async {
                final prefs = await SharedPreferences.getInstance();
                await prefs.setString('email', email);
                await prefs.setString('Pass', pass);

                try{
                  final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
                      email: email, password: pass);
                  if (credential.user != null) {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => BooksScreen()),);
                  }
                } on FirebaseAuthException catch (e) {
                  if (e.code == 'user-not-found') {
                    print('No user found for that email.');
                  } else if (e.code == 'wrong-password') {
                    print('Wrong password provided for that user.');
                  }
                  SnackBar snackBar = const SnackBar(
                    content: Text("password and email not valid"),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }
              },
              style: ButtonStyle(
                fixedSize: MaterialStateProperty.all(Size(
                    MediaQuery.of(context).size.height, 50)),
                backgroundColor:
                MaterialStateProperty.all(myHexColor),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      side: BorderSide(color: myHexColor)),
                ),
              ),
              child: Text("Start",style: GoogleFonts.cairo(
                fontSize: 22,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              )),
            ),
          ],
        ),
      ),
    );
  }
}
