part of 'library_bloc.dart';

/// Represents the state of Library in the application.
class LibraryState extends Equatable {
  const LibraryState({
    this.searchController,
    this.libraryModelObj,
  });

  final TextEditingController? searchController;
  final LibraryModel? libraryModelObj;

  @override
  List<Object?> get props => [searchController, libraryModelObj];

  LibraryState copyWith({
    TextEditingController? searchController,
    LibraryModel? libraryModelObj,
  }) {
    return LibraryState(
      searchController: searchController ?? this.searchController,
      libraryModelObj: libraryModelObj ?? this.libraryModelObj,
    );
  }
}