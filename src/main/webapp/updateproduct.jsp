<!doctype html>
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
        .nav-item {
            border: 1px solid black;
            border-radius: 5px;
            background-color: lightblue;
        }
        .checked {
            color: red;
        }
        .actions {
            border-radius: 5px;
            padding-inline-start: 10px;
            padding-inline-end: 10px;
        }
        #update {
            background-color: yellow;
        }
        #delete {
            background-color: red;
        }
        .form-group {
            align-content: center;
        }
    </style>
    <script>
        function goBack() {
            window.history.back()
        }
    </script>
</head>
<body>
    <div class="container">
        <header class="d-flex flex-wrap justify-content-center py-3 mb-4 border-bottom">
            <a href="/"
                class="d-flex align-items-center mb-3 mb-md-0 me-md-auto text-dark text-decoration-none">
                   <img src="/images/productmanage.png" height="35px" width="auto" >
                <span class="fs-3">Product Management System </span>
            </a>
            <ul class="nav nav-pills">
                <li class="nav-item"><a href="/" class="nav-link fw-bold product">Products</a></li>
            </ul>
        </header>
        <button type="button" onclick="goBack()" class="btn btn-primary"><svg xmlns="http://www.w3.org/2000/svg"
                width="16" height="16" fill="currentColor" class="bi bi-arrow-left" viewBox="0 0 16 16">
                <path fill-rule="evenodd"
                    d="M15 8a.5.5 0 0 0-.5-.5H2.707l3.147-3.146a.5.5 0 1 0-.708-.708l-4 4a.5.5 0 0 0 0 .708l4 4a.5.5 0 0 0 .708-.708L2.707 8.5H14.5A.5.5 0 0 0 15 8z">
                </path>
            </svg></button>
        <form action="/uproduct/${prodd[3]}" method="post">
            
            <br>
            <div class="row  justify-content-center">
                <div class="form-group col-3 col-offset-4 align-center">
                    <label>Product Name</label>
                    <input type="text" value="${prodd[0]}" name="pname" class="form-control" required>
                </div>
            </div>
            <br>
            <div class="row justify-content-center">
                <div class="form-group col-3 col-offset-4 align-center">
                    <label>Product Description</label>
                    <input type="text" value="${prodd[1]}" name="pdesp" class="form-control" required>
                </div>
            </div>
            <br>
            <div class="row justify-content-center">
                <div class="form-group col-3 col-offset-4 align-center">
                    <label>Category</label>
                    <select value="${prodd[4]}" class="form-control" required>
                        <option>Mobiles, Tablets, Computers</option>
                        <option>Electronics & Accessories</option>
                        <option>Groceries</option>
                        <option>Baby Products</option>
                        <option>Health & Personal Care</option>
                        <option>Software</option>
                        <option>Tools & Home Improvement</option>
                        <option>Fashion</option>
                        <option>Books</option>
                    </select>
                </div>
            </div>
            <br>
            <div class="row justify-content-center">
                <div class="form-group col-3 col-offset-4 align-center">
                    <label>Product Price</label>
                    <input type="number" value="${prodd[2]}" name="pprice" class="form-control" required>
                </div>
            </div>
            <br>
            <div class="row justify-content-center">
                <button type="submit" class="btn btn-primary col-1 col-offset-5 align-center">Update</button>
            </div>
        </form>
    </div>
</body>