package com.soft.service;

import java.util.ArrayList;
import java.util.List;

public class LinearRegression {

    /**
     * 简单的线性回归模型
     * @param x 自变量（如时间点）
     * @param y 因变量（如销量）
     * @return 回归系数 [intercept, slope]
     */
    public static double[] fit(double[] x, double[] y) {
        if (x.length != y.length || x.length < 2) {
            return new double[]{0, 0}; // 默认值
        }

        double sumX = 0, sumY = 0, sumXY = 0, sumXX = 0;
        int n = x.length;

        for (int i = 0; i < n; i++) {
            sumX += x[i];
            sumY += y[i];
            sumXY += x[i] * y[i];
            sumXX += x[i] * x[i];
        }

        double slope = (n * sumXY - sumX * sumY) / (n * sumXX - sumX * sumX);
        double intercept = (sumY - slope * sumX) / n;

        return new double[]{intercept, slope};
    }

    /**
     * 使用线性回归模型预测
     * @param history 历史销量数据
     * @return 预测未来3天的销量
     */
    public static List<Integer> predict(List<Integer> history) {
        if (history.size() < 2) {
            return List.of(0, 0, 0); // 数据不足返回默认值
        }

        // 构建 X/Y
        double[] x = new double[history.size()];
        double[] y = new double[history.size()];
        for (int i = 0; i < history.size(); i++) {
            x[i] = i;
            y[i] = history.get(i);
        }

        // 线性回归
        double[] coefficients = fit(x, y);
        double intercept = coefficients[0];
        double slope = coefficients[1];

        // 预测未来3天
        List<Integer> predictions = new ArrayList<>();
        for (int i = history.size(); i < history.size() + 3; i++) {
            double predicted = intercept + slope * i;
            predictions.add((int) Math.round(predicted));
        }
        return predictions;
    }
}