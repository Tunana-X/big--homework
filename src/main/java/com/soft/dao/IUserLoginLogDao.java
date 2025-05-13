package com.soft.dao;

import com.soft.domain.UserLoginLog;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public interface IUserLoginLogDao {
    void addLoginLog(UserLoginLog log); // 插入登录日志
    void updateLogoutTime(UserLoginLog log); // 更新退出时间和持续时间
    List<UserLoginLog> listUserLoginLogs(UserLoginLog log);
    int listUserLoginLogsCount(UserLoginLog log);
}