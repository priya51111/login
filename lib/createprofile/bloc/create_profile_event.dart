
part of "create_profile_bloc.dart";

sealed class CreateProfileEvent extends Equatable {
  const CreateProfileEvent();
  @override
  List<Object> get props => [];
}

class InitializeProfile extends CreateProfileEvent {}

class OnChangeFormValue extends CreateProfileEvent {
  final Map<String, dynamic> formValues;

  const OnChangeFormValue(this.formValues);

  @override
  List<Object> get props => [formValues];
}

class SubmitProfile extends CreateProfileEvent {}
