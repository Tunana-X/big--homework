package com.soft.dao;

import com.soft.domain.Goods;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface IGoodsDao {

	// 原有方法保留
	int addGoods(Goods goods);
	int delGoods(String goods_id);
	int delGoodss(String[] ids);
	int updateGoods(Goods goods);
	int updateGoodsCount(Goods goods);
	Goods getGoods(Goods goods);

	// ✅ 保留原始 listGoodss 方法（用于商品查询）
	List<Goods> listSalesHistory(Goods goods);

	// ✅ 新增带分页的 listGoodssWithCount 方法（用于销量统计）
	int listGoodssCount1(Goods goods);

	List<Goods> listGoodssWithCount(Goods goods);
}