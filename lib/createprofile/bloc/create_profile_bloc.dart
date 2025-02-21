import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:login/createprofile/models/create_profile_req.dart';


part 'create_profile_event.dart';
part 'create_profile_state.dart';

class CreateProfileBloc extends Bloc<CreateProfileEvent,  CreateProfileState> {
  final log = Logger();

  CreateProfileBloc() : super(CreateProfileState.initial) {
    on<InitializeProfile>(_onInitializeProfileToState);
    on<OnChangeFormValue>(_onChangeFormValue);
    on<SubmitProfile>(_onSubmitProfile);
  }

  Future<void>_onInitializeProfileToState(
   InitializeProfile event,
    Emitter<CreateProfileState> emit,
  ) async {
    try {
      // Log::Format
      // filename::functionName::Object / variable name: $value
      log.d('CreateProfilePageBloc :: _onInitializeCreateProfileToState :: Event: $event');
      emit(state.copyWith(status: CreateProfileStatus.loading));
      emit(state.copyWith(status: CreateProfileStatus.loaded));
    } catch (error) {
      log.e('CreateProfileBloc::_onInitializeCreateProfileToState::Error: $error');
      emit(state.copyWith(
        status: CreateProfileStatus.failure,
        message: error.toString(),
      ));
    }
  }

  void _onChangeFormValue(OnChangeFormValue event, Emitter<CreateProfileState> emit) {
    log.d("CreateProfilePageBloc::_onChangeFormValue::formValues:${event.formValues}");
    emit(state.copyWith(status: CreateProfileStatus.changing));
    ProfileReqModel profileReqModel = ProfileReqModel.fromMap(event.formValues);
    emit(state.copyWith(status:CreateProfileStatus.changed, createProfileReqModel: profileReqModel));
  }

  Future<void> _onSubmitProfile(
    SubmitProfile event,
    Emitter<CreateProfileState> emit,
  ) async {
    emit(state.copyWith(status: CreateProfileStatus.loading));
    try {
      log.d("CreateProfilePageBloc::_onSubmitProfile::$event");
      await Future.delayed(Duration(seconds: 1));
      // handeled via api.
      if (state.createProfileReqModel?.email == "dhanapriya511@gmail.com" && state.createProfileReqModel?.password == "123456") {
        emit(state.copyWith(status: CreateProfileStatus.success, message: "Login Successfull."));
      } else {
        emit(state.copyWith(status:CreateProfileStatus.failure, message: "Invalid Email or Password"));
      }
    } catch (error) {
      log.e('CreateProfilePageBloc::_onSubmitCreateProile::Error: $error');
      emit(state.copyWith(
        status: CreateProfileStatus.failure,
        message: error.toString(),
      ));
    }
  }
}
