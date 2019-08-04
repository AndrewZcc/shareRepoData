#### 1. mysql 保留字与表格中列名相同时，转义使用 `

举例：

```sql
mysql> update note_category set `order`=1 where id=4;
```

#### 2. 对于侧边栏折叠标签 

* 请引入：`metisMenu (css/js) 库`（里面包含对折叠标签的效果实现）

* 引入之后 对于多级标签，请注意 `class="active"` 属性只能加在 `<a>`标签，不能再加在 `<li>`标签上，

  否则：会影响 active属性的扩大范围（因为对于多级目录 一个 li-标签 下通常会嵌套一个 ul, 然后里面再回添加几个二级 li-标签，一旦active之后，会把整个一级标签内的所有子标签全部激活）

  举例：

  ```html
  <div class="navbar-default sidebar" role="navigation">
    <div class="sidebar-nav navbar-collapse">
      <ul class="nav" id="side-menu">
        <li class="sidebar-search">
  			xxx
        </li>
  			<li> // 一级目录
          <a href="#">L2<span class="fa arrow"></span></a>
          <ul class="nav nav-second-level"> // 二级目录
            <li><a href="#" class="navNoteCat-1">mac</a></li>
            <li><a href="#">vlan</a></li>
            <li><a href="#">vxlan</a></li>
          </ul>
        </li>
      </ul>
    </div>
  </div>
  ```

  * class 属性 只能加在 a-标签 上，不能加在 li-标签 上，以精确确定范围！

    ```css
    # 单级标签
    .nav li.active{
    	background-color: #e7e7e7;
    }
    
    # 多级标签
    .sidebar ul li a.active {
        background-color: #e7e7e7;
    }
    ```

* 注意：针对多级标签的 active 

  ```css
  # static/sb-admin-2/css/sb-admin-2.min.css 文件已经有了针对 a 标签的样式适配
  
  .sidebar ul li a.active {
      background-color: #eee;
  }
  
  自己不用再添加 a.active 的css渲染动作。
  ```

  