function bottom_change1(obj){
    obj.className = "now";
    document.getElementById("bottom_two").className="other";
    document.getElementById("form_student").style.display = "block";
    document.getElementById("form_teacher").style.display = "none";
}
function bottom_change2(obj){
    obj.className = "now";
    document.getElementById("bottom_one").className="other";
    document.getElementById("form_student").style.display = "none";
    document.getElementById("form_teacher").style.display = "block";
}

function validate(f)
{
	if(!(/^\w{5,12}$/.test(f.no.value)))
	{
		alert("用户ID必须是5-15位！！！");
		f.no.focus();
		return false;
	}
	if(!(/^\w{5,12}$/.test(f.password.value)))
	{
		alert("密码必须是5-15位！！！");
		f.password.focus();
		return false;
	}
}
//登录跳转
//function log_to(){
//    var x=document.getElementById("bottom_one").className;
//    if(x=="now"){
//        window.open("student");
//        window.opener=null;
//        window.open('', '_self', ''); 
//        window.close();
//    }else{
//        window.open("teacher");
//        window.opener=null;
//        window.open('', '_self', '');
//        window.close();
//    }
//}