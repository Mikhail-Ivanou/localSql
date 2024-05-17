import 'package:get_it/get_it.dart';
import 'package:local_sql/data/db/db.dart';
import 'package:local_sql/state/main/main_bloc.dart';
import 'package:local_sql/state/order/order_bloc.dart';
import 'package:local_sql/state/reports/reports_bloc.dart';
import 'package:local_sql/state/splash/splash_bloc.dart';

final injector = GetIt.instance;

void initInjector() {
  final database = MainDatabase();

  injector.registerFactory<SplashBloc>(() => SplashBloc(database));
  injector.registerFactory<MainBloc>(() => MainBloc(database));
  injector.registerFactory<OrderBloc>(() => OrderBloc(database));
  injector.registerFactory<ReportsBloc>(() => ReportsBloc(database));
}
