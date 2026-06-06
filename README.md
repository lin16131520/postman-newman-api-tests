# Postman + Newman 接口自动化测试项目

## 项目简介

本项目基于 Postman 和 Newman 完成 RESTful API 接口自动化测试，覆盖文章 CRUD、CSV 数据驱动、登录鉴权、Token 传递、电商购物车流程、异常场景和 Collection 级公共断言，并通过 Newman 生成 HTML 测试报告。

## 技术栈

- Postman
- Newman
- JavaScript Tests Script
- Collection Runner
- CSV 数据驱动
- Environment 变量管理
- Bearer Token 鉴权
- PowerShell 一键运行脚本
- GitHub Actions CI
- HTML Report

## 项目结构

```text
postman-newman
|-- .github
|   `-- workflows
|       `-- newman-api-tests.yml
|-- collections
|   `-- mockTest.postman_collection.json
|-- environments
|   `-- JSONPlaceholder-Test.postman_environment.json
|-- data
|   `-- post_ids.csv
|-- reports
|   `-- ecommerce-cart-report.html
|-- scripts
|   `-- run-ecommerce-cart.ps1
|-- package.json
`-- README.md
```

## 测试覆盖

- 文章 CRUD 接口测试
- CSV 数据驱动测试
- 登录获取 Token
- Token 鉴权接口测试
- 错误 Token 异常测试
- 商品详情查询
- 加入购物车
- 查询购物车
- 修改购物车商品数量
- 删除购物车
- 查询不存在购物车异常场景
- Collection 级公共断言

## 本地一键运行

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\run-ecommerce-cart.ps1
```

## GitHub Actions 运行

仓库推送到 `main` 或 `master` 分支后，GitHub Actions 会自动执行：

```text
.github/workflows/newman-api-tests.yml
```

CI 流程会完成：

- 检出代码
- 安装 Node.js
- 安装 Newman 和 HTML 报告插件
- 执行电商购物车流程接口测试
- 上传 Newman HTML 测试报告

也可以在 GitHub Actions 页面通过 `workflow_dispatch` 手动触发运行。

## 测试结果

电商购物车流程测试结果：

```text
requests: 6
assertions: 39
failed: 0
```

HTML 报告路径：

```text
reports\ecommerce-cart-report.html
```

## 项目亮点

- 使用 Environment 管理接口地址、用户 ID、商品 ID、购物车 ID 等变量。
- 使用 Post-response 脚本完成状态码、字段类型、业务字段和异常响应断言。
- 使用 Collection 级公共脚本统一校验响应时间和 5xx 服务端错误。
- 使用 Newman 命令行执行接口自动化测试。
- 使用 PowerShell 脚本封装 Newman 命令，实现一键运行并生成 HTML 报告。
- 使用 GitHub Actions 接入 CI，实现接口自动化测试持续执行和报告归档。
