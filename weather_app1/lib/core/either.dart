import 'package:equatable/equatable.dart';

abstract class Either<L,R> extends Equatable{
  const Either._();

  T fold<T>(T Function(L)left,T Function(R)right);

  Either<L,R2>map<R2>(R2 Function(R)f)=>fold(
    Left.new,
          (right) => Right(f(right)),);
}