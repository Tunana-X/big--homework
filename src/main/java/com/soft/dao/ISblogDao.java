package com.soft.dao;

import com.soft.domain.Sblog;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public interface ISblogDao {

	public abstract int addSblog(Sblog sblog);

	public abstract int delSblog(String sblog_id);

	public abstract int delSblogs(String[] sblog_ids);

	public abstract int updateSblog(Sblog sblog);

	public abstract Sblog getSblog(Sblog sblog);

	public abstract List<Sblog>  listSblogs(Sblog sblog);

	public abstract int listSblogsCount(Sblog sblog);

}
