# 华南理工大学SCUT大三网络工程班在线商城网站大作业设计

本项目是华南理工大学SCUT大三网络工程班朱浩轩的在线商城网站大作业设计，学号为202230444078。

## 项目概述

本在线商城项目旨在提供一个全面的电子商务平台，具有商品管理、订单跟踪、用户管理以及销售分析等功能。该项目基于Spring Boot框架构建，包括后端和前端组件。

## 技术栈

- **后端**：Spring Boot, MyBatis
- **前端**：JSP, HTML, CSS, JavaScript（包括jQuery和ECharts）
- **数据库**：MySQL 8
- **构建工具**：Maven (>=3.5)
- **Java版本**：JDK 1.8

## 项目结构
<pre>
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
</pre>
## 设置说明

1. **环境要求**：
   - Maven (>=3.5)
   - MySQL 8
   - JDK 1.8
   - 推荐使用IDEA专业版进行实践

2. **数据库设置**：
   - 导入提供的SQL脚本以设置数据库模式。

3. **构建和运行**：
   - 使用Maven构建项目。
   - 运行`WshopApplication.java`作为Spring Boot应用程序。

## 贡献

欢迎贡献！请遵循标准的GitHub fork-and-pull请求工作流程。

## 使用教程
自行配置好IDEA专业版（可高校认证）、JDK1.8（必须）、Mysql8、Maven3.5以上版本

### 配置数据库：
![image](https://github.com/user-attachments/assets/d3e68cbf-8b55-4098-b85b-ef145ab3862e)
根据自己的数据库进行修改。需要先运行.sql文件部署数据库。

### Maven配置
File（文件）---Setting（设置），选择你的maven安装的根目录
User setting File：Maven的配置文件路径
![image](https://github.com/user-attachments/assets/1fa426a9-5ebc-476d-a4d5-bbbf955fc1d6)

### 编码配置
选中项目后，点击FIle-Settings
![image](https://github.com/user-attachments/assets/fac29b93-d421-437e-a1f3-ddd923e38103)
![image](https://github.com/user-attachments/assets/9e91ac94-0ffc-4ff4-93e8-4ff845169a4f)

### JDK配置
File-Project Structure
![image](https://github.com/user-attachments/assets/2149ba7b-1e90-4ccf-aec5-4c9514c1db7b)
如果没有配置过JDK，点击New，选择JDK目录加载一个JDK
![image](https://github.com/user-attachments/assets/609beee5-3197-46bf-b195-12bd5a5c9b09)
![image](https://github.com/user-attachments/assets/ac726eac-a8e4-4de8-9aef-25173e2b9e9d)

### 浏览地址
前台访问地址：http://localhost:8088
用户：test		111111
后台访问地址：http://localhost:8088/admin
系统管理员：admin 	111111
