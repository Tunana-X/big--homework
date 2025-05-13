package com.soft.dao;

import com.soft.domain.GoodsType;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public interface IGoodsTypeDao {

	public abstract int addGoodsType(GoodsType goodsType);

	public abstract int delGoodsType(String goods_type_id);

	public abstract int delGoodsTypes(String[] goods_type_ids);

	public abstract int updateGoodsType(GoodsType goodsType);

	public abstract GoodsType getGoodsType(GoodsType goodsType);

	public abstract List<GoodsType>  listGoodsTypes(GoodsType goodsType);

	public abstract int listGoodsTypesCount(GoodsType goodsType);

}
