import 'package:flutter/material.dart';

import 'repository.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'انتخاب گر استان و شهر',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  DataRepository repo = DataRepository();

  List<String> _provinces = ["انتخاب استان"];
  List<String> _cities = ["انتخاب"];
  String _selectedProvince = "انتخاب استان";
  String _selectedCity = "انتخاب";

  @override
  void initState() {
    _provinces = List.from(_provinces)..addAll(repo.getStates());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 50, vertical: 30),
          child: Column(
            children: <Widget>[
              DropdownButton<String>(
                isExpanded: true,
                items: _provinces.map((String dropDownStringItem) {
                  return DropdownMenuItem<String>(
                    value: dropDownStringItem,
                    child: Text(dropDownStringItem),
                  );
                }).toList(),
                onChanged: (value) => _onSelectedProvince(value),
                value: _selectedProvince,
              ),
              DropdownButton<String>(
                isExpanded: true,
                items: _cities.map((String dropDownStringItem) {
                  return DropdownMenuItem<String>(
                    value: dropDownStringItem,
                    child: Text(dropDownStringItem),
                  );
                }).toList(),
                onChanged: (value) => _onSelectedCity(value),
                value: _selectedCity,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onSelectedProvince(String value) {
    setState(() {
      _selectedCity = "انتخاب";
      _cities = ["انتخاب"];
      _selectedProvince = value;
      _cities = List.from(_cities)..addAll(repo.getByProvince(value));
    });
  }

  void _onSelectedCity(String value) {
    setState(() => _selectedCity = value);
  }
}
