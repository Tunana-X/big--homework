这是2025年华南理工大学SCUT大三网络工程班朱浩轩的在线商城网站大作业设计 学号202230444078
以下为整体代码结构
src/
├── main/
│   ├── java/
│   │   └── com.soft/
│   │       ├── common/              # 通用工具类与基类
│   │       │   ├── domain/
│   │       │   │   └── BaseDomain.java  # 分页基类（start/limit）
│   │       │   └── util/
│   │           ├── Md5.java         # 密码加密工具
│   │           ├── PaperUtil.java   # 分页工具类
│   │           ├── DateUtil.java    # 日期解析工具
│   │           └── PathUtil.java    # 路径处理工具
│   │
│   │       ├── controller/          # 控制层（REST API + JSP 路由）
│   │       │   ├── AdminController.java  # 管理后台接口（商品管理、订单统计、销售趋势）
│   │       │   ├── IndexController.java  # 前台接口（商品推荐、留言管理）
│   │       │   ├── LoginController.java  # 用户登录验证
│   │       │   ├── UploadAdminController.java  # 图片上传接口
│   │       │   └── ...（其他控制器）
│   │
│   │       ├── dao/                # 数据访问层（MyBatis 接口）
│   │       │   ├── IGoodsDao.java      # 商品管理接口
│   │       │   ├── IOrdersDetailDao.java # 订单明细查询接口
│   │       │   ├── IUserDao.java       # 用户管理接口
│   │       │   ├── IUviewDao.java      # 用户浏览记录接口
│   │       │   └── ...（其他 DAO 接口）
│   │
│   │       ├── domain/              # 实体类（与数据库表映射）
│   │       │   ├── Goods.java       # 商品实体（goods 表）
│   │       │   ├── OrdersDetail.java # 订单明细实体（orders_detail 表）
│   │       │   ├── User.java        # 用户实体（user 表）
│   │       │   ├── Uview.java       # 用户浏览记录实体（uview 表）
│   │       │   └── ...（其他实体类）
│   │
│   │       ├── service/             # 业务逻辑层
│   │       │   ├── AdminService.java    # 管理后台业务逻辑
│   │       │   ├── IndexService.java    # 前台推荐算法逻辑
│   │       │   ├── SalesPredictionService.java  # 销量预测服务
│   │       │   └── ...（其他服务类）
│   │
│   │       └── WshopApplication.java  # Spring Boot 主启动类
│   │
│   └── webapp/                    # 前端资源与 JSP 页面
│       ├── admin/                 # 后台管理页面
│       │   ├── goodsShow.jsp      # 商品列表展示
│       │   ├── salesChart.jsp     # 销量趋势分析页面
│       │   ├── ordersDetailShow.jsp # 订单明细展示
│       │   └── ...（其他后台页面）
│       │
│       ├── css/                   # 样式表
│       ├── js/                    # JavaScript 脚本（含 jQuery、ECharts）
│       ├── images/                # 静态图片资源
│       ├── META-INF/              # 应用元信息（如 context.xml）
│       ├── WEB-INF/               # 安全 JSP 页面（如 main.jsp）
│       │   └── jsp/              # 受保护的 JSP 模板
│       │       ├── left.jsp       # 左侧菜单
│       │       ├── top.jsp        # 顶部导航
│       │       └── ...（其他模板）
│       │
│       ├── 404.html               # 自定义 404 页面
│       ├── Error.html              # 自定义错误页面
│       ├── index.jsp               # 首页
│       └── login.jsp              # 登录页面
│
└── test/                          # 单元测试模块（未提供）
本项目基于SpringBoot框架实现，配置要求Maven>=3.5,Mysql8,JDK1.8，推荐使用IDEA专业版进行实践。
