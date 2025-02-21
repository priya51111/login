part of "create_profile_bloc.dart";

enum CreateProfileStatus { initial, changing, changed, loading, loaded, success, failure }
class CreateProfileState extends Equatable {
  final CreateProfileStatus status;
  final String message;
  final ProfileReqModel? createProfileReqModel;

  const CreateProfileState({
    this.status = CreateProfileStatus.initial,
    required this.message,
    this.createProfileReqModel,
  });

  static const initial = CreateProfileState(
    status:CreateProfileStatus.initial,
    message: "",
  );

  CreateProfileState copyWith({
   CreateProfileStatus? status,
    String? message,
   ProfileReqModel? createProfileReqModel,
  }) {
    return CreateProfileState(
      status: status ?? this.status,
      message: message ?? this.message,
     createProfileReqModel: createProfileReqModel ?? this.createProfileReqModel,
    );
  }

  @override
  List<Object?> get props => [status, message,createProfileReqModel];
}
