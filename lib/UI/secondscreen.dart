import 'package:flutter/material.dart';

class SecondScreen extends StatefulWidget {

  dynamic number;
  SecondScreen({this.number});

  @override
  _SecondScreenState createState() => _SecondScreenState(countNumber: number);
}

class _SecondScreenState extends State<SecondScreen> {

  dynamic countNumber;
  _SecondScreenState({this.countNumber});

  int index = 0;
  int unselectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Second Screen'),backgroundColor: Colors.grey,),
      body: _home(),
    );
  }

  Widget _home(){
    return CustomScrollView(
      physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
      slivers: <Widget>[
        SliverList(delegate: SliverChildListDelegate([
          Container(
            child: Center(
                child: Wrap(
                  children: _buildList(),
                )
            ),
          )
        ],)),
      ],
    );
  }

  List<Widget> _buildList() {
    List<Widget> listItems = List();
    for(var i=0; i<int.parse(countNumber); i++)
      listItems.add(
        RaisedButton(
          shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(30.0),
          ),
          onPressed: () {
            if(this.mounted){
              setState(() {
                unselectedIndex = index;
                index = i;
              });
            }
          },
          child: Text('${i+1}', style: TextStyle(color: Colors.white),),
          color: (index == i) ? Colors.blue : (i == unselectedIndex) ? Colors.red : Colors.grey,
        ),
      );

    listItems.add(SizedBox(
      height: 15,
    ));
    return listItems;
  }
}
