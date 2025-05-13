package com.soft.domain;

import com.soft.common.domain.BaseDomain;
import java.util.Date;

public class UserLoginLog extends BaseDomain {
    private long logId;        // 对应 log_id
    private Integer userId;        // 对应 member.user_id
    private Date loginTime;    // 登录时间
    private Date logoutTime;   // 退出时间
    private Integer duration;  // 挋续时间（秒）
    private String ipAddress;  // 登录IP
    private int status;       // 状态（1:成功, 2:失败, 3:超时, 4:登出）
    private String userName; // 新增字段

    // Getter/Setter...
    public String getUserName() {
        return userName;
    }
    // Getter/Setter
    public String getStatusDesc() {
        switch (status) {
            case 1: return "成功";
            case 2: return "失败";
            case 3: return "超时";
            case 4: return "登出";
            default: return "未知";
        }
    }
    // Getter/Setter
    public long getLogId() { return logId; }
    public void setLogId(long logId) { this.logId = logId; }

    public Integer getUserId() { return userId; }
    public void setUserId(Integer userId) { this.userId = userId; }

    public Date getLoginTime() { return loginTime; }
    public void setLoginTime(Date loginTime) { this.loginTime = loginTime; }

    public Date getLogoutTime() { return logoutTime; }
    public void setLogoutTime(Date logoutTime) { this.logoutTime = logoutTime; }

    public Integer getDuration() { return duration; }
    public void setDuration(Integer duration) { this.duration = duration; }

    public String getIpAddress() { return ipAddress; }
    public void setIpAddress(String ipAddress) { this.ipAddress = ipAddress; }

    public int getStatus() { return status; }
    public void setStatus(int status) { this.status = status; }

    // toString()
    @Override
    public String toString() {
        return "UserLoginLog{" +
                "logId=" + logId +
                ", userId=" + userId +
                ", loginTime=" + loginTime +
                ", status=" + status +
                '}';
    }

    // 其他字段的getter/setter...
}