import 'package:bmi/cores/utils/app_strings.dart';
import 'package:bmi/features/home_feature/presention/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class MyChart extends StatelessWidget {
  MyChart({super.key, required this.homeCubit});

  HomeCubit homeCubit;

  @override
  Widget build(BuildContext context) {
    return SfRadialGauge(
      axes: <RadialAxis>[
        RadialAxis(
          minimum: 10,
          maximum: 40,
          ranges: <GaugeRange>[
            GaugeRange(
              startValue: 10,
              endValue: 18.5,
              color: Colors.blue,
              label: AppStrings.underweight,
              sizeUnit: GaugeSizeUnit.factor,
              labelStyle: const GaugeTextStyle(fontSize: 20),
            ),
            GaugeRange(
              startValue: 18.5,
              endValue: 25,
              color: Colors.green,
              label: AppStrings.normal,
              sizeUnit: GaugeSizeUnit.factor,
              labelStyle: const GaugeTextStyle(fontSize: 20),
            ),
            GaugeRange(
              startValue: 25,
              endValue: 30,
              color: Colors.orange,
              label: AppStrings.overweight,
              sizeUnit: GaugeSizeUnit.factor,
              labelStyle: const GaugeTextStyle(fontSize: 20),
            ),
            GaugeRange(
              startValue: 30,
              endValue: 40,
              color: Colors.red,
              label: AppStrings.obese,
              sizeUnit: GaugeSizeUnit.factor,
              labelStyle: const GaugeTextStyle(fontSize: 20),
            ),
          ],
          pointers: <GaugePointer>[
            NeedlePointer(value: homeCubit.bmiResutl), // Example BMI value
          ],
          annotations: <GaugeAnnotation>[
            GaugeAnnotation(
              widget: Container(
                child: Text(
                    'BMI = ${homeCubit.bmiResutl.round()}', // Example BMI value
                    style: const TextStyle(
                        fontSize: 25, fontWeight: FontWeight.bold)),
              ),
              angle: 90,
              positionFactor: 0.5,
            ),
          ],
        ),
      ],
    );
  }
}
