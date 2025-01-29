import 'package:asset_tracker/app/core/utils/constants/app_texts.dart';
import 'package:asset_tracker/app/data/models/profile_model/profile_model.dart';
import 'package:asset_tracker/app/data/repository/profile_repo.dart/profile_repo.dart';
import 'package:flutter/material.dart';

class ProfileViewModel extends ChangeNotifier {
  var profileRepo = ProfileRepo();
  ProfileModel? profileModel;

  final List<Map<String, dynamic>> items = [
    {AppTexts.title: AppTexts.editProfile, AppTexts.icon: Icons.edit},
    {AppTexts.title: AppTexts.report, AppTexts.icon: Icons.bug_report},
    {AppTexts.title: AppTexts.logOut, AppTexts.icon: Icons.logout},
  ];

  ProfileViewModel() {
    catchUserPRofile();
  }

  void catchUserPRofile() {
    profileModel = profileRepo.getProfileInfo();
    notifyListeners();
  }
}
