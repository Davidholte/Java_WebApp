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
                        <li class="active">
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

        <!-- Display content -->
        <div class="container-fluid" id="content2">

            <!-- Display all products in a list, editable in Product.java class -->
            <div class="container-fluid" id="content">
                <jsp:useBean id="productList" scope="session" type="java.util.ArrayList"/>
                <code:forEach items="${productList}" var="product">
                    <div class="row row-control">
                        <div>
                            <img class="col-md-2">
                            <br><br>
                            <img src="img/Wine.png" class="img-thumbnail" alt="img"  width="20%" height="20%"/>
                        </div>

                        <div class="col-md-4">
                            <h3><b>Name:</b>    <code:out value="${product.name_product}"/></h3>
                            <p><b>Price:</b>    <code:out value="${product.price}"/></p>
                            <p><b>Color:</b>    <code:out value="${product.color}"/></p>
                            <p><b>Grape:</b>    <code:out value="${product.grape}"/></p>
                            <p><b>Quantity:</b> <code:out value="${product.quantity}"/></p>
                            <p><b>Location:</b> <code:out value="${product.location}"/></p>
                        </div>

                        <div class=\"col-md-3\">
                            <br><br><br>
                            <p><b>About the product: </b></p>
                            <p><code:out value="${product.description}"/></p>
                        </div>

                        <div class="col-md-2">
                            <br><br><br>
                            <input type="text" name="FirstName" placeholder="1" value="1"/>
                        </div>

                        <div class="col-md-2">
                            <br><br><br>
                            <a href="#">Add to cart</a>
                        </div>
                    </div>
                </code:forEach>
            </div>

            <!-- Button rows -->
            <div class="row">
                <div class="col-md-4"></div>
                <div class="col-md-6">
                    <a href="${pageContext.request.contextPath}updateProduct.jsp" class="btn btn-succes" input type="submit"><i class="fa fa-pencil-square-o fa-lg"></i></a>
                    <a href="#" class="btn btn-danger" input type="submit" name="delete" value="delete"><i class="fa fa-trash-o fa-lg"></i></a>
                </div>
            </div>

            <br><br><br>
        </div>

    </div>


    <!-- Modal -->
    <div id="logoutAdmin" class="modal fade" role="dialog">
        <%@include file="includes/confirmLogoutAdmin.jsp"%>
    </div>

<%@include file="includes/footer.jsp"%>
</body>
</html>
