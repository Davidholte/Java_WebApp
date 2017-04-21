<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="code" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <!-- All reference links are located in the header file -->
    <%@include file="includes/header.jsp"%>
</head>
<body>

<div class="container">

    <!-- Header -->
    <div class="navbar navbar-default navbar-fixed-top" role="navigation">
        <div class="container-fluid">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
            </div>

            <div class="navbar-collapse collapse">
                <ul class="nav navbar-nav navbar-left">
                    <li>
                        <a href="${pageContext.request.contextPath}/jsp/admin.jsp">Browse Items</a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/jsp/inventory.jsp">Inventory Status</a>
                    </li>
                    <li class="active">
                        <a href="${pageContext.request.contextPath}/jsp/createAdmin.jsp">Add New Admin Account</a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/jsp/createProduct.jsp">Add New Product</a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/jsp/createWarehouse.jsp">Add New Warehouse</a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/jsp/updateProduct.jsp">Edit Product</a>
                    </li>
                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <li>
                        <a href="#" data-toggle="modal" data-target="#logoutAdmin" data-backdrop="static"
                           data-keyboard="false"><i class="fa fa-user fa-fw"></i>Log out</a>
                    </li>
                </ul>
            </div>
        </div>
    </div>

    <!-- Create Admin -->
    <h3>Create An Admin or User Account</h3>
    <form class="form-signin" method="POST" action="createAdmin.do">
        <p>Username:</p>
        <input type="text" class="form-control" name="username" value="String Required" required="" autofocus=""/>
        <br>
        <p>password:</p>
        <input type="text" class="form-control" name="password" value="String Required" required="" autofocus=""/>
        <br>
        <p>Email::</p>
        <input type="text" class="form-control" name="email" value="String Required" required="" autofocus=""/>
        <br>
        <p>Bought Items:</p>
        <input type="text" class="form-control" name="bought_items" value="Integer Required" required="" autofocus=""/>
        <br>
        <p>Location:</p>
        <input type="text" class="form-control" name="location_user" value="Integer Required" required="" autofocus=""/>
        <br>
        <button class="btn btn-lg btn-primary btn-block btn-trans" name="submit_btn_user" type="submit">Submit to Database</button>
        <br>
        <br>
    </form>

    <!-- Display all products in a list -->
    <h2>List of Users:</h2>
    <div class="container-fluid" id="content">
        <jsp:useBean id="userList" scope="session" type="java.util.ArrayList"/>
        <code:forEach items="${userList}" var="user">
            <div class="row row-control">

                <div class="col-md-4">
                    <h5><b>ID:</b>          <code:out value="${user.id_user}"/></h5>
                    <p><b>Username:</b>     <code:out value="${user.username}"/></p>
                    <p><b>Password:</b>     <code:out value="${user.password}"/></p>
                    <p><b>Role:</b>         <code:out value="${user.role}"/></p>
                    <p><b>Email:</b>        <code:out value="${user.email}"/></p>
                    <p><b>Items Bought:</b> <code:out value="${user.bought_items}"/></p>
                    <p><b>Location:</b>     <code:out value="${user.location}"/></p>
                </div>

                <br><br><br>

            </div>
        </code:forEach>
    </div>

    <!-- Modal -->
    <div id="logoutAdmin" class="modal fade" role="dialog">
        <%@include file="includes/confirmLogoutAdmin.jsp"%>
    </div>

</div>
<%@include file="includes/footer.jsp"%>

</body>
</html>