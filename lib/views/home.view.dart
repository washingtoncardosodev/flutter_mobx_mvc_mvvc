import 'package:flutter/material.dart';
import 'package:masterclass_flutter_mobx_mvc/stores/app.store.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    var store = Provider.of<AppStore>(context);
    
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Image.network(store.picture),
            Text(store.name),
            Text(store.email)
          ]
        )
      )
    );
  }
}