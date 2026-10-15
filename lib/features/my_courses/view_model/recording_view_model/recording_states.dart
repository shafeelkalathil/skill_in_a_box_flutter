
import 'package:skill_in_a_box_flutter/features/my_courses/model/recording_model/recording_model.dart';


abstract class RecordingState {
  RecordingState({this.stateRecordingData});

  final RecordingModel? stateRecordingData;
}

class RecordingInitial implements RecordingState {
  @override
  RecordingModel? get stateRecordingData => null;
}

class RecordingLoading implements RecordingState {
  RecordingLoading({ this.recordingData});

  final RecordingModel? recordingData;

  @override
  RecordingModel? get stateRecordingData => recordingData;
}

class RecordingSuccess implements RecordingState {
  RecordingSuccess({
    required this.recordingData,
  });


  final RecordingModel? recordingData;
  @override
  RecordingModel? get stateRecordingData => recordingData;
}

class RecordingFailure implements RecordingState {
  RecordingFailure(
      {required this.errorMessage,
      this.recordingData,});

  final RecordingModel? recordingData;
  final String errorMessage;
 
  @override
  RecordingModel? get stateRecordingData => recordingData;
}
