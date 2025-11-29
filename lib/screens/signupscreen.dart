import 'package:flutter/material.dart';
import 'package:khata_app/screens/loginscreen.dart';
import 'package:khata_app/screens/onboardingscreen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
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
        title: Text("Sign Up", style: TextStyle(color:Colors.black)),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40),

        
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
              controller: numbercontroller,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                hintText: "Number",
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

            SizedBox(height: 10),

           
            Row(
              children: [
                Checkbox(
                  value: agree,
                  onChanged: (v) {
                    setState(() => agree = v!);
                  },
                ),
                Expanded(
                  child: Text(
                    "By signing up, you agree to the Terms of Service and Privacy Policy",
                    style: TextStyle(fontSize: 12),
                  ),
                )
              ],
            ),

            SizedBox(height: 10),

          
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
                child: Text("Sign Up", style: TextStyle(fontSize: 16,color: Color(0xffFCFCFC))),
              ),
            ),

            SizedBox(height: 20),

            Center(child: Text("Or with")),

            SizedBox(height: 20),

        
            Container(
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:  [
                  Image.asset('assets/images/google.png'),
                  SizedBox(width: 4),
                  Text("Sign Up with Google"),
                ],
              ),
            ),

            SizedBox(height: 30),

            Padding(
              padding: EdgeInsets.only(left: 20),
              child: Row(
                children: [
                  Text('Already have an account ?',style: TextStyle(fontSize: 18,)),
                  SizedBox(width: 10,),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder:(context)=>LoginScreen()));
                    },
                    child: Text('Login',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: Color(0xff7F3DFF)),))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
