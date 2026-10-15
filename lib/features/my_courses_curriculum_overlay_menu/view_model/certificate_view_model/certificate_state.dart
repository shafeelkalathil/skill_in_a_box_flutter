
import 'package:skill_in_a_box_flutter/features/my_courses_curriculum_overlay_menu/model/certificate/certificate_model.dart';

abstract class CertificateState {}

class CertificateInitial extends CertificateState {}

class CertificateLoading extends CertificateState {}

class CertificateFailure extends CertificateState {
  CertificateFailure(this.message);
  final String message;
}

class CertificateSuccess extends CertificateState {
  CertificateSuccess(this.certificateModel);
  final CertificateModel certificateModel;
}
