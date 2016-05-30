<!DOCTYPE html>
<html>
    <head>
        <title>Register Student</title>
        <link type="text/css" rel="stylesheet" href="css/index.css" />
    </head>
    <body>
        <div class="box" id="container">
            <!-- Header -->
            <div class="box" id="header">
                <h3>${message}</h3>
            </div>

            <br>

            <!-- Registry -->
            <div class="box" id="registry">
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
                <br><br>
                <form action="http://localhost:4567" method="GET">
                    <!-- Cancel -->
                    <input type="submit" value="Home">
                </form>
            </div>
        </div>
    </body>
</html>