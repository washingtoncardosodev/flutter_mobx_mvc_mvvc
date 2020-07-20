import 'package:masterclass_flutter_mobx_mvc/models/user.model.dart';
import 'package:masterclass_flutter_mobx_mvc/repositories/account.repository.dart';
import 'package:masterclass_flutter_mobx_mvc/view-models/signup.viewmodel.dart';

class SignupController {

  AccountRepository repository;

  SignupController(){
    repository = new AccountRepository();
  }

  Future<UserModel> create(SignupViewModel model) async {
    model.loading = true;
    var user = await repository.createAccout(model);
    model.loading = false;
    return user;
  }

}