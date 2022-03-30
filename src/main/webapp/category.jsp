<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<html lang="en">
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- Bootstrap CSS -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="shortcut icon" href="#">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <title>Hello, world!</title>
        <style>
            .nav-item{
                border: 1px solid black;
                border-radius: 5px;
                background-color: lightblue;
            }
            .checked {
                color: red;
            }
            .actions
            {
                border-radius: 5px;
                padding-inline-start: 10px;
                padding-inline-end: 10px;
            }
            #update{
                background-color: yellow;
                color:white;
            }
            #delete{
                background-color: red;
                color:white;
            }
            .nav-item1{
                border: 1px solid black;
                border-radius: 5px;
                background-color: pink;
                margin-right: 10px;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <header class="d-flex flex-wrap justify-content-center py-3 mb-4 border-bottom">
                <a href="/" class="d-flex align-items-center mb-3 mb-md-0 me-md-auto text-dark text-decoration-none">
                    <img src="/images/productmanage.png" height="35px" width="auto" >
                    <span class="fs-3">Product Management System </span>
                </a>
                <ul class="nav nav-pills">
                    <li class="nav-item1"><a href="/product" class="nav-link fw-bold ">Products</a></li>
                    <li class="nav-item"><a href="addproduct.jsp" class="nav-link fw-bold product">Add Product</a></li>
                    <li class="nav-item"><a href="addcategory.jsp" class="nav-link fw-bold category">Add Category</a></li>
                </ul>
            </header>
            <table class="table">
                <thead>
                    <tr>
                        <th scope="col">#</th>
                        <th scope="col">Categories</th>
                        <th scope="col">Products</th>
                        <th scope="col">Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="cat" items="${cat}" varStatus="id" >
                        <tr>
                            <th scope="row">${id.count}</th>
                            <td>${cat[0]}</td>
                            <td>
                                <button type="button" class="actions fw-bolder" id="update"><a style="text-decoration: none;" href="/updatecategory/${cat[1]}">UPDATE</a></button>
                                <a href="/c/${cat[1]}" >       <button type="button" class="actions fw-bolder" id="delete">DELETE</button></a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </body>
</html>