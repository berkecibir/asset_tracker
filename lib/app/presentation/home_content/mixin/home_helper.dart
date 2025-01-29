import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/home_content_view_model/home_content_view_model.dart';
import '../page/home_page_content.dart';

mixin HomeHelper on State<HomePageContent> {
  @override
  void initState() {
    super.initState();
    final viewModel = Provider.of<HomeContentViewModel>(context, listen: false);
    viewModel.connectToSocket();
  }
}
