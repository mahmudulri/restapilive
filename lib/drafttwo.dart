// class _FormFieldSampleState extends State<FormFieldSample> {

//   // Initially password is obscure
//   bool _obscureText = true;

//   String _password;

//   // Toggles the password show status
//   void _toggle() {
//     setState(() {
//       _obscureText = !_obscureText;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return  Scaffold(
//       appBar:  AppBar(
//         title:  Text("Sample"),
//       ),
//       body:  Container(
//         child:  Column(
//           children: <Widget>[
//              TextFormField(
//               decoration:  InputDecoration(
//                   labelText: 'Password',
//                   icon:  Padding(
//                       padding:  EdgeInsets.only(top: 15.0),
//                       child:  Icon(Icons.lock))),
//               validator: (val) => val.length < 6 ? 'Password too short.' : null,
//               onSaved: (val) => _password = val,
//               obscureText: _obscureText,
//             ),
//              FlatButton(
//                 onPressed: _toggle,
//                 child: new Text(_obscureText ? "Show" : "Hide"),
//                 ),
//           ],
//         ),
//       ),
//     );
//   }
// }