<!DOCTYPE html>
<html>
    <head>
        <title>Register Student</title>
    </head>
    <body>
        <h3>${message}</h3>
        <form acction="http://localhost:4567/new" method="POST">
            <fieldset style="width: 300px;">
                <legend>Registration Form</legend>
                <!-- Matricula -->
                Matricula: <br>
                <input type="text" name="matricula" />
                <br>
                <!-- Name -->
                Name: <br>
                <input type="text" name="name"/>
                <br>
                <!-- Last Name -->
                Last Name: <br>
                <input type="text" name="last_name"/>
                <br>
                <!-- Telephone -->
                Telephone: <br>
                <input type="text" name="telephone"/>
                <br><br>
                <!-- Submit -->
                <input type="submit" name="submit" value="Submit">
            </fieldset>
        </form>
        <br>
        <form action="http://localhost:4567" method="GET">
            <!-- Cancel -->
            <input type="submit" value="Home">
        </form>
    </body>
</html>