import 'package:forms_app/presentation/presentation_barrel.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(routes: [
  GoRoute(
    path: '/',
    builder: (context, state) => const HomeScreen(),
  ),
  GoRoute(
    path: '/cubits',
    builder: (context, state) => const CubitCounterScreen(),
  ),
  GoRoute(
    path: '/bloc',
    builder: (context, state) => const BlocCounterScreen(),
  ),
  GoRoute(
    path: '/new-user',
    builder: (context, state) => const RegisterScreen(),
  ),
]);
