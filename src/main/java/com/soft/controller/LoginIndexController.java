package com.soft.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.soft.common.util.DateUtil;
import com.soft.common.util.JSONData;
import com.soft.domain.Cache;
import com.soft.domain.Member;
import com.soft.domain.OrdersDetail;
import com.soft.service.IndexService;
import com.soft.service.LoginIndexService;
import com.soft.service.LoginLogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
public class LoginIndexController {

	@Autowired
	LoginIndexService loginIndexManager;
	@Autowired
	private LoginLogService loginLogService; // 注入日志服务
	@Autowired
	IndexService indexManager;

	/**
	 * @Title: InSystem
	 * @Description: 用户登录
	 * @return String
	 */
	@RequestMapping(value="LoginInSystem.action", method=RequestMethod.POST)
	@ResponseBody
	public JSONData InSystem(Member params,
							 ModelMap model,
							 HttpServletRequest request,
							 HttpServletResponse response,
							 HttpSession httpSession) {
		JSONData jsonData = new JSONData();
		try {
			String random = (String) httpSession.getAttribute("random");
			if (!random.equals(params.getRandom())) {
				jsonData.setErrorReason("验证码错误");
				// 记录验证码错误日志
				loginLogService.recordLoginLog(params, request.getRemoteAddr(), 2); // 状态为2（失败）
				return jsonData;
			}

			Member admin = loginIndexManager.getUser(params);
			if (admin != null) {
				httpSession.setAttribute("userFront", admin);
				// 记录登录成功日志
				loginLogService.recordLoginLog(admin, request.getRemoteAddr(), 1); // 状态为1（成功）
			} else {
				jsonData.setErrorReason("用户名或密码错误");
				// 记录登录失败日志
				loginLogService.recordLoginLog(params, request.getRemoteAddr(), 2); // 状态为2（失败）
				return jsonData;
			}
		} catch (Exception e) {
			jsonData.setErrorReason("登录异常");
			loginLogService.recordLoginLog(params, request.getRemoteAddr(), 2); // 状态为2（失败）
			return jsonData;
		}
		return jsonData;
	}
	
	/**
	 * @Title: OutSystem
	 * @Description: 退出登录
	 * @return String
	 */
	@RequestMapping("/LoginOutSystem.action")
	@ResponseBody
	public JSONData OutSystem(HttpSession session) {
		JSONData data = new JSONData();
		try {
			Member user = (Member) session.getAttribute("userFront");
			if (user != null) {
				// 更新退出时间和状态
				loginLogService.updateLogoutTime(user.getUser_id(), new Date());
				session.removeAttribute("userFront");
				session.invalidate();
			}
			data.setSuccess(true);
		} catch (Exception e) {
			data.setErrorReason("退出失败：" + e.getMessage());
		}
		return data;
	}
	
	/**
	 * @Title: RegSystem
	 * @Description: 用户注册
	 * @return String
	 */
	@RequestMapping(value="LoginRegSystem.action",method=RequestMethod.POST)
	@ResponseBody
	public JSONData RegSystem(Member params,
			ModelMap model,HttpServletRequest request,HttpServletResponse response,HttpSession httpSession){
		JSONData jsonData = new JSONData();
		try {
			//验证码验证
			String random = (String)httpSession.getAttribute("random");
			if (!random.equals(params.getRandom())) {
				jsonData.setErrorReason("验证码错误");
				return jsonData;
			}
			
			//查询用户名是否被占用
			Member user = new Member();
			user.setUser_name(params.getUser_name());
			Member user_temp = loginIndexManager.getUser(user);
			if (user_temp!=null) {
				jsonData.setErrorReason("注册失败，用户名已被注册："+params.getUser_name());
				return jsonData;
			}
			
			//添加用户入库
			params.setReg_date(DateUtil.getCurDateTime());
			loginIndexManager.addUser(params);
			
		} catch (Exception e) {
			jsonData.setErrorReason("注册异常，请稍后重试");
			return jsonData;
		}
		
		return jsonData;
	}
	
}
