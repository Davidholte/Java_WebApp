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
                    <li>
                        <a href="${pageContext.request.contextPath}/jsp/createAdmin.jsp">Add New Admin Account</a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/jsp/createProduct.jsp">Add New Product</a>
                    </li>
                    <li class="active">
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

    <!-- Create Warehouse -->
    <h3>Add A Warehouse</h3>
    <form class="form-signin" method="POST" action="createWarehouse.do">
        <p>Warehouse Name:</p>
        <input type="text" class="form-control" name="wh_name" value="String Required" required="" autofocus=""/>
        <br>
        <p>Address:</p>
        <input type="text" class="form-control" name="wh_address" value="String Required" required="" autofocus=""/>
        <br>
        <p>Description:</p>
        <input type="text" class="form-control" name="wh_description" value="String Required" required="" autofocus=""/>
        <br>
        <button class="btn btn-lg btn-primary btn-block btn-trans" name="submit_btn_wrhs" type="submit">Submit to Database</button>
        <br>
    </form>


    <!-- FEJL HER!!!!!! KAN IKKE LOOPE GENNEM INDHOLDET FRA DAO -->
    <!-- Display all products in a list -->
    <h2>List of Warehouses:</h2>
    <%--<div class="container-fluid" id="content">--%>
        <%--<jsp:useBean id="warehouseList" scope="session" type="java.util.ArrayList"/>--%>
        <%--<code:forEach items="${warehouseList}" var="warehouse">--%>
            <%--<div class="row row-control">--%>

                <%--<div class="col-md-4">--%>
                    <%--<h5><b>ID and Location:</b> <code:out value="${warehouse.id_warehouse}"/></h5>--%>
                    <%--<p><b>Username:</b>         <code:out value="${warehouse.name_warehouse}"/></p>--%>
                    <%--<p><b>Password:</b>         <code:out value="${warehouse.address}"/></p>--%>
                <%--</div>--%>

                <%--<div class=\"col-md-3\">--%>
                    <%--<br><br><br>--%>
                    <%--<p><b>About the Warehouse: </b></p>--%>
                    <%--<p><code:out value="${warehouse.description}"/></p>--%>
                <%--</div>--%>

            <%--</div>--%>
        <%--</code:forEach>--%>
    </div>

    <!-- Modal -->
    <div id="logoutAdmin" class="modal fade" role="dialog">
        <%@include file="includes/confirmLogoutAdmin.jsp"%>
    </div>

</div>

<%@include file="includes/footer.jsp"%>
</body>
</html>