<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta charset="UTF-8">
<title>文件上传</title>
<script type="text/javascript">
	function addfiles() {
		var filesDiv = document.getElementById("files");
		var fileInput = document.createElement("input");

		fileInput.type = "file";
		fileInput.name = "浏览";

		var delButton = document.createElement("input");
		delButton.type = "button";
		delButton.value = "删除";

		delButton.onclick = function del() {
			this.parentNode.parentNode.removeChild(this.parentNode);
		}
		var div = document.createElement("div");
		div.appendChild(fileInput);

		filesDiv.appendChild(div);
	}
</script>
</head>
<body>
<!--
	<form action="SmartUpload_demo01" method="post"
		enctype="multipart/form-data">
		请选择文件:<br> <input type="button" value="添加文件" onclick="addfiles()" />
		<br> <input type="file" name="浏览" /> <br> <input
			type="submit" value="上传" />
	</form>
-->
	<form action="SmartUpload_demo01"
		method="post" enctype="multipart/form-data">
		<table>
			<tr>
				<td></td>
				<td><input type="button" value="添加文件" onclick="addfiles()" /></td>
				<td></td>
			</tr>
			<tr>
				<td></td>
				<td><input type="file" name="浏览" value="浏览.."/></td>
				<td></td>
			</tr>
			<tr>
				<td></td>
				<td><div id="files"></div></td>
				<td></td>
			</tr>
			<tr>
				<td><input type="reset" value="重置" /></td>
				<td><input type="submit" value="上传" /></td>
				<td></td>
			</tr>
		</table>
	</form>
</body>
</html>