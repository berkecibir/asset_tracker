import 'package:asset_tracker/app/providers/auth_view_model/auth_view_model.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../../data/repository/auth/auth_repository_impl.dart';

class ProvidersSetUp {
  static List<SingleChildWidget> providers = [
    ChangeNotifierProvider(
      create: (context) => AuthViewModel(AuthRepositoryImpl()),
    ),
  ];
}
