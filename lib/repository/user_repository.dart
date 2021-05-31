import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_datastore/amplify_datastore.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:like_us/models/User.dart';

import 'package:meta/meta.dart';

class UserRepository {
  User currUser;

  Future<bool> register({
    @required String email,
    @required String password,
    @required String name,
  }) async {
    try {
      Map<String, String> userAttributes = {'name': name};
      SignUpResult res = await Amplify.Auth.signUp(
        username: email,
        password: password,
        options: CognitoSignUpOptions(userAttributes: userAttributes),
      );
      return res.isSignUpComplete;
    } catch (e) {
      print(e.toString());
      rethrow;
    }
  }

  Future<bool> optVerfication({
    @required String email,
    @required String password,
    @required String otp,
    @required String username,
    @required String firstName,
    @required String lastName,

  }) async {
    SignUpResult res = await Amplify.Auth.confirmSignUp(
      username: email,
      confirmationCode: otp,
    );
    if (res.isSignUpComplete) {
      SignInResult signInRes = await Amplify.Auth.signIn(
        username: email,
        password: password,
      );
      AuthUser authUser = await Amplify.Auth.getCurrentUser();
      Amplify.DataStore.save(
        User(
          email: email,
          username: username,
          firstName: firstName,
          lastName: lastName,


          profilePicUrl:
              "https://www.arrowbenefitsgroup.com/wp-content/uploads/2018/04/unisex-avatar.png",
          id: authUser.userId,
          createdOn: TemporalDateTime.now(),
          isVerified: true

        ),
      );
      return signInRes.isSignedIn;
    }
    return false;
  }

  Future logout() async {
    try {
      await Amplify.Auth.signOut();
    } on AuthException catch (_) {
      rethrow;
    }
  }

  Future<bool> login({
    @required String email,
    @required String password,
  }) async {
    SignInResult res = await Amplify.Auth.signIn(
      username: email,
      password: password,
    );
    return res.isSignedIn;
  }

  Future<bool> loginWithGoogle() async {
    try {
      var res =
          await Amplify.Auth.signInWithWebUI(provider: AuthProvider.google);
      List<AuthUserAttribute> authUserAttributes =
          await Amplify.Auth.fetchUserAttributes();
      String email = authUserAttributes[3].value;
      String userId = authUserAttributes[0].value;
      List<User> user = await Amplify.DataStore.query(User.classType,
          where: User.ID.eq(userId));
      if (user.length > 0) {
        return res.isSignedIn;
      } else {
        Amplify.DataStore.save(
          User(
            email: email,
            username: "",
            firstName: "",
            lastName: "",
            profilePicUrl:
                "https://www.arrowbenefitsgroup.com/wp-content/uploads/2018/04/unisex-avatar.png",
            id: userId,
            createdOn: TemporalDateTime.now(),
            isVerified: true,
          ),
        );
        return res.isSignedIn;
      }
    } on AmplifyException catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> checkUsername() async {
    try {
      User user = await getCurrUser();
      if (user == null) return false;
      if (user.username == "")
        return false;
      else
        return true;
    } on AmplifyException catch (e) {
      print(e);
      return false;
    }
  }

  Future<User> getCurrUser() async {
    AuthUser authUser = await Amplify.Auth.getCurrentUser();
    List<User> user = await Amplify.DataStore.query(User.classType,
        where: User.ID.eq(authUser.userId));
    if (user.length > 0) {
      print(user.first);
      return user.first;
    } else
      return null;
  }

  Future<List<User>> getAllOtherUses() async {
    AuthUser authUser = await Amplify.Auth.getCurrentUser();
    List<User> users = await Amplify.DataStore.query(User.classType,
        where: User.ID.ne(authUser.userId));
    return users;
  }

  Future updateFullname(String name) async {
    AuthUser authUser = await Amplify.Auth.getCurrentUser();
    User user = (await Amplify.DataStore.query(
      User.classType,
      where: User.ID.eq(authUser.userId),
    ))[0];
    await Amplify.DataStore.save(user.copyWith(username: name));
  }

  // Future updateProfileImage(File image, String key) async {
  //   try {
  //     await Amplify.Storage.downloadFile(
  //       key: key,
  //       local: image,
  //     );
  //     GetUrlResult getUrlResult = await Amplify.Storage.getUrl(key: key);
  //     await Amplify.DataStore.save(
  //       UserStore().currUser.copyWith(profileImage: getUrlResult.url),
  //     );
  //   } on StorageException catch (e) {
  //     print(e.message);
  //   }
  // }
}
