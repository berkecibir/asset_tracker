import 'package:asset_tracker/app/presentation/profile/page/profile_page.dart';
import 'package:asset_tracker/app/providers/auth_view_model/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/profile_view_model/profile_view_model.dart';

mixin ProfileMixin on State<ProfilePage> {
  late ProfileViewModel profileViewModel;
  late AuthViewModel authViewModel;

  @override
  void initState() {
    super.initState();
    profileViewModel = Provider.of<ProfileViewModel>(context, listen: false);
    authViewModel = Provider.of<AuthViewModel>(context, listen: false);
  }
}
