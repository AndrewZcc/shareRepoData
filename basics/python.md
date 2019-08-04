## Python 使用注意

* 注意：Python 中的 值传递 vs. 引用传递

  ```python
  def listOperation():
      record = 0
      cat_all = []
      cats = []
      print("Before, len = %s" % len(cat_all))
      for c in cat_list:
          # print('>>>')
          # print("name: %s, cat_rank: %s, REC:%s" % (c.name, c.cat_rank, int(c.cat_rank) // 100))
          if int(c.cat_rank) // 100 == record:
              # print("Record[%s]: name: %s, cat_rank: %s" % (record, c.name, c.cat_rank))
              cats.append(c)
          else:
              print(cats)
              cat_all.append(cats)
              record += 1
              # cats.clear() # 不能 clear(), clear之后 cat_all 里面就空了，因为 list 采用的是引用传递 而非值传递
              cats = [] # 直接复制一个空列表过去，相当于直接 new 了一个新对象
              cats.append(c)
      if len(cats) != 0:
          print(cats)
          cat_all.append(cats)
  ```

  参考链接：[python中的值传递和引用传递](https://www.cnblogs.com/xiongxueqi/p/9129708.html)

