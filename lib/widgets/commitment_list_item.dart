import 'package:commitment_client/models/commitment_info.dart';
import 'package:commitment_client/strings/strings.dart';
import 'package:commitment_client/utils/time_util.dart';
import 'package:flutter/material.dart';

class CommitmentListItem extends StatelessWidget {
  final CommitmentInfo commitment;
  final VoidCallback onPressed;

  const CommitmentListItem({super.key, required this.commitment, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    final currentDateUtc = DateTime.now().toUtc();
    final renewalDateUtc = commitment.activity!.renewalDate.toUtc();
    final bool isRenewedToday = currentDateUtc.year == renewalDateUtc.year &&
        currentDateUtc.month == renewalDateUtc.month &&
        currentDateUtc.day == renewalDateUtc.day;

    return Card(
        child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '+${commitment.activity?.processDays}',
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
                Row(children: [
                  Expanded(
                      child: Column(children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        commitment.title,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(commitment.description ?? ''),
                    )
                  ])),
                  // const Column(children: [
                  //   Icon(Icons.more_horiz),
                  // ]),
                ]),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(formatExpirationDate(commitment.activity!.expirationDate)),
                    isRenewedToday
                        ? Text('성공!')
                        : ElevatedButton(
                            onPressed: onPressed,
                            child: const Text(Strings.UI_COMMITMENT_RENEW),
                          )
                  ],
                )
              ],
            )));
  }
}
