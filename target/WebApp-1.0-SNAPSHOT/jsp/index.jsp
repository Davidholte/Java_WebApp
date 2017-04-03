<%--
  Created by IntelliJ IDEA.
  User: Dave
  Date: 31/03/2017
  Time: 10.21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="code" %>
<html>
  <head>
      <!-- All reference links are located in the header file -->
      <%@include file="includes/header.jsp" %>
    <title>$Title$</title>
  </head>
  <body>

  <!-- Content on the site -->
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
                  <ul class="nav navbar-nav navbar-right">
                      <li>
                          <!-- userModal-->
                          <a href="#" data-toggle="modal" data-target=<%=session.getAttribute("modalLink") %>><i class="fa fa-user fa-fw"></i><%=session.getAttribute("name") %></a>
                      </li>
                      <li>
                          <a href="#" data-toggle="modal" data-target="#adminModal"><i class="fa fa-user fa-fw"></i> Admin
                              Login</a>
                      </li>
                      <li>
                          <a href="edit.jsp" data-toggle="modal"> Browse</a>
                      </li>
                  </ul>
              </div>
          </div>
      </div>

      <br><br><br>

      <!-- Display all products in a list, editable in Product.java class -->
      <div class="container-fluid" id="content">
          <jsp:useBean id="productList" scope="session" type="java.util.ArrayList"/>
          <code:forEach items="${productList}" var="product">
          <div class="row row-control">
              <div>
                  <img class="col-md-2">
                  <br><br>
                  <img src="img/test.png" class="img-thumbnail" alt="img" width="30%" height="20%"/>
              </div>

              <div class="col-md-4">
                  <h3><b>Name:</b> <code:out value="${product.name_product}"/></h3>
                  <p><b>Price:</b> <code:out value="${product.price}"/></p>
                  <p><b>Color:</b> <code:out value="${product.color}"/></p>
                  <p><b>Grape:</b> <code:out value="${product.grape}"/></p>
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

  </div>


  <!-- User Login Modal -->
  <div id="userModal" class="modal fade" role="dialog">
      <div class="modal-dialog">

          <!-- Modal content-->
          <div class="modal-content">
              <div class="modal-header custom-header">
                  <button type="button" class="close" data-dismiss="modal">x</button>
                  <h4 class="modal-title">User login</h4>
              </div>
              <div class="modal-body custom-body">
                  <form class="form-signin" method="POST" action="Controller.LoginUser">
                      <p>Username</p>
                      <input type="text" class="form-control" name="username" required="" autofocus=""/>
                      <br>
                      <p>Password</p>
                      <input type="password" class="form-control" name="password" required=""/>
                      <a href="JSP/addUser.jsp" id="userLink">Create new user account</a>
                      <br><br>
                      <button class="btn btn-lg btn-primary btn-block btn-trans" type="submit">Login</button>
                  </form>
              </div>
              <div class="modal-footer custom-footer">
                  <br><br>
              </div>
          </div>
      </div>
  </div>

  <!-- Admin Login modal -->
  <div id="adminModal" class="modal fade" role="dialog">
      <div class="modal-dialog">

          <!-- Modal content-->
          <div class="modal-content custom-content">
              <div class="modal-header custom-header">
                  <button type="button" class="close" data-dismiss="modal">x</button>
                  <h4 class="modal-title">Admin login</h4>
              </div>
              <div class="modal-body custom-body">
                  <form class="form-signin" method="POST" action="Controller.LoginAdmin">
                      <p>Username</p>
                      <input type="text" class="form-control" name="username" required="" autofocus=""/>
                      <br>
                      <p>Password</p>
                      <input type="password" class="form-control" name="password" required=""/>
                      <br><br>
                      <button class="btn btn-lg btn-primary btn-block btn-trans" type="submit">Login</button>
                  </form>
              </div>
              <div class="modal-footer custom-footer">
                  <br><br>
              </div>
          </div>
      </div>
  </div>


  <!-- Logout -->
  <div id="logoutUser" class="modal fade" role="dialog">
      <%@include file="includes/confirmLogoutUser.jsp" %>
  </div>


  <!-- All reference links are located in the footer file -->
  <%@include file="includes/footer.jsp" %>
  </body>
</html>
