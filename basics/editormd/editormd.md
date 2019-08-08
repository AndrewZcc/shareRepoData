### Editor.md 使用指导

-----

1. editor.md 配置参数和使用方法

   https://www.lmcjl.com/index/comment/detail?id=11

2. 官网使用示例 https://pandao.github.io/editor.md/index.html
	
	```html
	# id = "index-editormd"
	<div class="editormd pui-z-depth-3 pui-bg-white editormd-vertical" id="index-editormd">
	  
	</div>
	```
	
	```js
	$.get('./index.md', function(md){
	  indexMarkdownEditor = editormd("index-editormd", {
	    height           : 580,
	    markdown         : md,
	    tex              : true,
	    tocm             : true,
	    emoji            : true,
	    taskList         : true,
	    codeFold         : true,
	    searchReplace    : true,
	    htmlDecode       : "style,script,iframe", //编辑器支持在线html标签解析预览
	    flowChart        : true,
	    sequenceDiagram  : true,
	    onfullscreen : function() {
	      this.editor.css("border-radius", 0).css("z-index", 120);
	    },
	    onfullscreenExit : function() {
	      this.editor.css({
	        zIndex : 10,
	        border : "none",
	        "border-radius" : "5px"
	      });
	
	      this.resize();
	    }
	  });
	});
	```
	
	* 定位方法：打开 Editormd官网，找到想要的功能，右键选取"Inspect > Sources"，查看项目源码，在里面 **搜索** 看其是如何实现的即可！哈哈！

3. Markdown 内容折叠尝试（ **details 标签** ）

	```html
   <details>
     <summary>Click here</summary>Content!!!
   </details>
	```
  