import 'package:bloc_provider/bloc_provider.dart';
import 'package:flutter/material.dart';
import 'package:carts/bloc/shop_bloc_provider.dart';
import 'package:carts/services/service_provider.dart';
import 'package:carts/shop_list.dart';
import 'package:carts/constants.dart';

void main() => runApp(ServiceProvider(child: Carts()));

class Carts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProviderTree(
      blocProviders: [
        ShopBlocProvider(),
      ],
      child: MaterialApp(
        title: Constants.appTitle,
        theme: ThemeData(
          primarySwatch: Colors.blueGrey,
          dividerColor: Colors.teal,
        ),
        home: ShopList(),
      ),
    );
  }
}
