import 'package:flutter/material.dart';
import 'package:jews_harp/core/widgets/shimmer_effect.dart';

class TechniqueListLoadingEffect extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: List.filled(
          3,
          ShimmerEffect(
            child: Container(
              margin: const EdgeInsets.only(bottom: 20),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(29),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(29),
                  ),
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(29),
                        ),
                        height: 150,
                        width: double.infinity,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                        width: double.infinity,
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 19,
                                    width: 200,
                                    color: Colors.grey,
                                  ),
                                  SizedBox(height: 5),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.timelapse_rounded,
                                        color: Colors.grey,
                                        size: 15,
                                      ),
                                      SizedBox(width: 4),
                                      Container(
                                        height: 16,
                                        width: 50,
                                        color: Colors.grey,
                                      ),
                                      SizedBox(width: 20),
                                      Icon(
                                        Icons.attach_money_rounded,
                                        color: Colors.grey,
                                        size: 15,
                                      ),
                                      Container(
                                        height: 16,
                                        width: 50,
                                        color: Colors.grey,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Icon(
                              Icons.favorite_border_rounded,
                              color: Colors.redAccent,
                              size: 30,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
