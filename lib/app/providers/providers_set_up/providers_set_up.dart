import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import '../../data/repository/auth/auth_repository_impl.dart';
import '../../data/repository/auth/auth_service_impl.dart';
import '../../providers/auth_view_model/auth_view_model.dart';

class ProvidersSetUp {
  static List<SingleChildWidget> providers = [
    ChangeNotifierProvider(
      create: (context) => AuthViewModel(
        AuthRepositoryImpl(
          FirebaseAuthService(FirebaseAuth.instance),
        ),
      ),
    ),
  ];
}
