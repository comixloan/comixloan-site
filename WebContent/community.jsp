<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="f"  uri="http://java.sun.com/jsf/core"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="h"  uri="http://java.sun.com/jsf/html"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:f="http://java.sun.com/jsf/core" xmlns:h="http://java.sun.com/jsf/html">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Insert title here</title>
</head>
<body>
<f:view>
	<h1>${communityController.community.name}</h1>
	<div>
		${communityController.community.description}
	</div>
	
	<ul>
	<c:forEach var="users" items="${communityController.community.users}">
		<li>${users.userName}</li>
	</c:forEach>
	</ul>
	
	
	<h:form>
		<h:commandLink action = "addUserCommunity.jsp" value = "Aggiungi Utente"/>
	</h:form>
</f:view>

</body>
</html>