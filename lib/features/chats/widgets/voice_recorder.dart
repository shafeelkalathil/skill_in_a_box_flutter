import 'package:flutter/material.dart';
import 'package:skill_in_a_box_flutter/core/utils/helpers/helpers.dart';

class VoiceRecorder extends StatelessWidget {
  const VoiceRecorder({
    required this.recordDuration,
    super.key,
    this.onPressed,});

  final int recordDuration;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    final dark = AppHelpers.isDarkMode(context);
    return Expanded(child: Container(
      height: 44,
      decoration: BoxDecoration(
        borderRadius:
        BorderRadius.circular(20),
        color: dark
            ? const Color(0xff222223):Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.only(
            left: 15, right: 15,),
        child: Row(
          mainAxisAlignment:
          MainAxisAlignment.spaceAround,
          children: [
            _buildTimer(dark: dark),
            IconButton(
                onPressed: () => _showDeleteConfirmationDialog(context),
                icon: const Icon(Icons.delete_rounded),),
          ],
        ),
      ),
    ),);
  }


  Widget _buildTimer({required bool dark}) {
    final minutes = _formatNumber(recordDuration ~/ 60);
    final seconds = _formatNumber(recordDuration % 60);

    return Text(
      '$minutes : $seconds',
      style: TextStyle(color: dark ? Colors.white :Colors.black),
    );
  }

  String _formatNumber(int number) {
    var numberStr = number.toString();
    if (number < 10) {
      numberStr = '0$numberStr';
    }
    return numberStr;
  }

  void _showDeleteConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Delete Confirmation'),
          content: const Text('Are you sure you want to delete this message?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Delete cancelled.')),
                );
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: onPressed,
              style: TextButton.styleFrom(foregroundColor: Colors.red),
              child: Text('Delete'),
            ),
          ],
        );
      },
    );
  }
}
