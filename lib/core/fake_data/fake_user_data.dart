import 'package:yalakora/core/models/user_model.dart';

class FakeUserData {
  const FakeUserData._();

  static UserModel get user => UserModel(
        id: '1',
        name: 'Eyad Waleed',
        email: 'eyad@test.com',
        passwordHash: 'hashed_password',
        phone: '01000000000',
         avatarUrl: 'https://tse4.mm.bing.net/th/id/OIP.CAc4qmFTBmTIXQ6VdOhajgHaE8?rs=1&pid=ImgDetMain&o=7&rm=3',

        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );
}
