import 'package:books_app/services/connectivity_status.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NetworkSensitive extends StatelessWidget {
  final Widget child;
  final Widget offlineChild;
  NetworkSensitive({
    @required this.child,
    @required this.offlineChild,
  });

  @override
  Widget build(BuildContext context) {
    var connectionStatus = Provider.of<ConnectivityStatus>(context);
    if (connectionStatus == ConnectivityStatus.Offline) {
      return offlineChild;
    } else {
      return child;
    }
  }
}
