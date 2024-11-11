<%--
  Created by IntelliJ IDEA.
  User: ACER
  Date: 11/10/2024
  Time: 9:50 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Register Account</title>
    <style>
        * {box-sizing: border-box}

        /* Full-width input fields */
        input[type=text], input[type=password] {
            width: 100%;
            padding: 15px;
            margin: 5px 0 22px 0;
            display: inline-block;
            border: none;
            background: #f1f1f1;
        }

        input[type=text]:focus, input[type=password]:focus {
            background-color: #ddd;
            outline: none;
        }

        hr {
            border: 1px solid #f1f1f1;
            margin-bottom: 25px;
        }

        /* Set a style for all buttons */
        button {
            background-color: #04AA6D;
            color: white;
            padding: 14px 20px;
            margin: 8px 0;
            border: none;
            cursor: pointer;
            width: 100%;
            opacity: 0.9;
        }

        button:hover {
            opacity:1;
        }

        /* Extra styles for the cancel button */
        .cancelbtn {
            padding: 14px 20px;
            background-color: #f44336;
        }

        /* Float cancel and signup buttons and add an equal width */
        .cancelbtn, .signupbtn {
            float: left;
            width: 50%;
        }

        /* Add padding to container elements */
        .container {
            padding: 16px;
        }

        /* Clear floats */
        .clearfix::after {
            content: "";
            clear: both;
            display: table;
        }

        /* Change styles for cancel button and signup button on extra small screens */
        @media screen and (max-width: 300px) {
            .cancelbtn, .signupbtn {
                width: 100%;
            }
        }
    </style>
</head>
<body>
<form action="${pageContext.request.contextPath}/register"
      method="post"
>
    <!--register area start-->
    <div class="col-lg-6 col-md-6">
        <div class="account_form register">
            <h2>Register</h2>
            <form action="#">
                <p>
                    <label for="username"><b>Username</b></label>
                    <input type="text" placeholder="Enter username" name="username" required>
                </p>
                <p>
                    <label for="username"><b>Username</b></label>
                    <input type="text" placeholder="Enter username" name="username" required>
                </p>
                <p>
                    <label for="password-repeat"><b>Repeat Password</b></label>
                    <input type="password" placeholder="Repeat Password" name="password-repeat" required>
                </p>
                <div class="login_submit">
                    <button type="submit">Register</button>
                    <button type="button" class="cancelbtn"><a href="${pageContext.request.contextPath}/login">Cancel</a></button>
                </div>
            </form>
        </div>
    </div>
    <!--register area end-->
</form>
</body>
</html>
