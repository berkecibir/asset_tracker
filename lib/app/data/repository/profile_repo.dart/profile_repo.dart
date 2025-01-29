import 'package:asset_tracker/app/core/utils/constants/app_texts.dart';
import 'package:asset_tracker/app/data/models/profile_model/profile_model.dart';

class ProfileRepo {
  ProfileModel getProfileInfo() {
    return const ProfileModel(AppTexts.userName);
  }
}
