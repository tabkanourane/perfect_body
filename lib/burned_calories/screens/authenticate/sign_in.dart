// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:perfect_body/burned_calories/services/auth.dart';
// import 'package:perfect_body/burned_calories/shared/loading.dart';
// import 'package:perfect_body/burned_calories/utilities/constants.dart';
// import 'package:flutter_signin_button/flutter_signin_button.dart';

// class SignIn extends StatefulWidget {
//   final Function toggleView;

//   SignIn({this.toggleView});

//   @override
//   _SignInState createState() => _SignInState();
// }

// class _SignInState extends State<SignIn> {
//   final AuthService _authService = AuthService();
//   final _formKey = GlobalKey<FormState>();
//   bool loading = false;

//   // text field state
//   String email = "";
//   String password = "";

//   String error = '';

//   bool _rememberMe = false;

//   Widget _buildEmail() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: <Widget>[
//         Text(
//           "Email",
//           style: kLabelStyle,
//         ),
//         SizedBox(
//           height: 10.0,
//         ),
//         Container(
//           decoration: kBoxDecorationStyle,
//           alignment: Alignment.centerLeft,
//           child: TextFormField(
// //            validator: (val) => val.isEmpty ? 'Enter an email' : null,
//             onChanged: (val) {
//               setState(() => email = val);
//             },
//             keyboardType: TextInputType.emailAddress,
//             style: TextStyle(color: Colors.black54),
//             decoration: InputDecoration(
//                 border: InputBorder.none,
//                 prefixIcon: Icon(
//                   Icons.email,
//                   color: Colors.black54,
//                 ),
//                 labelText: "Enter your email",
//                 hintStyle: kHintTextStyle),
//           ),
//         )
//       ],
//     );
//   }

//   Widget _buildPassword() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: <Widget>[
//         Text(
//           "Password",
//           style: kLabelStyle,
//         ),
//         SizedBox(
//           height: 10.0,
//         ),
//         Container(
//           decoration: kBoxDecorationStyle,
//           alignment: Alignment.centerLeft,
// //          decoration: kBoxDecorationStyle,
//           child: TextFormField(
// //            validator: (val) => val.isEmpty ? 'Enter a password' : null,
//             onChanged: (val) {
//               setState(() => password = val);
//             },
//             obscureText: true,
//             style: TextStyle(color: Colors.black54),
//             decoration: InputDecoration(
//                 errorStyle: TextStyle(fontSize: 15),
//                 border: InputBorder.none,
//                 contentPadding:
//                     EdgeInsets.symmetric(vertical: 14.0, horizontal: 14.0),
//                 prefixIcon: Icon(
//                   Icons.lock,
//                   color: Colors.black54,
//                 ),
//                 hintText: "Enter your password",
//                 hintStyle: kHintTextStyle),
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _buildForgotPasswordBtn() {
//     return Container(
//       alignment: Alignment.centerRight,
//       child: FlatButton(
//         onPressed: () => print("Forgot password button pressed"),
//         padding: EdgeInsets.only(right: 0.8),
//         child: Text(
//           "Forgot password",
//           style: kLabelStyle,
//         ),
//       ),
//     );
//   }

//   Widget _buildLoginBtn() {
//     return Container(
//       padding: EdgeInsets.symmetric(
//         vertical: 15.0,
//       ),
//       width: double.infinity,
//       child: RaisedButton(
//         elevation: 5.0,
//         onPressed: () async {
//           if (_formKey.currentState.validate()) {
//             setState(() => loading = true);
//             await _authService
//                 .signInWithEmailAndPassword(email, password)
//                 .catchError((exception) => setState(() {
//                       error =
//                           "Email or password is incorrect! Please try again or reset your password.";
//                       loading = false;
//                     }));
//           }
//         },
//         padding: EdgeInsets.all(15.0),
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(30.0),
//         ),
//         color: Theme.of(context).primaryColor,
//         child: Text(
//           "LOGIN",
//           style: TextStyle(
//             color: Colors.white,
//             letterSpacing: 1.5,
//             fontSize: 18.0,
//             fontWeight: FontWeight.bold,
//             fontFamily: "Comfortaa",
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildSignInwithFBGMBtn() {
//     return Column(
//       children: <Widget>[
//         Text(
//           "- or sign in with -",
//           style: TextStyle(
//             color: Colors.black,
//             fontWeight: FontWeight.normal,
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _buildRememberMeBtn() {
//     return Container(
//       height: 20.0,
//       child: Row(
//         children: <Widget>[
//           Theme(
//             data: ThemeData(
//                 unselectedWidgetColor: Theme.of(context).primaryColor),
//             child: Checkbox(
//               value: _rememberMe,
//               checkColor: Colors.white,
//               activeColor: Theme.of(context).primaryColor,
//               onChanged: (value) {
//                 setState(() {
//                   _rememberMe = value;
//                 });
//               },
//             ),
//           ),
//           Text(
//             "Remember me",
//             style: kLabelStyle,
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildSocialMediaButton(Function onTap, AssetImage logo) {
//     return GestureDetector(
//       onTap: () => onTap,
//       child: Container(
//         height: 60.0,
//         width: 60.0,
//         decoration: BoxDecoration(
//             shape: BoxShape.circle,
//             color: Colors.black54,
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.black26,
//                 offset: Offset(0.0, 2.0),
//                 blurRadius: 6.0,
//               ),
//             ],
//             image: DecorationImage(
//               image: logo,
//             )),
//       ),
//     );
//   }

//   Widget _buildSocialMediaColumn() {
//     return Padding(
//       padding: EdgeInsets.symmetric(vertical: 30.0),
//       child: Column(
//         children: <Widget>[
//           // TODO: connect with auth
//           SignInButton(
//             Buttons.GoogleDark,
//             onPressed: () {},
//           ),
//           SignInButton(
//             Buttons.Facebook,
//             onPressed: () {},
//           )
//         ],
//       ),
//     );
//   }

//   Widget _buildSignUpButton() {
//     return GestureDetector(
//       onTap: () => widget.toggleView(),
//       child: RichText(
//         text: TextSpan(
//           children: [
//             TextSpan(
//               text: 'Don\'t have an account? ',
//               style: TextStyle(
//                 color: Colors.black54,
//                 fontSize: 18.0,
//                 fontWeight: FontWeight.w400,
//               ),
//             ),
//             TextSpan(
//               text: 'Sign up',
//               style: TextStyle(
//                 color: Colors.white,
//                 fontSize: 18.0,
//                 fontWeight: FontWeight.bold,
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return loading
//         ? Loading()
//         : Scaffold(
//             body: AnnotatedRegion<SystemUiOverlayStyle>(
//               value: SystemUiOverlayStyle.light,
//               child: GestureDetector(
//                 onTap: () => FocusScope.of(context).unfocus(),
//                 child: Stack(
//                   children: <Widget>[
//                     Positioned.fill(
//                       child: Image.asset(
//                         "assets/welcomeback.png",
//                         fit: BoxFit.fitWidth,
//                         alignment: Alignment.bottomCenter,
//                       ),
//                     ),
// //                    Container(
// //                      height: double.infinity,
// //                      width: double.infinity,
// //                      decoration: BoxDecoration(
// //                        color: Colors.white,
// ////                        gradient: LinearGradient(
// ////                          begin: Alignment.topCenter,
// ////                          end: Alignment.bottomCenter,
// ////                          colors: [
// ////                            Color(0xFF4e878c),
// ////                            Color(0xFF65b891),
// ////                            Color(0xFF93e5ab),
// ////                          ],
// ////                        ),
// //                      ),
// //                    ),
//                     Container(
//                       height: double.infinity,
//                       child: SingleChildScrollView(
//                         physics: AlwaysScrollableScrollPhysics(),
//                         padding: EdgeInsets.symmetric(
//                             horizontal: 40.0, vertical: 120.0),
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: <Widget>[
//                             Column(
//                               children: <Widget>[
//                                 SizedBox(
//                                   width: double.infinity,
//                                   child: Text(
//                                     "Welcome Back",
//                                     style: TextStyle(
//                                         color: Colors.black,
//                                         fontFamily: "OpenSans",
//                                         fontSize: 30.0,
//                                         fontWeight: FontWeight.bold),
//                                     textAlign: TextAlign.left,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             SizedBox(
//                               height: 30.0,
//                             ),
//                             Form(
//                               key: _formKey,
//                               child: Column(
//                                 children: <Widget>[
//                                   _buildEmail(),
//                                   SizedBox(
//                                     height: 30.0,
//                                   ),
//                                   _buildPassword(),
//                                   _buildForgotPasswordBtn(),
//                                   _buildRememberMeBtn(),
//                                   _buildLoginBtn(),
//                                   Text(
//                                     error,
//                                     style: TextStyle(
//                                         color: Colors.red, fontSize: 16.0),
//                                   ),
//                                   SizedBox(
//                                     height: 13.0,
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             // _buildSignInwithFBGMBtn(),
//                             // _buildSocialMediaColumn(),
//                             _buildSignUpButton(),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           );
// //
// //// button for anon sign in
// ////        child: RaisedButton(
// ////          child: Text('Sign in'),
// ////          onPressed: () async {
// ////            dynamic result = await _authService.signInAnon();
// ////            if (result == null) {
// ////              print('Error signing in');
// ////            } else {
// ////              print('Signed in');
// ////              print(result.uid);
// ////            }
// ////          },
// ////        ),
// //      ),
// //    );
//   }
// }
