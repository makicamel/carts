import 'package:flutter/material.dart';
import 'package:bloc_provider/bloc_provider.dart';
import 'package:carts/bloc/shop_bloc.dart';

class ShopBlocProvider extends BlocProvider<ShopBloc> {
  ShopBlocProvider({@required Widget child})
      : super(
            child: child,
            creator: (context, _bag) {
              assert(context != null);
              return ShopBloc();
            });

  static ShopBloc of(BuildContext context) => BlocProvider.of(context);
}
