import 'package:flutter/material.dart';
import 'home.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController rollNoController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 240,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage("https://i.ytimg.com/vi/HEEKKebMuMc/maxresdefault.jpg"),
                    fit: BoxFit.cover,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black54,
                      offset: Offset(6, 10),
                      blurRadius: 12,
                    )
                  ],
                ),
              ),
              SizedBox(height: 25),
              Text(
                "Sign In",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 25),
              Container(
                width: 350,
                child: TextField(
                  controller: rollNoController,
                  onSubmitted: (value) {
                    // Perform any logic you want when the user submits the roll number field.
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    hintText: "Enter Roll No",
                    prefixIcon: Icon(Icons.person),
                  ),
                ),
              ),
              SizedBox(height: 25),
              Container(
                width: 350,
                child: TextField(
                  controller: passwordController,
                  obscureText: true,
                  onSubmitted: (value) {
                    // Perform login logic when the user submits the password field.
                    _handleLogin(context);
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    hintText: "Enter Password",
                    prefixIcon: Icon(Icons.lock),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: 350,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        // Perform login logic when the user clicks the submit button.
                        _handleLogin(context);
                      },
                      child: Text("Submit"),
                      style: ElevatedButton.styleFrom(
                        elevation: 18,
                        primary: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    SizedBox(width: 25),
                    ElevatedButton(
                      onPressed: () {
                        // Perform any cancel logic here.
                      },
                      child: Text("Cancel"),
                      style: ElevatedButton.styleFrom(
                        elevation: 18,
                        primary: Colors.redAccent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              TextButton(
                onPressed: () {
                  // Perform any logic for the "Forgot Password" button.
                },
                child: Text(
                  "Forgot Password?",
                  style: TextStyle(fontSize: 20, color: Colors.black54),
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage("https://1.bp.blogspot.com/-S8HTBQqmfcs/XN0ACIRD9PI/AAAAAAAAAlo/FLhccuLdMfIFLhocRjWqsr9cVGdTN_8sgCPcBGAYYCw/s1600/f_logo_RGB-Blue_1024.png"),
                    radius: 20,
                  ),
                  SizedBox(width: 15),
                  CircleAvatar(
                    backgroundImage: NetworkImage("https://th.bing.com/th/id/OIP.JtmXSh_uyZBaTg1eXd-NtgHaHa?pid=ImgDet&rs=1"),
                    radius: 20,
                  ),
                  SizedBox(width: 15),
                  CircleAvatar(
                    backgroundImage: NetworkImage("https://th.bing.com/th/id/OIP.H836RvDYYgQZcZn0TC8qBAHaHa?pid=ImgDet&rs=1"),
                    radius: 20,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _handleLogin(BuildContext context) {
    if (passwordController.text == "12345") {
      Navigator.push(context, MaterialPageRoute(builder: (context) => Homepage()));
    } else {
      // Show an error message or handle invalid password
      print("Invalid password");
    }
  }
}
