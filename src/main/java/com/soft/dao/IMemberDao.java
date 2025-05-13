package com.soft.dao;

import com.soft.domain.Member;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public interface IMemberDao {

	public abstract int addMember(Member member);

	public abstract int delMember(String user_id);

	public abstract int delMembers(String[] user_ids);

	public abstract int updateMember(Member member);

	public abstract Member getMember(Member member);

	public abstract List<Member>  listMembers(Member member);

	public abstract int listMembersCount(Member member);

}
