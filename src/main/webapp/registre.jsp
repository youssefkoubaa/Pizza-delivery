<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Register</title>
</head>
<body>
    <h1>Register</h1>
    <form action="registre" method="post">
        <div>
            <label for="name">Name:</label>
            <input type="text" id="name" name="name" required>
        </div>
     
        <div>
            <label for="email">Email:</label>
            <input type="email" id="email" name="email" required>
        </div>
        <div>
            <label for="tel">Telephone:</label>
            <input type="text" id="tel" name="tel" required>
        </div>
        <div>
            <label for="pass">Password:</label>
            <input type="password" id="pass" name="pass" required>
        </div>
        <div>
            <label for="confPass">Confirm Password:</label>
            <input type="password" id="confPass" name="confPass" required>
        </div>
        <div>
            <button type="submit">Register</button>
        </div>
    </form>
</body>
</html>
