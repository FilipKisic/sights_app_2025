import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sights_app/data/client/firebase_auth_client.dart';
import 'package:sights_app/data/repository/user_repository_impl.dart';
import 'package:sights_app/domain/repository/user_repository.dart';
import 'package:sights_app/domain/usecase/user_sign_in_use_case.dart';
import 'package:sights_app/presentation/notifier/authentication_notifier.dart';
import 'package:sights_app/presentation/notifier/state/authentication_state.dart';

final firebaseAuthClientProvider = Provider<FirebaseAuthClient>((_) => FirebaseAuthClient());

final userRepositoryProvider = Provider<UserRepository>(
  (ref) => UserRepositoryImpl(ref.watch(firebaseAuthClientProvider)),
);

final userSignInUseCaseProvider = Provider<UserSignInUseCase>(
  (ref) => UserSignInUseCase(ref.watch(userRepositoryProvider)),
);

final authenticationNotifierProvider = NotifierProvider<AuthenticationNotifier, AuthenticationState>(
  () => AuthenticationNotifier(),
);
