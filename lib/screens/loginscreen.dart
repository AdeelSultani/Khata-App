import 'package:flutter/material.dart';
import 'package:khata_app/screens/onboardingscreen.dart';
import 'package:khata_app/screens/signupscreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController namecontroller=TextEditingController();
  TextEditingController numbercontroller=TextEditingController();
  TextEditingController passwordcontroller=TextEditingController();
  bool passwordVisible = false;
  bool agree = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: GestureDetector(
          onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>OnboardingScreen()));
          },
          child: Icon(Icons.arrow_back, color: Colors.black)),
        title: Text("Login", style: TextStyle(color:Colors.black)),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 100),

        
            TextField(
              controller: namecontroller,
              decoration: InputDecoration(
                hintText: "Name",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),


            SizedBox(height: 15),

            
            TextField(
              controller: passwordcontroller,
              obscureText: !passwordVisible,
              decoration: InputDecoration(
                hintText: "Password",
                suffixIcon: IconButton(
                  icon: Icon(
                    passwordVisible ? Icons.visibility : Icons.visibility_off,
                  ),
                  onPressed: () {
                    setState(() {
                      passwordVisible = !passwordVisible;
                    });
                  },
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),

            SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurpleAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {},
                child: Text("Login", style: TextStyle(fontSize: 16,color: Color(0xffFCFCFC))),
              ),
            ),

            SizedBox(height: 20),

            Center(child: Text("Forget Password?",style: TextStyle(fontWeight: FontWeight.bold,color: Color(0xff7F3DFF),fontSize: 18),)),

            SizedBox(height: 40),

           Padding(
            padding: EdgeInsets.only(left: 80),
             child: Row(children: [
              Text("Dont have an account?",style: TextStyle(fontSize: 15),),
              SizedBox(width: 5,),
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder:(context)=>SignUpScreen()));
                },
                child: Text('Signup',style: TextStyle(fontWeight: FontWeight.bold,color: Color(0xff7F3DFF)),))
             ],),
           )
          ],
        ),
      ),
    );
  }
}
