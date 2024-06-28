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
    debugPrint(e.toString());
    return Left(Failure.firebase(errorMessage: e.message));
  } catch (e) {
    ///An exception has occurred;
    debugPrint("An exception exception has occurred");
    debugPrint(e.toString());
    debugPrintStack(label: "Exception error stacktrace:");
    String errorMessage = e.toString().split(": ").last;

    return Left(Failure.generic(errorMessage: errorMessage));
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
    return Left(Failure.firebase(errorMessage: e.message));
  } catch (e) {
    ///An exception has occurred;
    debugPrint("An exception has occurred");
    debugPrint(e.toString());
    String errorMessage = e.toString().split(": ").last;
    return Left(Failure.generic(errorMessage: errorMessage));
  }
}
