import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';

import 'core.dart';

///A Try catch Wrapper for Future<Either, T>. Evaluates the function, handles
///errors and returns Left or Right.
FutureEither<T> futureHandler<T>(Future<T> Function() function) async {
  try {
    T result = await function();
    return Right(result);
  } on FirebaseException catch (e, stackTrace) {
    ///A Firebase Exception has occurred
    log("A Firebase exception has occurred");
    log(e.message ?? "Error");
    log("Exception error stacktrace:", stackTrace: stackTrace);
    log(e.toString());
    return Left(Failure.firebase(message: e.message));
  } catch (e, stackTrace) {
    ///An exception has occurred;
    log("An exception exception has occurred");
    log(e.toString());
    log("Exception error stacktrace:", stackTrace: stackTrace);

    // String errorMessage = e.toString().split(": ").last;

    return Left(Failure.generic(message: e.toString()));
  }
}

Either<Failure, T> methodHandler<T>(T Function() function) {
  try {
    T result = function();
    return Right(result);
  } on FirebaseException catch (e, stackTrace) {
    ///A Firebase Exception has occurred
    debugPrint("A Firebase exception has occurred");
    debugPrint(e.message);
    log("Exception error stacktrace:", stackTrace: stackTrace);
    return Left(Failure.firebase(message: e.message));
  } catch (e, stackTrace) {
    ///An exception has occurred;
    debugPrint("An exception has occurred");
    debugPrint(e.toString());
    log("Exception error stacktrace:", stackTrace: stackTrace);
    // String errorMessage = e.toString().split(": ").last;
    return Left(Failure.generic(message: e.toString()));
  }
}
