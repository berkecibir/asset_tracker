import 'package:asset_tracker/app/data/repository/user_asset/firebase_user_asset_repository/firebase_user_asset_repository.dart';
import 'package:asset_tracker/app/providers/add_asset_view_model/add_asset_view_model.dart';
import 'package:asset_tracker/app/providers/home_page_view_model/home_page_view_model.dart';
import 'package:asset_tracker/app/providers/profile_view_model/profile_view_model.dart';
import 'package:asset_tracker/app/providers/user_asset_view_model/user_asset_view_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import '../../data/repository/assets/websocket_service_impl.dart'
    as repo_websocket;
import '../../data/repository/assets/websokcet_repository.dart';
import '../../data/repository/auth/auth_repository_impl.dart';
import '../../data/repository/auth/auth_service_impl.dart';

import '../../providers/auth_view_model/auth_view_model.dart';
import '../home_content_view_model/home_content_view_model.dart';

class ProvidersSetUp {
  static List<SingleChildWidget> providers = [
    ChangeNotifierProvider(
      create: (context) => AuthViewModel(
        AuthRepositoryImpl(
          FirebaseAuthService(FirebaseAuth.instance),
        ),
      ),
    ),
    ChangeNotifierProvider(
      create: (context) => HomeContentViewModel(
        repo_websocket.WebSocketService(),
        AssetsRepository(),
      ),
    ),
    ChangeNotifierProvider(create: (_) => ProfileViewModel()),
    ChangeNotifierProvider(create: (_) => HomePageViewModel()),
    ChangeNotifierProvider(create: (_) => AddAssetViewModel()),
    ChangeNotifierProvider(
        create: (_) => UserAssetViewModel(
            FirebaseUserAssetRepository(FirebaseFirestore.instance))),
  ];
}
