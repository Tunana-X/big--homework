package com.soft.dao;

import com.soft.domain.OrdersDetail;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import java.util.Date;
import java.util.List;

@Component
public interface IOrdersDetailDao {

	public abstract int addOrdersDetail(OrdersDetail ordersDetail);

	public abstract int delOrdersDetail(String detail_id);

	public abstract int delOrdersDetails(String[] detail_ids);

	public abstract int updateOrdersDetail(OrdersDetail ordersDetail);

	public abstract OrdersDetail getOrdersDetail(OrdersDetail ordersDetail);

	public abstract List<OrdersDetail>  listOrdersDetails(OrdersDetail ordersDetail);

	public abstract int listOrdersDetailsCount(OrdersDetail ordersDetail);

	public abstract List<OrdersDetail>  listOrdersDetailsSum(OrdersDetail ordersDetail);

	public abstract int listOrdersDetailsSumCount(OrdersDetail ordersDetail);

	// ✅ 按商品ID查询历史销量
	List<OrdersDetail> listSalesHistoryByGoodsId(@Param("goods_id") int goods_id, @Param("startDate") Date startDate, @Param("endDate") Date endDate);

	// ✅ 按商品名称查询历史销量
	List<OrdersDetail> listSalesHistoryByGoodsName(@Param("goods_name") String goods_name, @Param("startDate") Date startDate, @Param("endDate") Date endDate);
}
