/*
function catalog_change1(obj){
    obj.className="now";
    document.getElementById("catalog2").className="other";
    document.getElementById("catalog3").className="other";
    document.getElementById("catalog4").className="other";
    document.getElementById("catalog5").className="other";
    document.getElementById("catalog6").className="other";
}
function catalog_change2(obj){
    document.getElementById("catalog1").className="other";
    obj.className="now";
    document.getElementById("catalog3").className="other";
    document.getElementById("catalog4").className="other";
    document.getElementById("catalog5").className="other";
    document.getElementById("catalog6").className="other";
}
function catalog_change3(obj){
    document.getElementById("catalog1").className="other";
    document.getElementById("catalog2").className="other";
    obj.className="now";
    document.getElementById("catalog4").className="other";
    document.getElementById("catalog5").className="other";
    document.getElementById("catalog6").className="other";
}
function catalog_change4(obj){
    document.getElementById("catalog1").className="other";
    document.getElementById("catalog2").className="other";
    document.getElementById("catalog3").className="other";
    obj.className="now";
    document.getElementById("catalog5").className="other";
    document.getElementById("catalog6").className="other";
}
function catalog_change5(obj){
    document.getElementById("catalog1").className="other";
    document.getElementById("catalog2").className="other";
    document.getElementById("catalog3").className="other";
    document.getElementById("catalog4").className="other";
    obj.className="now";
    document.getElementById("catalog6").className="other";
}
function catalog_change6(obj){
    document.getElementById("catalog1").className="other";
    document.getElementById("catalog2").className="other";
    document.getElementById("catalog3").className="other";
    document.getElementById("catalog4").className="other";
    document.getElementById("catalog5").className="other";
    obj.className="now";
}
*/
function catalog_change(obj){
    document.getElementById("catalog1").className="other";
    document.getElementById("catalog2").className="other";
    document.getElementById("catalog3").className="other";
    document.getElementById("catalog4").className="other";
    obj.className="now";
    var x=obj.id;
    document.getElementById("text1").className="text_hidden";
    document.getElementById("text2").className="text_hidden";
    document.getElementById("text3").className="text_hidden";
    document.getElementById("text4").className="text_hidden";
    document.getElementById("p1").className="p_other";
    document.getElementById("p2").className="p_other";
    document.getElementById("p3").className="p_other";
    document.getElementById("p4").className="p_other";
    switch(x){
        case "catalog1":
            document.getElementById("text1").className="text_visible";
            document.getElementById("p1").className="p_now";
            break;
        case "catalog2":
            document.getElementById("text2").className="text_visible";
            document.getElementById("p2").className="p_now";
            break;
        case "catalog3":
            document.getElementById("text3").className="text_visible";
            document.getElementById("p3").className="p_now";
            showIncomplete();
            break;
        
        case "catalog4":
            document.getElementById("text4").className="text_visible";
            document.getElementById("p4").className="p_now";
            showCourseWare();
            break;
    }
}

function addfiles() {
	var filesDiv = document.getElementById("files");
	var fileInput = document.createElement("input");

	fileInput.type = "file";
	fileInput.name = "选择文件";

	var delButton = document.createElement("input");
	delButton.type = "button";
	delButton.value = "删除";

	delButton.onclick = function del() {
		this.parentNode.parentNode.removeChild(this.parentNode);
	}
	var div = document.createElement("div");
	div.appendChild(fileInput);
    div.appendChild(delButton);

	filesDiv.appendChild(div);
}

var xmlHttp;     //Ajax核心对象名称
function createXMLHttp(){
	if(window.XMLHttpRequest){
		xmlHttp = new XMLHttpRequest();
	}else{
		xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
}

function showIncomplete(){
	createXMLHttp();
	xmlHttp.open("POST", "jsp/showIncomplete.jsp");
	
	//设置请求完成后处理的回调函数
	xmlHttp.onreadystatechange = showIncompleteCallback;
	xmlHttp.send(null);
}

function showIncompleteCallback(){
	if(xmlHttp.readyState == 4){
		if(xmlHttp.status == 200){
			var text = xmlHttp.responseText;

			document.getElementById("showTask").innerHTML = text;
		}
	}
}

function showCompleted(){
	createXMLHttp();
	xmlHttp.open("POST", "jsp/showCompleted.jsp");
	
	//设置请求完成后处理的回调函数
	xmlHttp.onreadystatechange = showCompletedCallback;
	xmlHttp.send(null);
}

function showCompletedCallback(){
	if(xmlHttp.readyState == 4){
		if(xmlHttp.status == 200){
			var text = xmlHttp.responseText;

			document.getElementById("showTask").innerHTML = text;
		}
	}
}

function showCourseWare(){
	createXMLHttp();
	xmlHttp.open("POST", "jsp/showCourseWare.jsp");
	
	//设置请求完成后处理的回调函数
	xmlHttp.onreadystatechange = showCourseWareCallback;
	xmlHttp.send(null);
}

function showCourseWareCallback(){
	if(xmlHttp.readyState == 4){
		if(xmlHttp.status == 200){
			var text = xmlHttp.responseText;

			document.getElementById("showCourseWare").innerHTML = text;
		}
	}
}

