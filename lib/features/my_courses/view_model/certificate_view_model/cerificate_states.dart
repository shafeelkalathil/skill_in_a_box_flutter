import 'package:skill_in_a_box_flutter/features/my_courses_curriculum_overlay_menu/model/certificate/certificate_model.dart';


abstract class CertificateState {
  CertificateState({this.certificateStateData});

  final CertificateModel? certificateStateData;
}

class CertificateInitial implements CertificateState {
  @override
  CertificateModel? get certificateStateData => null;
}

class CertificateLoading implements CertificateState {
  CertificateLoading({ this.certificateData});

  final CertificateModel? certificateData;

  @override
  CertificateModel? get certificateStateData => certificateData;
}

class CertificateSuccess implements CertificateState {
  CertificateSuccess({
    required this.certificateData,
  });


  final CertificateModel? certificateData;
  @override
  CertificateModel? get certificateStateData => certificateData;
}

class CertificateFailure implements CertificateState {
  CertificateFailure(
      {required this.errorMessage,
      this.certificateData,});

  final CertificateModel? certificateData;
  final String errorMessage;
 
  @override
  CertificateModel? get certificateStateData => certificateData;
}
