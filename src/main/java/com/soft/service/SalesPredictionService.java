package com.soft.service;

import java.util.List;
import org.springframework.stereotype.Service;

@Service
public class SalesPredictionService {

 /**
  * 使用线性回归模型预测未来3天销量
  * @param history 历史销量数据
  * @return 预测销量
  */
 public List<Integer> predict(List<Integer> history) {
  return LinearRegression.predict(history);
 }
}