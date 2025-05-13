package com.soft.dao;

import com.soft.domain.Collect;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public interface ICollectDao {

	public abstract int addCollect(Collect collect);

	public abstract int delCollect(String collect_id);

	public abstract int delCollects(String[] collect_ids);

	public abstract int updateCollect(Collect collect);

	public abstract Collect getCollect(Collect collect);

	public abstract List<Collect>  listCollects(Collect collect);

	public abstract int listCollectsCount(Collect collect);

}
