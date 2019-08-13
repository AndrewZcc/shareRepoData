## Go-bindata 使用

！！简直完美！！（直接打包，然后在代码里解压，运行的时候静态资源会自动解压出来！）

#### main.go
```go
func main() {
	dirs := []string{"conf", "static", "views"} // 设置需要释放的目录
	for _, dir := range dirs {
		// 解压dir目录到当前目录
		if err := controllers.RestoreAssets("./", dir); err != nil {
			break
		}
	}

	beego.BConfig.WebConfig.Session.SessionOn = true
	beego.Router("/", &controllers.MainController{}, "get:Get")
	beego.Run()
}
```

#### Controller
```go
func (c *MainController) Get() {

	// 1. Beego
	//c.Data["Website"] = "beego.me"
	//c.Data["Email"] = "astaxie@gmail.com"
	//c.TplName = "index.html"

	// 2. Go bindata
	dataBytes, err := Asset("views/index.html")
	dataTemplates, err := template.New("message").Parse(string(dataBytes))

	var buf bytes.Buffer
	var keys map[string]string
	keys = make(map[string]string)
	keys ["Website"] = "zhchuch.huawei.io"
	keys ["Email"] = "zhchch1-1@huawei.com"
	err = dataTemplates.Execute(&buf, keys)
	if err != nil {
		log.Fatalf("unable to get resources %v", err)
	}

	c.Ctx.WriteString(buf.String())

	// 3. Go rice
	//templateBox, err := rice.FindBox("views")
	//indexFile, err := templateBox.String("index.html")
	//indexMessage, err := template.New("Message").Parse(indexFile)
	//if err != nil {
	//	log.Fatal(err)
	//}
	//
	//var buf bytes.Buffer
	//var keys map[string]string
	//keys = make(map[string]string)
	//
	//keys ["Website"] = "zhchuch.huawei.io"
	//keys ["Email"] = "zhchch1@huawei.com"
	////indexMessage.Execute(&buf, map[string]string{"Website": "www.zhchuch.huawei"})
	//
	//indexMessage.Execute(&buf, keys)
	//c.Ctx.WriteString(buf.String())
}
```

#### go资源打包命令
```shell
## go-bindata
D:\helloGoWeb> go-bindata -pkg controllers -o controllers/static.go static/... views/... conf/...
## go-rice
D:\helloGoWeb> rice embed-go
```

#### go 发布 exe 单文件
```shell
go build -o helloStatic.exe main.go
```

----------------


* go-bindata使用 极简版

  https://blog.csdn.net/wyyyh9458/article/details/95186101

  打包与释放 举例

  https://blog.csdn.net/chen195822080/article/details/78111672

* go打包静态资源

  https://blog.csdn.net/idwtwt/article/details/81180460



## GoRice <small>可能更简单</small>

https://www.thepolyglotdeveloper.com/2017/03/bundle-html-css-javascript-served-golang-application/
