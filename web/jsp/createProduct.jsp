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
                    <li class="active">
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

    <!-- Create Product -->
    <h3>Add A Product</h3>
    <form class="form-signin" method="POST" action="createProduct.do">
        <p>Product name:</p>
        <input type="text" class="form-control" name="product_name" value="String Required" required="" autofocus=""/>
        <br>
        <p>Color:</p>
        <input type="text" class="form-control" name="color" value="String Required" required="" autofocus=""/>
        <br>
        <p>Grape:</p>
        <input type="text" class="form-control" name="grape" value="String Required" required=""/>
        <br>
        <p>Country of Origin:</p>
        <input type="text" class="form-control" name="origin_country" value="String Required" required="" autofocus=""/>
        <br>
        <p>Area of Origin:</p>
        <input type="text" class="form-control" name="origin_area" value="String Required" required="" autofocus=""/>
        <br>
        <p>Description:</p>
        <input type="text" class="form-control" name="description" value="String Required" required="" autofocus=""/>
        <br>
        <p>Production Year:</p>
        <input type="text" class="form-control" name="production_year" value="Integer Required" required="" autofocus=""/>
        <br>
        <p>Production Date:</p>
        <input type="text" class="form-control" name="production_date" value="String Required" required="" autofocus=""/>
        <br>
        <p>Quantity:</p>
        <input type="text" class="form-control" name="quantity" value="Integer Required" required="" autofocus=""/>
        <br>
        <p>Location:</p>
        <input type="text" class="form-control" name="location" value="Integer Required" required="" autofocus=""/>
        <br>
        <p>Price:</p>
        <input type="text" class="form-control" name="price" value="Integer Required" required="" autofocus=""/>
        <br>
        <p>Volume:</p>
        <input type="text" class="form-control" name="volume" value="Integer Required" required="" autofocus=""/>
        <br>
        <p>Sparkly:</p>
        <input type="text" class="form-control" name="sparkly" value="Y for yes, N for no" required="" autofocus=""/>
        <br>
        <p>For Sale:</p>
        <input type="text" class="form-control" name="for_sale" value="Y for yes, N for no" required="" autofocus=""/>
        <br>
        <p>Date Added:</p>
        <input type="text" class="form-control" name="date_added" value="String Required" required="" autofocus=""/>
        <br>
        <button class="btn btn-lg btn-primary btn-block btn-trans" name="submit_btn_prod" type="submit">Submit to Database</button>
        <br>
        <br>
    </form>

    <!-- Display all products in a list -->
    <h2>List of Products:</h2>
    <div class="container-fluid" id="content">
        <jsp:useBean id="productList" scope="session" type="java.util.ArrayList"/>
        <code:forEach items="${productList}" var="product">
            <div class="row row-control">
                <div>
                    <img class="col-md-2">
                    <br><br>
                    <img src="img/Wine.png" class="img-thumbnail" alt="img" width="20%" height="20%"/>
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