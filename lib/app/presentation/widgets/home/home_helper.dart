import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/home_view_model/home_view_model.dart';
import '../../home/page/home_page.dart';

mixin HomeHelper on State<HomePage> {
  @override
  void initState() {
    super.initState();
    final viewModel = Provider.of<HomeViewModel>(context, listen: false);
    viewModel.connectToSocket();
  }

  @override
  void dispose() {
    final viewModel = Provider.of<HomeViewModel>(context, listen: false);
    viewModel.disconnectFromSocket();
    super.dispose();
  }
}
