import 'package:flutix_movie/core/resources/data_state.dart';
import 'package:flutix_movie/features/auth/data/model/user_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class AuthRemoteSource {
  Future<DataState<UserModel>> createNewUser(
      {required String email, required String password, required String name});
  Future<DataState<UserModel>> signInUser({
    required String email,
    required String password,
  });
  Future<DataState<String>> signOutUser();
  Session? get currentSession;
  Future<DataState<UserModel>> retriveCurrentUser();
}

class SupabaseDataSource extends AuthRemoteSource {
  final SupabaseClient _supabaseClient;

  SupabaseDataSource(SupabaseClient supabaseClient)
      : _supabaseClient = supabaseClient;

  @override
  Future<DataState<UserModel>> createNewUser(
      {required String email,
      required String password,
      required String name}) async {
    try {
      final AuthResponse res = await _supabaseClient.auth.signUp(
        email: email,
        password: password,
        data: {'display_name': name, "amount": 500000},
      );

      final User? user = res.user;

      if (user == null) {
        throw Exception("failed to get user from supabase");
      }

      return DataSuccess(UserModel.fromJson(user.toJson()));
    } on AuthException catch (e) {
      return DataFailed(e.message);
    } catch (e) {
      return DataFailed(e.toString());
    }
  }

  @override
  Future<DataState<UserModel>> signInUser(
      {required String email, required String password}) async {
    try {
      final AuthResponse res = await _supabaseClient.auth.signInWithPassword(
        email: email,
        password: password,
      );

      final User? user = res.user;

      if (user == null) {
        throw Exception("failed to sign in user with supabase");
      }

      return DataSuccess(UserModel.fromJson(user.toJson()));
    } on AuthException catch (e) {
      return DataFailed(e.message);
    } catch (e) {
      return DataFailed(e.toString());
    }
  }

  @override
  Future<DataState<String>> signOutUser() async {
    try {
      await _supabaseClient.auth.signOut();
      return const DataSuccess("user successfully sign out");
    } on AuthException catch (e) {
      return DataFailed(e.message);
    } catch (e) {
      return DataFailed(e.toString());
    }
  }

  @override
  Future<DataState<UserModel>> retriveCurrentUser() async {
    try {
      if (currentSession != null) {
        final user = await _supabaseClient
            .from("profiles")
            .select()
            .eq("id", currentSession!.user.id);

        return DataSuccess(UserModel.fromJson(user.first).copyWith(
            email: currentSession!.user.email,
            rawUserMetaData: RawUserMetaData(
                displayName:
                    currentSession!.user.userMetadata?["display_name"])));
      } else {
        throw Exception("no user data");
      }
    } on PostgrestException catch (e) {
      return DataFailed(e.message);
    } catch (e) {
      return DataFailed(e.toString());
    }
  }

  @override
  Session? get currentSession => _supabaseClient.auth.currentSession;
}
