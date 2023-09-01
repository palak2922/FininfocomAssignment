import 'package:fininfocom/Service/DetailService.dart';
import 'package:flutter_test/flutter_test.dart';



void main(){
  late Detailservice detailservice;

  setUp(() {
    detailservice = Detailservice();
  });

  group('DetailService -', () {
    
    group('getuser function', () {
      test('given detailservice class when getuser function is called and status code is 200 then a user model should be returned',
              () async {
                 //Arrange
                //Act
                final user = await detailservice.GetUserDetails();
                //Asert
                expect(user.info.results, 1);
                // expect(user.results, isA<User>());  // isA() -> for dynamic data check
              });

      // test('given detailservice class when getuser function is called and status code is not 200 then an exception should be thrown',
      //         () async {
      //       //Arrange
      //       //Act
      //       final user = detailservice.GetUserDetails();
      //       //Asert
      //       expect(user, throwsException);
      //     });
    });
  });
}

