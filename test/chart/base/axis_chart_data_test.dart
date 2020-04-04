
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AxisChartData data equality check',() {

    VerticalRangeAnnotation verticalRangeAnnotation1 = VerticalRangeAnnotation(
      color: Colors.green,
      x2: 12,
      x1: 12.1
    );
    VerticalRangeAnnotation verticalRangeAnnotation2 = VerticalRangeAnnotation(
      color: Colors.green,
      x2: 12,
      x1: 12.1
    );

    HorizontalRangeAnnotation horizontalRangeAnnotation1 = HorizontalRangeAnnotation(
      color: Colors.green,
      y2: 12,
      y1: 12.1
    );
    HorizontalRangeAnnotation horizontalRangeAnnotation2 = HorizontalRangeAnnotation(
      color: Colors.green,
      y2: 12,
      y1: 12.1
    );

    RangeAnnotations rangeAnnotations1 = RangeAnnotations(
      horizontalRangeAnnotations: [
        horizontalRangeAnnotation1,
        horizontalRangeAnnotation2,
      ],
      verticalRangeAnnotations: [
        verticalRangeAnnotation1,
        verticalRangeAnnotation2,
      ]
    );
    RangeAnnotations rangeAnnotations2 = RangeAnnotations(
      horizontalRangeAnnotations: [
        horizontalRangeAnnotation1,
        horizontalRangeAnnotation2,
      ],
      verticalRangeAnnotations: [
        verticalRangeAnnotation1,
        verticalRangeAnnotation2,
      ]
    );

    FlLine flLine1 = FlLine(color: Colors.green, strokeWidth: 1, dashArray: [1, 2, 3]);
    FlLine flLine2 = FlLine(color: Colors.green, strokeWidth: 1, dashArray: [1, 2, 3]);

    Function(double) checkToShowLine = (value) => true;
    Function(double) getDrawingLine = (value) => FlLine();

    test('FlGridData equality test', () {
      FlGridData sample1 = FlGridData(
        show: true,
        verticalInterval: 12,
        horizontalInterval: 22,
        drawVerticalLine: false,
        drawHorizontalLine: true,
        checkToShowVerticalLine: checkToShowLine,
        checkToShowHorizontalLine: null,
        getDrawingHorizontalLine: getDrawingLine,
        getDrawingVerticalLine: null,
      );

      FlGridData sample2 = FlGridData(
        show: true,
        verticalInterval: 12,
        horizontalInterval: 22,
        drawVerticalLine: false,
        drawHorizontalLine: true,
        checkToShowVerticalLine: checkToShowLine,
        checkToShowHorizontalLine: null,
        getDrawingHorizontalLine: getDrawingLine,
        getDrawingVerticalLine: null,
      );

      expect(sample1 == sample2, true);
    });

    test('FlLine equality test', () {

      expect(flLine1 == flLine2, true);

      expect(flLine1 == FlLine(color: Colors.green, strokeWidth: 1.001, dashArray: [1, 2, 3]), false);

      expect(flLine1 == FlLine(color: Colors.green, strokeWidth: 1, dashArray: [1,]), false);

      expect(flLine1 == FlLine(color: Colors.green, strokeWidth: 1, dashArray: []), false);

      expect(flLine1 == FlLine(color: Colors.green, strokeWidth: 1, dashArray: null), false);

      expect(flLine1 == FlLine(color: Colors.white, strokeWidth: 1, dashArray: [1, 2, 3]), false);

      expect(flLine1 == FlLine(color: Colors.green, strokeWidth: 100, dashArray: [1, 2, 3]), false);

    });

    test('RangeAnnotations equality test', () {

      expect(rangeAnnotations1 == rangeAnnotations2, true);

      expect(rangeAnnotations1 == RangeAnnotations(
        horizontalRangeAnnotations: [
          horizontalRangeAnnotation2,
          horizontalRangeAnnotation1,
        ],
        verticalRangeAnnotations: [
          verticalRangeAnnotation2,
          verticalRangeAnnotation1,
        ]
      ), true);

      expect(rangeAnnotations1 == RangeAnnotations(
        horizontalRangeAnnotations: [
          horizontalRangeAnnotation2,
        ],
        verticalRangeAnnotations: [
          verticalRangeAnnotation2,
        ]
      ), false);

      expect(rangeAnnotations1 == RangeAnnotations(
        horizontalRangeAnnotations: [],
        verticalRangeAnnotations: [
          verticalRangeAnnotation1,
          verticalRangeAnnotation2,
        ]
      ), false);

      expect(rangeAnnotations1 == RangeAnnotations(
        horizontalRangeAnnotations: [
          horizontalRangeAnnotation1,
          horizontalRangeAnnotation2,
        ],
        verticalRangeAnnotations: [
          verticalRangeAnnotation1,
          VerticalRangeAnnotation(
            color: Colors.green,
            x2: 12.01,
            x1: 12.1
          ),
        ]
      ), false);

    });

    test('HorizontalRangeAnnotation equality test', () {

      expect(horizontalRangeAnnotation1 == horizontalRangeAnnotation2, true);

      expect(horizontalRangeAnnotation1 == HorizontalRangeAnnotation(
        color: Colors.green,
        y2: 12.1,
        y1: 12.1
      ), false);

      expect(horizontalRangeAnnotation1 == HorizontalRangeAnnotation(
        color: Colors.green,
        y2: 12.0,
        y1: 12.1
      ), true);

      expect(horizontalRangeAnnotation1 == HorizontalRangeAnnotation(
        color: Colors.green,
        y2: 12.1,
        y1: 12.0
      ), false);

      expect(horizontalRangeAnnotation1 == HorizontalRangeAnnotation(
        color: Colors.green.withOpacity(0.5),
        y2: 12.0,
        y1: 12.1
      ), false);

    });

    test('VerticalRangeAnnotation equality test', () {

      expect(verticalRangeAnnotation1 == verticalRangeAnnotation2, true);

      expect(verticalRangeAnnotation1 == VerticalRangeAnnotation(
        color: Colors.green,
        x2: 12.1,
        x1: 12.1
      ), false);

      expect(verticalRangeAnnotation1 == VerticalRangeAnnotation(
        color: Colors.green,
        x2: 12.0,
        x1: 12.1
      ), true);

      expect(verticalRangeAnnotation1 == VerticalRangeAnnotation(
        color: Colors.green,
        x2: 12.1,
        x1: 12.0
      ), false);

      expect(verticalRangeAnnotation1 == VerticalRangeAnnotation(
        color: Colors.green.withOpacity(0.5),
        x2: 12.0,
        x1: 12.1
      ), false);

    });

  });

}