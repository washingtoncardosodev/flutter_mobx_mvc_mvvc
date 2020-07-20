

import 'package:masterclass_flutter_mobx_mvc/models/user.model.dart';
import 'package:masterclass_flutter_mobx_mvc/view-models/signup.viewmodel.dart';

class AccountRepository {

  Future<UserModel> createAccout(SignupViewModel model) async {
    await Future.delayed(Duration(milliseconds: 1500));
    return new UserModel(
      id: "1", 
      name: "Washington", 
      email: "washington.card@gmail.com",
      picture: "https://picsum.photos/200/200",
      role: "student",
      token: "xpto" 
    );
  }

}