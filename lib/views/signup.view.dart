import 'package:flutter/material.dart';
import 'package:masterclass_flutter_mobx_mvc/controllers/signup.controller.dart';
import 'package:masterclass_flutter_mobx_mvc/view-models/signup.viewmodel.dart';
import 'package:masterclass_flutter_mobx_mvc/views/home.view.dart';
import 'package:masterclass_flutter_mobx_mvc/stores/app.store.dart';
import 'package:provider/provider.dart';

class SignupView extends StatefulWidget {
  
  @override
  _SignupViewState createState() => _SignupViewState();

}

class _SignupViewState extends State<SignupView> {
  final _formKey = GlobalKey<FormState>();
  final _controller = new SignupController();
  var model = new SignupViewModel();
  

  @override
  Widget build(BuildContext context) {
    
    var store = Provider.of<AppStore>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Signup"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(40.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: "Nome",
                    labelStyle: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.w400,
                      fontSize: 16.0 
                    )
                  ),
                  validator: (value){
                    if (value.isEmpty) {
                      return "Nome inválido";
                    }
                    return null;
                  },
                  onSaved: (val) {
                    model.name = val; 
                  },                  
                ),
                TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: "Email",
                    labelStyle: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.w400,
                      fontSize: 16.0 
                    )
                  ),
                  validator: (value){
                    if (value.isEmpty) {
                      return "Email inválido";
                    }
                    return null;
                  },
                  onSaved: (val) {
                    model.email = val;
                  },                  
                ),
                TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: "Senha",
                    labelStyle: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.w400,
                      fontSize: 16.0 
                    )
                  ),
                  validator: (value){
                    if (value.isEmpty) {
                      return "Senha inválida";
                    }
                    return null;
                  },
                  onSaved: (val){
                    model.password = val;
                  },                  
                ),
                SizedBox(height: 40.0),
                RaisedButton(
                  child: model.loading 
                  ? Container(height: 15.0, width: 15.0, child: CircularProgressIndicator(backgroundColor: Colors.white)) 
                  : Text("Cadastrar"),
                  color: Theme.of(context).primaryColor,
                  textColor: Colors.white,
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      _formKey.currentState.save();
                    }

                    setState(() {
                      _controller.create(model).then((user) {
                        setState(() {});
                        store.setUser(user.name, user.email, user.picture, user.token);
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => HomeView())
                        );
                      });

                    });
  
                    
                  }
                )
              ]
            )
          ),
        )
      )
    );
  }
}