import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';

import 'core.dart';

///A Try catch Wrapper for Future<Either, T>. Evaluates the function, handles
///errors and returns Left or Right.
FutureEither<T> callFutureMethod<T>(Future<T> Function() function) async {
  try {
    T result = await function();
    return Right(result);
  } on FirebaseException catch (e) {
    ///A Firebase Exception has occurred
    debugPrint("A Firebase exception has occurred");
    debugPrint(e.message);
    return Left(Failure(errorMessage: e.message));
  } catch (e) {
    ///An exception has occurred;
    debugPrint("An exception has occurred");
    debugPrint(e.toString());
    return const Left(Failure());
  }
}

Either<Failure, T> callMethod<T>(T Function() function) {
  try {
    T result = function();
    return Right(result);
  } on FirebaseException catch (e) {
    ///A Firebase Exception has occurred
    debugPrint("A Firebase exception has occurred");
    debugPrint(e.message);
    return Left(Failure(errorMessage: e.message));
  } catch (e) {
    ///An exception has occurred;
    debugPrint("An exception has occurred");
    debugPrint(e.toString());
    return const Left(Failure());
  }
}
