package com.soft.dao;

import com.soft.domain.Orders;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public interface IOrdersDao {

	public abstract int addOrders(Orders orders);

	public abstract int delOrders(String orders_id);

	public abstract int delOrderss(String[] orders_ids);

	public abstract int updateOrders(Orders orders);

	public abstract int updateOrdersMoney(Orders orders);

	public abstract Orders getOrders(Orders orders);

	public abstract List<Orders>  listOrderss(Orders orders);

	public abstract int listOrderssCount(Orders orders);

	public abstract List<Orders>  listOrderssSum(Orders orders);

	public abstract int listOrderssSumCount(Orders orders);
}
