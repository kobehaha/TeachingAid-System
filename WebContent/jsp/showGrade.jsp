<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="com.cpp.homework.factory.DAOFactory"%>
<%@page import="com.cpp.homework.vo.TaskGrade"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
        body{
            width: auto;
            margin: 0 auto;
            font-family: 微软雅黑;
            font-size: 14px;
            color: #444;
        }
        table{
            border-spacing: 0;
            width: 95%;
            margin: 10px auto;
        }
        .bordered{
        	background: white;
            border: solid #ccc 1px;
            -moz-border-radius: 6px;
            -webkit-border-radius: 6px;
            border-radius: 6px;
            -webkit-box-shadow: 0 1px 1px #ccc; 
            -moz-box-shadow: 0 1px 1px #ccc; 
            box-shadow: 0 1px 1px #ccc;      
        }
        .bordered tr:hover{
            background: #fbf8e9;
            -moz-border-radius: 6px;
            -webkit-border-radius: 6px;
            border-radius: 6px;
            -webkit-box-shadow: 0 1px 1px #ccc; 
            -moz-box-shadow: 0 1px 1px #ccc; 
            box-shadow: 0 1px 1px #ccc;    
        }
        .bordered tr:hover{
            background: #fbf8e9;
            -o-transition: all 0.1s ease-in-out;
            -webkit-transition: all 0.1s ease-in-out;
            -moz-transition: all 0.1s ease-in-out;
            -ms-transition: all 0.1s ease-in-out;
            transition: all 0.1s ease-in-out;
        }
        .bordered td, .bordered th {
            border-left: 1px solid #ccc;
            border-top: 1px solid #ccc;
            padding: 10px;
            text-align: left;
        }
        .bordered th{
            background-color: #dce9f9;
            background-image: -webkit-gradient(linear, left top, left bottom, from(#ebf3fc), to(#dce9f9));
            background-image: -webkit-linear-gradient(top, #ebf3fc, #dce9f9);
            background-image:    -moz-linear-gradient(top, #ebf3fc, #dce9f9);
            background-image:     -ms-linear-gradient(top, #ebf3fc, #dce9f9);
            background-image:      -o-linear-gradient(top, #ebf3fc, #dce9f9);
            background-image:         linear-gradient(top, #ebf3fc, #dce9f9);
            -webkit-box-shadow: 0 1px 0 rgba(255,255,255,.8) inset; 
            -moz-box-shadow:0 1px 0 rgba(255,255,255,.8) inset;  
            box-shadow: 0 1px 0 rgba(255,255,255,.8) inset; 
        }
        .bordered td:first-child,.bordered th:first-child{
            border-left: none;
        }

        .bordered th:first-child{
            -moz-border-radius: 6px 0 0 0;
            -webkit-border-radius: 6px 0 0 0;
            border-radius: 6px 0 0 0;
        }
        .bordered th:last-child{
            -moz-border-radius: 0 6px 0 0;
            -webkit-border-radius: 0 6px 0 0;
            border-radius: 0 6px 0 0;
        }
        .bordered th:only-child{
            -moz-border-radius: 6px 6px 0 0;
            -webkit-border-radius: 6px 6px 0 0;
            border-radius: 6px 6px 0 0;
        }
        .bordered tr:last-child td:first-child{
            -moz-border-radius: 0 0 0 6px;
            -webkit-border-radius: 0 0 0 6px;
            border-radius: 0 0 0 6px;
        }
        .bordered tr:last-child td:last-child{
            -moz-border-radius: 0 0 6px 0;
            -webkit-border-radius: 0 0 6px 0;
            border-radius: 0 0 6px 0;
        }
}
    </style>
</head>
<body>
	<table border="1"  class="bordered">
		<tr>
			<th>学号</th>
			<th>姓名</th>
			<th>旷课次数</th>
			<th>成绩</th>
		</tr>
	<%
		List<TaskGrade> arrayGrade = null;
		TaskGrade grade = null;
	
		try{
			arrayGrade = DAOFactory.getITeacherDAOInstance().showGrade();
			
			Iterator iter1 = arrayGrade.iterator();
			Iterator iter2 = arrayGrade.iterator();
			
			while(iter1.hasNext()){
				grade = (TaskGrade)iter1.next();
	%>
				
				<tr>
					<td><%=grade.getSno() %></td>
					<td><%=grade.getSname() %></td>
					<td><%=grade.getSlate() %></td>
					<td><%=grade.getHgrade() %></td>
				</tr>
	<%
			}
		}catch(Exception e){
			e.printStackTrace();
		}
	%>			
	</table>
</body>
</html>