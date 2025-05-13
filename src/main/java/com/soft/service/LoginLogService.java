package com.soft.service;

import com.soft.dao.IUserLoginLogDao;
import com.soft.domain.Member;
import com.soft.domain.UserLoginLog;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;

@Service
public class LoginLogService {

    @Autowired
    IUserLoginLogDao userLoginLogDao;

    public void recordLoginLog(Member member, String ipAddress, int status) {
        UserLoginLog log = new UserLoginLog();
        log.setUserId(member.getUser_id());
        log.setLoginTime(new Date());
        log.setIpAddress(ipAddress);
        log.setStatus(status);
        userLoginLogDao.addLoginLog(log);
    }
    public void updateLogoutTime(int userId, Date logoutTime) {
        UserLoginLog log = new UserLoginLog();
        log.setUserId(userId);
        log.setLogoutTime(logoutTime);
        userLoginLogDao.updateLogoutTime(log);
    }
}