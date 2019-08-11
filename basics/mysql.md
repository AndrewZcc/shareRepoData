## Mysql

#### 1. Mysql 常用命令

1. 关于数据备份 与 数据恢复

```sql
/* 备份数据库 */
mysqldump -h127.0.0.1 -p3306 -uroot -pxxx webflask > webflask.sql
/* 只导出表结构 不导数据 */ 
mysqldump　--opt　-d　数据库名　-u　root　-p　>　xxx.sql
/* 只导出数据 不导表结构 */ 
mysqldump　-t　数据库名　-uroot　-p　>　xxx.sql

mysqldump 详解
https://www.cnblogs.com/xiaoleiel/p/8316685.html

/* 使用sql文件导入数据 */
source ~/webflask.sql
[注意: 先把sql文件中所有与表结构相关的sql语句 删除, 只保留 数据类的sql语句! ]
```

2. 数据库 增删查改
```sql
# 增删 数据库/表
drop database webflask;
create database webflask charset=utf8;
drop table user;
create table user (`id` int unsigned auto_increment, `name` varchar(100) not null);

# 新增记录
INSERT INTO `user` VALUES (1,'zhchuch','123','Root'),(2,'general','123','General');
INSERT INTO `book` (title, author_id) VALUES ('平凡的世界', 1);

# 删除记录
delete from user; # 删除所有记录
delete from user where id=1;

# 查
select * from user where id=1;

# 改 / 更新
update user set name='zhchuch' where id=1;
update note_category set cat_rank=cat_rank+100 where floor(cat_rank/100) = 4;
```

3. 数据库 其他常用操作

```sql
# 查询结果 排序
select * from note_category order by cat_rank;
```

