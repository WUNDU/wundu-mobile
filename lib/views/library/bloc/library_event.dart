part of 'library_bloc.dart';

/// Abstract class for all events that can be dispatched from the
/// Library widget.

/// Events must be immutable and implement the [Equatable] interface.
abstract class LibraryEvent extends Equatable {
  const LibraryEvent();

  @override
  List<Object?> get props => [];
}

/// Event that is dispatched when the Library widget is first created
class LibraryInitialEvent extends LibraryEvent {
  const LibraryInitialEvent();

  @override
  List<Object?> get props => [];
}
