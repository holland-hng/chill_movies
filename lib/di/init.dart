import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'init.config.dart';

final GetIt inject = GetIt.instance;

//https://blog.usejournal.com/flutter-di-a-true-love-story-1e5a5ae2ba2d
@injectableInit
Future<void> configureInjection() async => $initGetIt(inject);
