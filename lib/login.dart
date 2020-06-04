import 'package:flutter/material.dart';
import 'package:logintutorial/home.dart';


class LoginPage extends StatefulWidget {

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
   Map<int, Color> color =
  {
  50:Color.fromRGBO(136,14,79, .1),
  100:Color.fromRGBO(136,14,79, .2),
  200:Color.fromRGBO(136,14,79, .3),
  300:Color.fromRGBO(136,14,79, .4),
  400:Color.fromRGBO(136,14,79, .5),
  500:Color.fromRGBO(136,14,79, .6),
  600:Color.fromRGBO(136,14,79, .7),
  700:Color.fromRGBO(136,14,79, .8),
  800:Color.fromRGBO(136,14,79, .9),
  900:Color.fromRGBO(136,14,79, 1),
  };

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController user = new TextEditingController();
  TextEditingController pass = new TextEditingController();
  List data = List();
  String _username;

  _login() async {
  if(_formKey.currentState.validate()) {
    print(user.text);
    print(pass.text);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => HomePage()),
    );

    return null;

    }
      
  }

  Color gradientStart = Colors.lightBlue; //Change start gradient color here
  Color gradientEnd = Colors.blue[900]; //Change end gradient color here


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff397ba0),
      body: SingleChildScrollView(
      	child: Center(
	        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
	          children: <Widget>[
	            Container(
	              child: Stack(
	                children: <Widget>[
	                  Container(
                        height: MediaQuery.of(context).size.height*0.25,
                        width: MediaQuery.of(context).size.height*0.20,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                                'assets/images/daisyslogo.png'),
                          ),
                          shape: BoxShape.circle,
                        ),
                        margin: EdgeInsets.only(top: 120),
	                    ),
	                  
	                ],
	              ),
	            ),
	            Padding(
	              padding: EdgeInsets.only( left: 50.0, right: 50.0),
	              child: Column(
	                children: <Widget>[
	                  Container(
	                    decoration: BoxDecoration(
	                      color: Color(0xffabc5d3),
	                    ),
	                    child: Form(
                        key: _formKey,
                        autovalidate: true,
                        child: Column(
	                      children: <Widget>[
	                        Container(
	                          padding: EdgeInsets.symmetric(horizontal: 2.0, vertical: 2.0),
	                          decoration: BoxDecoration(
	                            border: Border(bottom: BorderSide(color: Colors.grey[400]))
	                          ),
	                          child: TextFormField(
                              textAlign: TextAlign.center,
                              autofocus: false,
                              controller: user,
                              validator: (value) {
                                if(value.length ==0 ){
                                  return 'Please insert username';
                                }
                              },
	                            decoration: InputDecoration(
	                              border: InputBorder.none,
	                              hintText: "Username",
	                              hintStyle: TextStyle(color: Colors.white)
	                            ),
	                          ),
	                        ),
	                        Container(
	                          padding: EdgeInsets.symmetric(horizontal: 2.0, vertical: 2.0),
	                          child: TextFormField(
                              textAlign: TextAlign.center,
                              autofocus: false,
                              obscureText: true,
                              controller: pass,
                              validator: (value) {
                                if(value.length ==0 ){
                                  return 'Please insert password';
                                }
                              },
	                            decoration: InputDecoration(
	                              border: InputBorder.none,
	                              hintText: "Password",
	                              hintStyle: TextStyle(color: Colors.white)
	                            ),
	                          ),
	                        )
	                      ],
	                    ),),
	                  ),
	                  Container(
	                    height: 50,
                      color: Color(0xff1d597b),
	                    child: InkWell(
                        child: Center(
	                      child: Text("LOGIN", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                       ),
                      onTap: () => {
                              print("Login tapped."),
                              _login(),
                            },
                      ),
	                  ),],
	              ),
	            )
	          ],
	        ),
	      ),
      )
    );
  }
}
