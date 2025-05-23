package com.soft.controller;

import java.text.SimpleDateFormat;
import java.util.*;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.soft.common.util.DateUtil;
import com.soft.common.util.Md5;
import com.soft.common.util.PaperUtil;
import com.soft.dao.IGoodsDao;
import com.soft.dao.IOrdersDetailDao;
import com.soft.domain.*;
import com.soft.service.AdminService;
import com.soft.service.SalesPredictionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class AdminController {

	@Autowired
	AdminService adminManager;
	String tip;

	@Autowired
	IOrdersDetailDao ordersDetailDao;

	@Autowired
	SalesPredictionService salesPredictionService;



	/**
	 * @Title: admin
	 * @Description: 首页
	 * @return String
	 * @throws Exception
	 */
	@RequestMapping(value= {"admin"},method=RequestMethod.GET)
	public void admin(ModelMap model,HttpServletRequest request,HttpServletResponse response,HttpSession httpSession) throws Exception{
		response.sendRedirect(request.getContextPath() + "admin/index.jsp");
	}


	@RequestMapping("admin/Admin_listUserLoginLogs.action")
	public String listUserLoginLogs(UserLoginLog paramsLog, PaperUtil paperUtil, ModelMap model, HttpSession session) {
		try {
			if (paramsLog == null) {
				paramsLog = new UserLoginLog();
			}
			if (paperUtil == null) {
				paperUtil = new PaperUtil();
			}
			paperUtil.setPagination(paramsLog); // 设置 start/limit
			int[] sum = {0};
			List<UserLoginLog> logs = adminManager.listUserLoginLogs(paramsLog, sum);

			model.addAttribute("logs", logs);          // ✅ 必须传递 logs
			model.addAttribute("paramsLog", paramsLog);  // ✅ 用于搜索条件回显
			paperUtil.setTotalCount(sum[0]);
			model.addAttribute("paperUtil", paperUtil); // ✅ 分页参数传递
		} catch (Exception e) {
			setErrorTip("查询日志异常", "main.jsp", model);
			return "infoTip";
		}
		return "userLoginLogShow"; // JSP 页面名
	}

	@RequestMapping("/admin/Admin_salesChart.action")
	public String getSalesChart(
			@RequestParam(required = false) Integer goods_id,
			@RequestParam(required = false) String goods_name,
			@RequestParam(required = false) String startDate,
			@RequestParam(required = false) String endDate,
			ModelMap model,
			HttpSession session) {
		try {
			// 初始化默认日期范围（若未提供）
			Date _startDate = DateUtil.parse(startDate); // 支持 "yyyy-MM-dd" 和 "yyyy/MM/dd"
			Date _endDate = DateUtil.parse(endDate);

			// 若解析失败，设置默认值（如：最近30天）
			if (_startDate == null) {
				_startDate = DateUtil.addDays(new Date(), -30);
			}
			if (_endDate == null) {
				_endDate = new Date();
			}

			// 验证日期逻辑（结束日期不能早于开始日期）
			if (_startDate.after(_endDate)) {
				throw new IllegalArgumentException("开始日期不能晚于结束日期");
			}

			// 查询销售数据
			List<OrdersDetail> salesHistory = new ArrayList<>();
			if (goods_id != null && goods_id > 0) {
				// 通过商品ID查询
				salesHistory = ordersDetailDao.listSalesHistoryByGoodsId(goods_id, _startDate, _endDate);
			} else if (goods_name != null && !goods_name.isEmpty()) {
				// 通过商品名称查询
				salesHistory = ordersDetailDao.listSalesHistoryByGoodsName(goods_name, _startDate, _endDate);
			}

			// 处理日期格式转换（用于图表显示）
			List<String> dateStrList = salesHistory.stream()
					.map(od -> new SimpleDateFormat("yyyy-MM-dd").format(od.getSaleDate()))
					.collect(Collectors.toList());

			// 设置模型属性
			model.addAttribute("goodsId", goods_id != null ? goods_id : 0);
			model.addAttribute("goodsName", goods_name != null ? goods_name : "");
			// 保持日期格式与前端一致（yyyy-MM-dd）
			model.addAttribute("startDate", DateUtil.dateToDateString(_startDate, "yyyy-MM-dd"));
			model.addAttribute("endDate", DateUtil.dateToDateString(_endDate, "yyyy-MM-dd"));

			// 传递销售历史和预测数据
			if (salesHistory.isEmpty()) {
				model.addAttribute("noSales", true);
				model.addAttribute("salesHistory", null);
			} else {
				model.addAttribute("salesHistory", salesHistory);
				model.addAttribute("noSales", false);
				List<Integer> sales = salesHistory.stream()
						.map(OrdersDetail::getTotalSales)
						.collect(Collectors.toList());
				model.addAttribute("predictions", salesPredictionService.predict(sales));
			}
		} catch (Exception e) {
			setErrorTip("销量查询失败：" + e.getMessage(), "main.jsp", model);
			return "infoTip";
		}
		return "salesChart";
	}
	@Autowired
	IGoodsDao goodsDao;

	@RequestMapping("/admin/Admin_listGoodssForSelect.action")
	@ResponseBody
	public List<Map<String, Object>> listGoodssForSelect(@RequestParam String keyword) {
		Goods goods = new Goods();
		goods.setGoods_name(keyword);
		List<Goods> goodss = adminManager.listSalesHistory(goods); // ✅ 使用新方法
		return goodss.stream().map(g -> {
			Map<String, Object> map = new HashMap<>();
			map.put("goodsId", g.getGoods_id());
			map.put("goodsName", g.getGoods_name());
			return map;
		}).collect(Collectors.toList());
	}
	/**
	 * @Title: saveAdmin
	 * @Description: 保存修改个人信息
	 * @return String
	 */
	@RequestMapping(value="admin/Admin_saveAdmin.action")
	public String saveAdmin(User paramsUser,
							ModelMap model, HttpServletRequest request, HttpServletResponse response, HttpSession httpSession){
		try {
			//验证用户会话是否失效
			if (!validateAdmin(httpSession)) {
				return "loginTip";
			}
			 //保存修改个人信息
			adminManager.updateManager(paramsUser);
			//更新session
			User admin = new User();
			admin.setUser_id(paramsUser.getUser_id());
			admin = adminManager.getManager(admin);
			httpSession.setAttribute("admin", admin);

			setSuccessTip("编辑成功", "modifyInfo.jsp", model);
		} catch (Exception e) {
			e.printStackTrace();
			setErrorTip("编辑异常", "modifyInfo.jsp", model);
		}
		return "infoTip";
	}
	
	/**
	 * @Title: saveAdminPass
	 * @Description: 保存修改个人密码
	 * @return String
	 */
	@RequestMapping(value="admin/Admin_saveAdminPass.action",method=RequestMethod.POST)
	public String saveAdminPass(User paramsManager,
			ModelMap model,HttpServletRequest request,HttpServletResponse response,HttpSession httpSession){
		try {
			//验证用户会话是否失效
			if (!validateAdmin(httpSession)) {
				return "loginTip";
			}
			User admin = (User)httpSession.getAttribute("admin");
			if (!admin.getUser_pass().equals(Md5.makeMd5(paramsManager.getUser_passOld()))) {
				setErrorTip("修改异常，原密码不正确", "modifyPwd.jsp", model);
				return "infoTip";
			}
			 //保存修改个人密码
			adminManager.updateManager(paramsManager);
			//更新session
			if (admin!=null) {
				admin.setUser_pass(paramsManager.getUser_pass());
				httpSession.setAttribute("admin", admin);
			}

			setSuccessTip("修改成功", "modifyPwd.jsp", model);
		} catch (Exception e) {
			setErrorTip("修改异常", "modifyPwd.jsp", model);
		}
		return "infoTip";
	}
	 
	/**
	 * @Title: listMemberTypes
	 * @Description: 查询会员类别
	 * @return String
	 */
	@RequestMapping(value="admin/Admin_listMemberTypes.action")
	public String listMemberTypes(MemberType paramsMemberType, PaperUtil paperUtil,
								  ModelMap model, HttpServletRequest request, HttpServletResponse response, HttpSession httpSession){
		try {
			if (paramsMemberType==null) {
				paramsMemberType = new MemberType();
			}
			
			//设置分页信息
			if (paperUtil==null) {
				paperUtil = new PaperUtil();
			}
			paperUtil.setPagination(paramsMemberType);
			//总的条数
			int[] sum={0};
			//查询会员类别列表
			List<MemberType> memberTypes = adminManager.listMemberTypes(paramsMemberType,sum); 
			
			model.addAttribute("memberTypes", memberTypes);
			model.addAttribute("paramsMemberType", paramsMemberType);
			paperUtil.setTotalCount(sum[0]);
			
		} catch (Exception e) {
			setErrorTip("查询会员类别异常", "main.jsp", model);
			return "infoTip";
		}
		
		return "memberTypeShow";
	}
	
	/**
	 * @Title: addMemberTypeShow
	 * @Description: 显示添加会员类别页面
	 * @return String
	 */
	@RequestMapping(value="admin/Admin_addMemberTypeShow.action")
	public String addMemberTypeShow(ModelMap model){
		return "memberTypeEdit";
	}
	
	/**
	 * @Title: addMemberType
	 * @Description: 添加会员类别
	 * @return String
	 */
	@RequestMapping(value="admin/Admin_addMemberType.action")
	public String addMemberType(MemberType paramsMemberType,
			ModelMap model,HttpServletRequest request,HttpServletResponse response,HttpSession httpSession){
		try {
			//检查会员类别是否存在
			MemberType memberType = new MemberType();
			memberType.setMember_type_name(paramsMemberType.getMember_type_name());
			memberType = adminManager.queryMemberType(memberType);
			if (memberType!=null) {
				tip="失败，该会员类别已经存在！";
				model.addAttribute("tip", tip);
				model.addAttribute("memberType", paramsMemberType);
				
				return "memberTypeEdit";
			}
			
			 //添加会员类别
			adminManager.addMemberType(paramsMemberType);
			
			setSuccessTip("添加成功", "Admin_listMemberTypes.action",model);
		} catch (Exception e) {
			setErrorTip("添加会员类别异常", "Admin_listMemberTypes.action", model);
		}
		
		return "infoTip";
	}
	
	 
	/**
	 * @Title: editMemberType
	 * @Description: 编辑会员类别
	 * @return String
	 */
	@RequestMapping(value="admin/Admin_editMemberType.action")
	public String editMemberType(MemberType paramsMemberType,
			ModelMap model,HttpServletRequest request,HttpServletResponse response,HttpSession httpSession){
		try {
			 //得到会员类别
			MemberType memberType = adminManager.queryMemberType(paramsMemberType);
			model.addAttribute("memberType", memberType);
			
		} catch (Exception e) {
			setErrorTip("查询会员类别异常", "Admin_listMemberTypes.action", model);
			return "infoTip";
		}
		
		return "memberTypeEdit";
	}
	
	/**
	 * @Title: saveMemberType
	 * @Description: 保存编辑会员类别
	 * @return String
	 */
	@RequestMapping(value="admin/Admin_saveMemberType.action")
	public String saveMemberType(MemberType paramsMemberType,
			ModelMap model,HttpServletRequest request,HttpServletResponse response,HttpSession httpSession){
		try {
			//检查会员类别是否存在
			MemberType memberType = new MemberType();
			memberType.setMember_type_name(paramsMemberType.getMember_type_name());
			memberType = adminManager.queryMemberType(memberType);
			if (memberType!=null && memberType.getMember_type_id()!=paramsMemberType.getMember_type_id()) {
				tip="失败，该会员类别已经存在！";
				model.addAttribute("memberType", paramsMemberType);
				
				return "memberTypeEdit";
			}
			
			 //保存编辑会员类别
			adminManager.updateMemberType(paramsMemberType);
			
			setSuccessTip("编辑成功", "Admin_listMemberTypes.action",model);
		} catch (Exception e) {
			e.printStackTrace();
			setErrorTip("编辑失败", "Admin_listMemberTypes.action",model);
		}
		
		return "infoTip";
	}
	
	/**
	 * @Title: delMemberTypes
	 * @Description: 删除会员类别
	 * @return String
	 */
	@RequestMapping(value="admin/Admin_delMemberTypes.action")
	public String delMemberTypes(MemberType paramsMemberType,
			ModelMap model,HttpServletRequest request,HttpServletResponse response,HttpSession httpSession){
		try {
			 //删除会员类别
			adminManager.delMemberTypes(paramsMemberType);
			
			setSuccessTip("删除会员类别成功", "Admin_listMemberTypes.action",model);
		} catch (Exception e) {
			setErrorTip("删除会员类别异常", "Admin_listMemberTypes.action", model);
		}
		
		return "infoTip";
	}
	
	/**
	 * @Title: listUsers
	 * @Description: 查询会员
	 * @return String
	 */
	@RequestMapping(value="admin/Admin_listUsers.action")
	public String listUsers(Member paramsUser,PaperUtil paperUtil,
			ModelMap model,HttpServletRequest request,HttpServletResponse response,HttpSession httpSession){
		try {
			if (paramsUser==null) {
				paramsUser = new Member();
			}
			if (paperUtil==null) {
				paperUtil = new PaperUtil();
			}
			//设置分页信息
			paperUtil.setPagination(paramsUser);
			//总的条数
			int[] sum={0};
			//查询会员列表
			List<Member> users = adminManager.listUsers(paramsUser,sum); 
			model.addAttribute("users", users);
			model.addAttribute("paramsUser", paramsUser);
			paperUtil.setTotalCount(sum[0]);
			
			//查询会员类型
			MemberType memberType = new MemberType();
			memberType.setStart(-1);
			List<MemberType> memberTypes = adminManager.listMemberTypes(memberType, null);
			if (memberTypes==null) {
				memberTypes = new ArrayList<>();
			}
			model.addAttribute("memberTypes", memberTypes);

		} catch (Exception e) {
			setErrorTip("查询会员异常", "main.jsp", model);
			return "infoTip";
		}
		
		return "userShow";
	}
	
	/**
	 * @Title: addUserShow
	 * @Description: 显示添加会员页面
	 * @return String
	 */
	@RequestMapping(value="admin/Admin_addUserShow.action",method=RequestMethod.GET)
	public String addUserShow(Member paramsUser,ModelMap model){
		//查询会员类型
		MemberType memberType = new MemberType();
		memberType.setStart(-1);
		List<MemberType> memberTypes = adminManager.listMemberTypes(memberType, null);
		if (memberTypes==null) {
			memberTypes = new ArrayList<>();
		}
		model.addAttribute("memberTypes", memberTypes);
		
		return "userEdit";
	}
	
	/**
	 * @Title: addUser
	 * @Description: 添加会员
	 * @return String
	 */
	@RequestMapping(value="admin/Admin_addUser.action",method=RequestMethod.POST)
	public String addUser(Member paramsUser,
			ModelMap model,HttpServletRequest request,HttpServletResponse response,HttpSession httpSession){
		try {
			//检查会员是否存在
			Member user = new Member();
			user.setUser_name(paramsUser.getUser_name());
			user = adminManager.getUser(user);
			if (user!=null) {
				model.addAttribute("tip","失败，该用户名已经存在！");
				model.addAttribute("user", paramsUser);
				
				return "userEdit";
			}
			 //添加会员
			adminManager.addUser(paramsUser);
			
			setSuccessTip("添加成功", "Admin_listUsers.action", model);
		} catch (Exception e) {
			setErrorTip("添加会员异常", "Admin_listUsers.action", model);
		}
		
		return "infoTip";
	}
	
	 
	/**
	 * @Title: editUser
	 * @Description: 编辑会员
	 * @return String
	 */
	@RequestMapping(value="admin/Admin_editUser.action",method=RequestMethod.GET)
	public String editUser(Member paramsUser,
			ModelMap model,HttpServletRequest request,HttpServletResponse response,HttpSession httpSession){
		try {
			 //得到会员
			Member user = adminManager.getUser(paramsUser);
			model.addAttribute("user", user);
			
		} catch (Exception e) {
			setErrorTip("查询会员异常", "Admin_listUsers.action", model);
			return "infoTip";
		}
		
		return "userEdit";
	}
	
	/**
	 * @Title: saveUser
	 * @Description: 保存编辑会员
	 * @return String
	 */
	@RequestMapping(value="admin/Admin_saveUser.action",method=RequestMethod.POST)
	public String saveUser(Member paramsUser,
			ModelMap model,HttpServletRequest request,HttpServletResponse response,HttpSession httpSession){
		try {
			 //保存编辑会员
			adminManager.updateUser(paramsUser);
			
			setSuccessTip("编辑成功", "Admin_listUsers.action", model);
		} catch (Exception e) {
			setErrorTip("编辑会员异常", "Admin_listUsers.action", model);
			return "infoTip";
		}
		
		return "infoTip";
	}
	
	/**
	 * @Title: delUsers
	 * @Description: 删除会员
	 * @return String
	 */
	@RequestMapping(value="admin/Admin_delUsers.action")
	public String delUsers(Member paramsUser,
			ModelMap model,HttpServletRequest request,HttpServletResponse response,HttpSession httpSession){
		try {
			 //删除会员
			adminManager.delUsers(paramsUser);
			
			setSuccessTip("删除会员成功", "Admin_listUsers.action", model);
		} catch (Exception e) {
			setErrorTip("删除会员异常", "Admin_listUsers.action", model);
		}
		
		return "infoTip";
	}
	
	/**
	 * @Title: listGoodsTypes
	 * @Description: 查询商品类别
	 * @return String
	 */
	@RequestMapping(value="admin/Admin_listGoodsTypes.action")
	public String listGoodsTypes(GoodsType paramsGoodsType, PaperUtil paperUtil,
								 ModelMap model, HttpServletRequest request, HttpServletResponse response, HttpSession httpSession){
		try {
			if (paramsGoodsType==null) {
				paramsGoodsType = new GoodsType();
			}
			
			//设置分页信息
			if (paperUtil==null) {
				paperUtil = new PaperUtil();
			}
			paperUtil.setPagination(paramsGoodsType);
			//总的条数
			int[] sum={0};
			//查询商品类别列表
			List<GoodsType> goodsTypes = adminManager.listGoodsTypes(paramsGoodsType,sum); 
			
			model.addAttribute("goodsTypes", goodsTypes);
			model.addAttribute("paramsGoodsType", paramsGoodsType);
			paperUtil.setTotalCount(sum[0]);
			
		} catch (Exception e) {
			setErrorTip("查询商品类别异常", "main.jsp", model);
			return "infoTip";
		}
		
		return "goodsTypeShow";
	}
	
	/**
	 * @Title: addGoodsTypeShow
	 * @Description: 显示添加商品类别页面
	 * @return String
	 */
	@RequestMapping(value="admin/Admin_addGoodsTypeShow.action")
	public String addGoodsTypeShow(ModelMap model){
		return "goodsTypeEdit";
	}
	
	/**
	 * @Title: addGoodsType
	 * @Description: 添加商品类别
	 * @return String
	 */
	@RequestMapping(value="admin/Admin_addGoodsType.action")
	public String addGoodsType(GoodsType paramsGoodsType,
			ModelMap model,HttpServletRequest request,HttpServletResponse response,HttpSession httpSession){
		try {
			//检查商品类别是否存在
			GoodsType goodsType = new GoodsType();
			goodsType.setGoods_type_name(paramsGoodsType.getGoods_type_name());
			goodsType = adminManager.queryGoodsType(goodsType);
			if (goodsType!=null) {
				tip="失败，该商品类别已经存在！";
				model.addAttribute("tip", tip);
				model.addAttribute("goodsType", paramsGoodsType);
				
				return "goodsTypeEdit";
			}
			
			 //添加商品类别
			adminManager.addGoodsType(paramsGoodsType);
			
			setSuccessTip("添加成功", "Admin_listGoodsTypes.action",model);
		} catch (Exception e) {
			setErrorTip("添加商品类别异常", "Admin_listGoodsTypes.action", model);
		}
		
		return "infoTip";
	}
	
	 
	/**
	 * @Title: editGoodsType
	 * @Description: 编辑商品类别
	 * @return String
	 */
	@RequestMapping(value="admin/Admin_editGoodsType.action")
	public String editGoodsType(GoodsType paramsGoodsType,
			ModelMap model,HttpServletRequest request,HttpServletResponse response,HttpSession httpSession){
		try {
			 //得到商品类别
			GoodsType goodsType = adminManager.queryGoodsType(paramsGoodsType);
			model.addAttribute("goodsType", goodsType);
			
		} catch (Exception e) {
			setErrorTip("查询商品类别异常", "Admin_listGoodsTypes.action", model);
			return "infoTip";
		}
		
		return "goodsTypeEdit";
	}
	
	/**
	 * @Title: saveGoodsType
	 * @Description: 保存编辑商品类别
	 * @return String
	 */
	@RequestMapping(value="admin/Admin_saveGoodsType.action")
	public String saveGoodsType(GoodsType paramsGoodsType,
			ModelMap model,HttpServletRequest request,HttpServletResponse response,HttpSession httpSession){
		try {
			//检查商品类别是否存在
			GoodsType goodsType = new GoodsType();
			goodsType.setGoods_type_name(paramsGoodsType.getGoods_type_name());
			goodsType = adminManager.queryGoodsType(goodsType);
			if (goodsType!=null && goodsType.getGoods_type_id()!=paramsGoodsType.getGoods_type_id()) {
				tip="失败，该商品类别已经存在！";
				model.addAttribute("goodsType", paramsGoodsType);
				
				return "goodsTypeEdit";
			}
			
			 //保存编辑商品类别
			adminManager.updateGoodsType(paramsGoodsType);
			
			setSuccessTip("编辑成功", "Admin_listGoodsTypes.action",model);
		} catch (Exception e) {
			e.printStackTrace();
			setErrorTip("编辑失败", "Admin_listGoodsTypes.action",model);
		}
		
		return "infoTip";
	}
	
	/**
	 * @Title: delGoodsTypes
	 * @Description: 删除商品类别
	 * @return String
	 */
	@RequestMapping(value="admin/Admin_delGoodsTypes.action")
	public String delGoodsTypes(GoodsType paramsGoodsType,
			ModelMap model,HttpServletRequest request,HttpServletResponse response,HttpSession httpSession){
		try {
			 //删除商品类别
			adminManager.delGoodsTypes(paramsGoodsType);
			
			setSuccessTip("删除商品类别成功", "Admin_listGoodsTypes.action",model);
		} catch (Exception e) {
			setErrorTip("删除商品类别异常", "Admin_listGoodsTypes.action", model);
		}
		
		return "infoTip";
	}
	
	/**
	 * @Title: listGoodss
	 * @Description: 查询商品
	 * @return String
	 */
	@RequestMapping(value="admin/Admin_listGoodss.action")
	public String listGoodss(Goods paramsGoods, PaperUtil paperUtil,
							 ModelMap model, HttpServletRequest request, HttpServletResponse response, HttpSession httpSession){
		try {
			if (paramsGoods==null) {
				paramsGoods = new Goods();
			}
			//设置分页信息
			if (paperUtil==null) {
				paperUtil = new PaperUtil();
			}
			paperUtil.setPagination(paramsGoods);
			int[] sum={0};
			List<Goods> goodss = adminManager.listGoodss(paramsGoods,sum); 
			model.addAttribute("goodss", goodss);
			paperUtil.setTotalCount(sum[0]);
			model.addAttribute("paramsGoods", paramsGoods);
			
			//查询商品类别
			GoodsType goodsType1 = new GoodsType();
			goodsType1.setStart(-1);
			List<GoodsType> goodsTypes1 = adminManager.listGoodsTypes(goodsType1, null);
			model.addAttribute("goodsTypes", goodsTypes1);

		} catch (Exception e) {
			setErrorTip("查询商品异常", "main.jsp", model);
			return "infoTip";
		}
		
		return "goodsShow";
	}
	
	/**
	 * @Title: queryGoods
	 * @Description: 查看商品
	 * @return String
	 */
	@RequestMapping(value="admin/Admin_queryGoods.action")
	public String queryGoods(Goods paramsGoods,ModelMap model){
		try {
			 //得到商品
			Goods goods = adminManager.queryGoods(paramsGoods);
			model.addAttribute("goods", goods);
			
		} catch (Exception e) {
			e.printStackTrace();
			setErrorTip("查询商品异常", "Admin_listGoodss.action", model);
			return "infoTip";
		}
		
		return "goodsDetail";
	}
	
	/**
	 * @Title: addGoodsShow
	 * @Description: 显示添加商品页面
	 * @return String
	 */
	@RequestMapping(value="admin/Admin_addGoodsShow.action")
	public String addGoodsShow(Goods paramsGoods,ModelMap model){
		//查询商品类别
		GoodsType goodsType1 = new GoodsType();
		goodsType1.setStart(-1);
		List<GoodsType> goodsTypes1 = adminManager.listGoodsTypes(goodsType1, null);
		model.addAttribute("goodsTypes", goodsTypes1);
		
		return "goodsEdit";
	}
	
	/**
	 * @Title: addGoods
	 * @Description: 添加商品
	 * @return String
	 */
	@RequestMapping(value="admin/Admin_addGoods.action")
	public String addGoods(Goods paramsGoods,
			ModelMap model,HttpServletRequest request,HttpServletResponse response,HttpSession httpSession){
		try {
			//查询商品类别
			GoodsType goodsType1 = new GoodsType();
			goodsType1.setStart(-1);
			List<GoodsType> goodsTypes1 = adminManager.listGoodsTypes(goodsType1, null);
			if(paramsGoods.getGoods_type_id()==0){
				paramsGoods.setGoods_type_id(goodsTypes1.get(0).getGoods_type_id());
			}
			 //添加商品
			adminManager.addGoods(paramsGoods);

			setSuccessTip("添加商品成功", "Admin_listGoodss.action", model);
		} catch (Exception e) {
			e.printStackTrace();
			setErrorTip("添加商品异常", "Admin_listGoodss.action", model);
		}
		return "infoTip";
	}
	
	/**
	 * @Title: editGoods
	 * @Description: 编辑商品
	 * @return String
	 */
	@RequestMapping(value="admin/Admin_editGoods.action")
	public String editGoods(Goods paramsGoods,
			ModelMap model,HttpServletRequest request,HttpServletResponse response,HttpSession httpSession){
		try {
			 //得到商品
			Goods goods = adminManager.queryGoods(paramsGoods);
			model.addAttribute("goods", goods);
			
			//查询商品类别
			GoodsType goodsType1 = new GoodsType();
			goodsType1.setStart(-1);
			List<GoodsType> goodsTypes1 = adminManager.listGoodsTypes(goodsType1, null);
			model.addAttribute("goodsTypes", goodsTypes1);
		} catch (Exception e) {
			setErrorTip("查询商品异常", "Admin_listGoodss.action", model);
			return "infoTip";
		}
		
		return "goodsEdit";
	}
	
	/**
	 * @Title: saveGoods
	 * @Description: 保存编辑商品
	 * @return String
	 */
	@RequestMapping(value="admin/Admin_saveGoods.action")
	public String saveGoods(Goods paramsGoods,
			ModelMap model,HttpServletRequest request,HttpServletResponse response,HttpSession httpSession){
		try {
			 //保存编辑商品
			adminManager.updateGoods(paramsGoods);
			setSuccessTip("编辑商品成功", "Admin_listGoodss.action", model);
			
		} catch (Exception e) {
			e.printStackTrace();
			setErrorTip("编辑商品失败", "Admin_listGoodss.action", model);
		}
		return "infoTip";
	}
	
	/**
	 * @Title: delGoodss
	 * @Description: 删除商品
	 * @return String
	 */
	@RequestMapping(value="admin/Admin_delGoodss.action")
	public String delGoodss(Goods paramsGoods,
			ModelMap model,HttpServletRequest request,HttpServletResponse response,HttpSession httpSession){
		try {
			 //删除商品
			adminManager.delGoodss(paramsGoods);

			setSuccessTip("删除商品成功", "Admin_listGoodss.action", model);
		} catch (Exception e) {
			setErrorTip("删除商品异常", "Admin_listGoodss.action", model);
		}
		return "infoTip";
	}
	
	/**
	 * @Title: listOrderss
	 * @Description: 查询商品订单
	 * @return String
	 */
	@RequestMapping(value="admin/Admin_listOrderss.action")
	public String listOrderss(Orders paramsOrders,PaperUtil paperUtil,
			ModelMap model,HttpServletRequest request,HttpServletResponse response,HttpSession httpSession){
		try {
			if (paramsOrders==null) {
				paramsOrders = new Orders();
			}
			//设置分页信息
			if (paperUtil==null) {
				paperUtil = new PaperUtil();
			}
			paperUtil.setPagination(paramsOrders);
			//总的条数
			int[] sum={0};
			//查询商品订单列表
			List<Orders> orderss = adminManager.listOrderss(paramsOrders,sum); 
			
			model.addAttribute("orderss", orderss);
			paperUtil.setTotalCount(sum[0]);
			
		} catch (Exception e) {
			setErrorTip("查询商品订单异常", "main.jsp", model);
			return "infoTip";
		}
		
		return "ordersShow";
	}
	
	/**
	 * @Title: sendOrders
	 * @Description: 订单发货
	 * @return String
	 */
	@RequestMapping(value="admin/Admin_sendOrders.action")
	public String sendOrders(Orders paramsOrders,
			ModelMap model,HttpServletRequest request,HttpServletResponse response,HttpSession httpSession){
		try {
			 //订单发货
			adminManager.sendOrders(paramsOrders);
			
			setSuccessTip("订单发货成功", "Admin_listOrderss.action", model);
		} catch (Exception e) {
			setErrorTip("订单发货异常", "Admin_listOrderss.action", model);
		}
		
		return "infoTip";
	}
	
	 
	/**
	 * @Title: delOrderss
	 * @Description: 删除商品订单
	 * @return String
	 */
	@RequestMapping(value="admin/Admin_delOrderss.action")
	public String delOrderss(Orders paramsOrders,
			ModelMap model,HttpServletRequest request,HttpServletResponse response,HttpSession httpSession){
		try {
			 //删除商品订单
			adminManager.delOrderss(paramsOrders);
			
			setSuccessTip("删除商品订单成功", "Admin_listOrderss.action", model);
		} catch (Exception e) {
			setErrorTip("删除商品订单异常", "Admin_listOrderss.action", model);
		}
		
		return "infoTip";
	}
	
	/**
	 * @Title: listOrdersDetails
	 * @Description: 查询商品订单明细
	 * @return String
	 */
	@RequestMapping(value="admin/Admin_listOrdersDetails.action")
	public String listOrdersDetails(OrdersDetail paramsOrdersDetail,PaperUtil paperUtil,
			ModelMap model,HttpServletRequest request,HttpServletResponse response,HttpSession httpSession){
		try {
			if (paramsOrdersDetail==null) {
				paramsOrdersDetail = new OrdersDetail();
			}
			//设置分页信息
			if (paperUtil==null) {
				paperUtil = new PaperUtil();
			}
			paperUtil.setPagination(paramsOrdersDetail);
			//总的条数
			int[] sum={0};
			//查询商品订单明细
			List<OrdersDetail> ordersDetails = adminManager.listOrdersDetails(paramsOrdersDetail,sum); 
			
			model.addAttribute("ordersDetails", ordersDetails);
			paperUtil.setTotalCount(sum[0]);
			
			model.addAttribute("orders_no", paramsOrdersDetail.getOrders_no());
			if (ordersDetails!=null && ordersDetails.size()>0) {
				model.addAttribute("orders_money", ordersDetails.get(0).getOrders_money());
			}
			
			
		} catch (Exception e) {
			setErrorTip("查询商品订单明细异常", "main.jsp", model);
			return "infoTip";
		}
		
		return "ordersDetailShow";
	}
	
	/**
	 * @Title: listOrdersDetailsSum
	 * @Description: 查询商品销售统计
	 * @return String
	 */
	@RequestMapping(value="admin/Admin_listOrdersDetailsSum.action")
	public String listOrdersDetailsSum(OrdersDetail paramsOrdersDetail,PaperUtil paperUtil,
			ModelMap model,HttpServletRequest request,HttpServletResponse response,HttpSession httpSession){
		try {
			if (paramsOrdersDetail==null) {
				paramsOrdersDetail = new OrdersDetail();
			}
			//设置分页信息
			if (paperUtil==null) {
				paperUtil = new PaperUtil();
			}
			paperUtil.setPagination(paramsOrdersDetail);
			//总的条数
			int[] sum={0};
			//查询商品订单明细
			List<OrdersDetail> ordersDetails = adminManager.listOrdersDetailsSum(paramsOrdersDetail,sum); 
			model.addAttribute("ordersDetails", ordersDetails);
			paperUtil.setTotalCount(sum[0]);
			
		} catch (Exception e) {
			setErrorTip("查询商品销售统计异常", "main.jsp", model);
			return "infoTip";
		}
		
		return "ordersDetailSumShow";
	}
	
	/**
	 * @Title: listSblogs
	 * @Description: 查询留言信息
	 * @return String
	 */
	@RequestMapping(value="admin/Admin_listSblogs.action")
	public String listSblogs(Sblog paramsSblog,PaperUtil paperUtil,
			ModelMap model,HttpServletRequest request,HttpServletResponse response,HttpSession httpSession){
		try {
			if (paramsSblog==null) {
				paramsSblog = new Sblog();
			}
			//设置分页信息
			if (paperUtil==null) {
				paperUtil = new PaperUtil();
			}
			paperUtil.setPagination(paramsSblog);
			int[] sum={0};
			List<Sblog> sblogs = adminManager.listSblogs(paramsSblog,sum); 
			model.addAttribute("sblogs", sblogs);
			model.addAttribute("paramsSblog", paramsSblog);
			paperUtil.setTotalCount(sum[0]);
			
		} catch (Exception e) {
			setErrorTip("查询留言信息异常", "main.jsp", model);
			return "infoTip";
		}
		
		return "sblogShow";
	}
	
	/**
	 * @Title:
	 * @Title: querySblog
	 * @Description: 编辑留言信息
	 * @return String
	 */
	@RequestMapping(value="admin/Admin_querySblog.action",method=RequestMethod.GET)
	public String querySblog(Sblog paramsSblog,
			ModelMap model,HttpServletRequest request,HttpServletResponse response,HttpSession httpSession){
		try {
			 //得到留言信息
			Sblog sblog = adminManager.querySblog(paramsSblog);
			model.addAttribute("sblog", sblog);
			
		} catch (Exception e) {
			setErrorTip("查询留言异常", "Admin_listSblogs.action", model);
			return "infoTip";
		}
		
		return "sblogDetail";
	}
	
	/**
	 * @Title: delSblogs
	 * @Description: 删除留言信息
	 * @return String
	 */
	@RequestMapping(value="admin/Admin_delSblogs.action")
	public String delSblogs(Sblog paramsSblog,
			ModelMap model,HttpServletRequest request,HttpServletResponse response,HttpSession httpSession){
		try {
			 //删除留言信息
			adminManager.delSblogs(paramsSblog);

			setSuccessTip("删除留言信息成功", "Admin_listSblogs.action", model);
		} catch (Exception e) {
			setErrorTip("删除留言信息异常", "Admin_listSblogs.action", model);
		}
		return "infoTip";
	}
	
	/**
	 * @Title:
	 * @Title: replySblog
	 * @Description: 回复留言信息
	 * @return String
	 */
	@RequestMapping(value="admin/Admin_replySblog.action",method=RequestMethod.GET)
	public String replySblog(Sblog paramsSblog,
			ModelMap model,HttpServletRequest request,HttpServletResponse response,HttpSession httpSession){
		try {
			 //得到留言信息
			Sblog sblog = adminManager.querySblog(paramsSblog);
			model.addAttribute("sblog", sblog);
			
		} catch (Exception e) {
			setErrorTip("查询留言异常", "Admin_listSblogs.action", model);
			return "infoTip";
		}
		
		return "sblogReply";
	}
	
	/**
	 * @Title: saveSblogReply
	 * @Description: 回复留言信息
	 * @return String
	 */
	@RequestMapping(value="admin/Admin_saveSblogReply.action")
	public String saveSblogReply(SblogReply paramsSblogReply,
			ModelMap model,HttpServletRequest request,HttpServletResponse response,HttpSession httpSession){
		try {
			 //回复留言信息
			adminManager.addSblogReply(paramsSblogReply);;

			setSuccessTip("回复留言成功", "Admin_listSblogs.action", model);
		} catch (Exception e) {
			setErrorTip("回复留言异常", "Admin_listSblogs.action", model);
		}
		return "infoTip";
	}
	
	/**
	 * @Title: listInfos
	 * @Description: 查询新闻资讯
	 * @return String
	 */
	@RequestMapping(value="admin/Admin_listInfos.action")
	public String listInfos(Info paramsInfo,PaperUtil paperUtil,
			ModelMap model,HttpServletRequest request,HttpServletResponse response,HttpSession httpSession){
		try {
			if (paramsInfo==null) {
				paramsInfo = new Info();
			}
			
			//设置分页信息
			if (paperUtil==null) {
				paperUtil = new PaperUtil();
			}
			//设置分页信息
			paperUtil.setPagination(paramsInfo);
			//总的条数
			int[] sum={0};
			//查询新闻资讯列表
			List<Info> infos = adminManager.listInfos(paramsInfo,sum); 
			
			model.addAttribute("infos", infos);
			model.addAttribute("paramsInfo", paramsInfo);
			paperUtil.setTotalCount(sum[0]);
			
		} catch (Exception e) {
			e.printStackTrace();
			setErrorTip("查询新闻资讯异常", "main.jsp", model);
			return "infoTip";
		}
		
		return "infoShow";
	}
	
	/**
	 * @Title: queryInfo
	 * @Description: 查询新闻资讯详情页面
	 * @return String
	 */
	@RequestMapping(value="admin/Admin_queryInfo.action",method=RequestMethod.GET)
	public String queryInfo(Info paramsInfo,
			ModelMap model,HttpServletRequest request,HttpSession httpSession){
		try {
			//查询新闻资讯详情
			Info info = adminManager.queryInfo(paramsInfo); 
			model.addAttribute("info", info);
			
		} catch (Exception e) {
			setErrorTip("查询新闻资讯详情异常", "main.jsp", model);
			return "infoTip";
		}
		return "infoDetail";
	}
	
	/**
	 * @Title: addInfoShow
	 * @Description: 显示添加新闻资讯页面
	 * @return String
	 */
	@RequestMapping(value="admin/Admin_addInfoShow.action",method=RequestMethod.GET)
	public String addInfoShow(HttpServletRequest request,HttpSession httpSession){
		return "infoEdit";
	}
	
	/**
	 * @Title: addInfo
	 * @Description: 添加新闻资讯
	 * @return String
	 */
	@RequestMapping(value="admin/Admin_addInfo.action",method=RequestMethod.POST)
	public String addInfo(Info paramsInfo,
			ModelMap model,HttpServletRequest request,HttpServletResponse response,HttpSession httpSession){
		try {
			 //添加新闻资讯
			adminManager.addInfo(paramsInfo);
			
			setSuccessTip("添加新闻资讯成功", "Admin_listInfos.action",model);
		} catch (Exception e) {
			setErrorTip("添加新闻资讯异常", "Admin_listInfos.action", model);
		}
		
		return "infoTip";
	}
	
	/**
	 * @Title: editInfo
	 * @Description: 更新新闻资讯
	 * @return String
	 */
	@RequestMapping(value="admin/Admin_editInfo.action",method=RequestMethod.GET)
	public String editInfo(Info paramsInfo,
			ModelMap model,HttpServletRequest request,HttpServletResponse response,HttpSession httpSession){
		try {
			 //得到新闻资讯
			Info info = adminManager.queryInfo(paramsInfo);
			model.addAttribute("info", info);
			
		} catch (Exception e) {
			setErrorTip("查询新闻资讯异常", "Admin_listInfo.action", model);
			return "infoTip";
		}
		
		return "infoEdit";
	}
	
	/**
	 * @Title: updateInfo
	 * @Description: 更新新闻资讯
	 * @return String
	 */
	@RequestMapping(value="admin/Admin_updateInfo.action")
	public String updateInfo(Info paramsInfo,
			ModelMap model,HttpServletRequest request,HttpServletResponse response,HttpSession httpSession){
		try {
			 //更新新闻资讯
			adminManager.updateInfo(paramsInfo);
			
			setSuccessTip("更新成功", "Admin_listInfos.action",model);
		} catch (Exception e) {
			e.printStackTrace();
			setErrorTip("更新失败", "Admin_listInfos.action",model);
		}
		
		return "infoTip";
	}
	
	/**
	 * @Title: delInfos
	 * @Description: 删除新闻资讯
	 * @return String
	 */
	@RequestMapping(value="admin/Admin_delInfos.action")
	public String delInfos(Info paramsInfo,
			ModelMap model,HttpServletRequest request,HttpServletResponse response,HttpSession httpSession){
		try {
			 //删除新闻资讯
			adminManager.delInfos(paramsInfo);
			
			setSuccessTip("删除新闻资讯成功", "Admin_listInfos.action",model);
		} catch (Exception e) {
			setErrorTip("删除新闻资讯异常", "Admin_listInfos.action", model);
		}
		
		return "infoTip";
	}
	
	private boolean validateAdmin(HttpSession httpSession){
		User admin = (User)httpSession.getAttribute("admin");
		if (admin!=null) {
			return true;
		}else {
			return false;
		}
	}
	
	private void setErrorTip(String tip,String url,ModelMap model){
		model.addAttribute("tipType", "error");
		model.addAttribute("tip", tip);
		model.addAttribute("url1", url);
		model.addAttribute("value1", "确 定");
	}
	
	private void setSuccessTip(String tip,String url,ModelMap model){
		model.addAttribute("tipType", "success");
		model.addAttribute("tip", tip);
		model.addAttribute("url1", url);
		model.addAttribute("value1", "确 定");
	}

}
