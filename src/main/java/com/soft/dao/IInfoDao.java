package com.soft.dao;

import com.soft.domain.Info;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public interface IInfoDao {

	public abstract int addInfo(Info info);

	public abstract int delInfo(String info_id);

	public abstract int delInfos(String[] info_ids);

	public abstract int updateInfo(Info info);

	public abstract Info getInfo(Info info);

	public abstract List<Info>  listInfos(Info info);

	public abstract int listInfosCount(Info info);

}
