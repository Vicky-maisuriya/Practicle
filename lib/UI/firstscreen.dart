import 'package:Practical/UI/secondscreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FirstScreen extends StatefulWidget {

  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  final _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  dynamic number;
  TextEditingController numCnt = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(title: Text('First Screen'),backgroundColor: Colors.grey,),
      body: _home(),
    );
  }

  Widget _home(){
    return Container(
      padding: EdgeInsets.all(20),
      child: Center(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.arrow_forward),
                    hintText: 'Enter number',
                    enabledBorder: OutlineInputBorder(
                      borderSide: new BorderSide(
                          color: Theme.of(context)
                              .primaryColor
                              .withOpacity(0.3),
                          width: 2.0),
                    ),
                    border: new OutlineInputBorder(
                      borderSide: new BorderSide(
                          color: Theme.of(context)
                              .primaryColor
                              .withOpacity(0.3),
                          width: 2.0),
                    ),
                    errorStyle: TextStyle(fontSize: 11)),
                controller: numCnt,
                validator: validateNumber,
                keyboardType: TextInputType.number,
                onSaved: (String val) {
                  setState(() {
                    number = val;
                  });
                },
              ),
              SizedBox(height: 20,),
              ButtonTheme(
                height: 50.0,
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      side: BorderSide(
                          color: Theme.of(context).primaryColor)),
                  color: Theme.of(context).primaryColor,
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      if (this.mounted) {
                        _formKey.currentState.save();
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (BuildContext context) =>
                                SecondScreen(number: number)));
                      }
                    }
                  },
                  child: Text(
                    'Submit',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      )
    );
  }

  String validateNumber(String value) {
    String patttern = r'(^[0-9]*$)';
    RegExp regExp = new RegExp(patttern);
    if (value.length == 0)
      return "Please enter number";
    else if (value == '1' || value == '2')
      return 'Please enter minimum 3 number';
    else if (!regExp.hasMatch(value))
      return "Number must be digits";
    else
      return null;
  }
}
