// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:flutter/material.dart';
// import 'package:jomtadarrus/animation.dart';
// import 'package:jomtadarrus/dashboard.dart';
// import 'package:jomtadarrus/models/target.dart';
// import 'package:jomtadarrus/newtarget.dart';
// import 'package:jomtadarrus/register.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         primaryColor: Colors.black,
//       ),
//       home: MyHomePage(),
//     );
//   }
// }


// String username="";
// class MyHomePage extends StatelessWidget {
//   // This widget is the root of your application.
  
//   Map<int, Color> color =
//   {
//   50:Color.fromRGBO(136,14,79, .1),
//   100:Color.fromRGBO(136,14,79, .2),
//   200:Color.fromRGBO(136,14,79, .3),
//   300:Color.fromRGBO(136,14,79, .4),
//   400:Color.fromRGBO(136,14,79, .5),
//   500:Color.fromRGBO(136,14,79, .6),
//   600:Color.fromRGBO(136,14,79, .7),
//   700:Color.fromRGBO(136,14,79, .8),
//   800:Color.fromRGBO(136,14,79, .9),
//   900:Color.fromRGBO(136,14,79, 1),
//   };

  

//   @override
//   Widget build(BuildContext context) {
//     // MaterialColor colorCustom = MaterialColor(0xFF94130D, color);
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
      
//       title: 'Fabtech',
//       // theme: ThemeData(
//       //   primarySwatch: colorCustom,
//       // ),
//       home: new HomePage(),
//       routes: <String,WidgetBuilder>{
//         '/TargetPage' : (BuildContext context)=> new TargetPage(),
//         '/DashboardPage' : (BuildContext context)=> new DashboardPage(),
//       },
//     );
//   }
// }


//  class HomePage extends StatefulWidget {
  
//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {

//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//   TextEditingController user = new TextEditingController();
//   TextEditingController pass = new TextEditingController();
//   List data = List();
//   String _username;
// Future<List> _login() async {
//   if(_formKey.currentState.validate()) {
//     print(user.text);
//     print(pass.text);
//     final response = await http.post("http://146.148.57.102/tadarrus/api/login.php", body: {
//       "username" : user.text,
//       "password" : pass.text,
//     });

    
//     print(response.body);
//     print(response.statusCode);
    
//     if(response.statusCode == 200){
//       print("here");
//       setState((){
//         username = user.text;
//       });
//       getData();

//     }
//     else{
//       _showAlertDialog('Oopss!', 'Username/password does not match');
//     }

//     return null;

//     }
      
//   }

//   Future<List<Target>> getData() async {
//     print(user.text);
//     setState(() {
//       _username=user.text;
//     });
//     print(_username);
//     var response = await http.get(
//             'http://146.148.57.102/tadarrus/api/readone_target.php?username=$_username')
//       ;

//     if (response.statusCode == 200) {
//       print(response.body);
//       Navigator.pushReplacementNamed(context, '/DashboardPage');
//       return null;
//     } else {
//       print(response.statusCode);
//       Navigator.pushReplacementNamed(context, '/TargetPage');
//       return null;
//     }
//   }

//   void _showAlertDialog(String title, String message) {

//        showDialog(
//           context: context,
//           builder: (context) {
//           Future.delayed(Duration(seconds: 5), () {
//             Navigator.of(context).pop(true);
            
//             });
//           return AlertDialog(
//             shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(10.0),
//             ), 
//             title: Text(title),
//             content: Text(message),
//           );
//           });
// 	}

//   Color gradientStart = Colors.lightBlue; //Change start gradient color here
//   Color gradientEnd = Colors.blue[900]; //Change end gradient color here


//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SingleChildScrollView(
//       	child: Container(
// 	        child: Column(
// 	          children: <Widget>[
// 	            Container(
// 	              child: Stack(
// 	                children: <Widget>[
// 	                  FadeAnimation(1.6, Container(
//                         height: 250,
//                         width: 300,
//                         decoration: BoxDecoration(
//                           image: DecorationImage(
//                             image: AssetImage('assets/images/logo.png'),
//                             fit: BoxFit.fill
//                           )
//                         ),
// 	                      margin: EdgeInsets.only(top: 50),
// 	                    )),
	                  
// 	                ],
// 	              ),
// 	            ),
// 	            Padding(
// 	              padding: EdgeInsets.all(30.0),
// 	              child: Column(
// 	                children: <Widget>[
// 	                  FadeAnimation(1.8, Container(
// 	                    padding: EdgeInsets.all(5),
// 	                    decoration: BoxDecoration(
// 	                      color: Colors.white,
// 	                      borderRadius: BorderRadius.circular(10),
// 	                      boxShadow: [
// 	                        BoxShadow(
// 	                          color: Color.fromRGBO(143, 148, 251, .2),
// 	                          blurRadius: 20.0,
// 	                          offset: Offset(0, 10)
// 	                        )
// 	                      ]
// 	                    ),
// 	                    child: Form(
//                         key: _formKey,
//                         autovalidate: true,
//                         child: Column(
// 	                      children: <Widget>[
// 	                        Container(
// 	                          padding: EdgeInsets.all(8.0),
// 	                          decoration: BoxDecoration(
// 	                            border: Border(bottom: BorderSide(color: Colors.grey[100]))
// 	                          ),
// 	                          child: TextFormField(
//                               autofocus: false,
//                               controller: user,
//                               validator: (value) {
//                                 if(value.length ==0 ){
//                                   return 'Please insert username';
//                                 }
//                               },
// 	                            decoration: InputDecoration(
// 	                              border: InputBorder.none,
// 	                              hintText: "Username",
// 	                              hintStyle: TextStyle(color: Colors.grey[400])
// 	                            ),
// 	                          ),
// 	                        ),
// 	                        Container(
// 	                          padding: EdgeInsets.all(8.0),
// 	                          child: TextFormField(
//                               autofocus: false,
//                               obscureText: true,
//                               controller: pass,
//                               validator: (value) {
//                                 if(value.length ==0 ){
//                                   return 'Please insert password';
//                                 }
//                               },
// 	                            decoration: InputDecoration(
// 	                              border: InputBorder.none,
// 	                              hintText: "Password",
// 	                              hintStyle: TextStyle(color: Colors.grey[400])
// 	                            ),
// 	                          ),
// 	                        )
// 	                      ],
// 	                    ),),
// 	                  )),
// 	                  SizedBox(height: 30,),
// 	                  FadeAnimation(2, Container(
// 	                    height: 50,
// 	                    decoration: BoxDecoration(
// 	                      borderRadius: BorderRadius.circular(10),
// 	                      gradient: LinearGradient(
// 	                        colors: [
// 	                          // Color.fromRGBO(143, 148, 251, 1),
// 	                          // Color.fromRGBO(143, 148, 251, .6),
//                             gradientStart,
//                             gradientEnd,
// 	                        ]
// 	                      )
// 	                    ),
// 	                    child: InkWell(
//                         child: Center(
// 	                      child: Text("Login", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
//                        ),
//                       onTap: () => {
//                               print("Login tapped."),
//                               _login(),
//                             },
//                       ),
// 	                  )),
//                     SizedBox(height: 30,),
//                     FadeAnimation(2, InkWell(
//                             child: Text("New user? Click here to register", style: TextStyle(color: Colors.black),),
//                             onTap: (){
//                               Navigator.push(
//                                 context,
//                                 MaterialPageRoute(builder: (context) => RegisterPage()),
//                               );
//                             },
//                           ),),
// 	                  SizedBox(height: 50,),],
// 	              ),
// 	            )
// 	          ],
// 	        ),
// 	      ),
//       )
//     );
//   }
// }