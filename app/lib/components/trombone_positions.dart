import 'package:flutter/material.dart';

class TromboneNotesWidget extends StatelessWidget {
  final Map<int, List<String>> positions = {
    1: ['Bb', 'F', 'Bb (octave)'],
    2: ['A', 'E', 'A (octave)'],
    3: ['Ab', 'Eb', 'Ab (octave)'],
    4: ['G', 'D', 'G (octave)'],
    5: ['Gb', 'Db', 'Gb (octave)'],
    6: ['F', 'C', 'F (octave)'],
    7: ['E', 'B', 'E (octave)'],
  };

  TromboneNotesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Slide Positions & Notes',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.blueAccent,
            ),
          ),
          const SizedBox(height: 10),
          Column(
            children: [
              for (final position in positions.keys)
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  elevation: 5,
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 25,
                          backgroundColor: Colors.blueAccent,
                          child: Text(
                            '$position',
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Position $position',
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blueGrey,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                positions[position]!.join(', '),
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey[700],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Icon(
                          Icons.music_note,
                          color: Colors.blueAccent,
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          )
        ],
      ),
    );
  }
}
