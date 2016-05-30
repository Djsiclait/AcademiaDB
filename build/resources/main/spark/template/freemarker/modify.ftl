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
                <form action="http://localhost:4567/modify" method="POST">
                    <fieldset style="width: 300px">
                        <legend>Modification Form</legend>
                        <!-- Matricula -->
                        Matricula: <br>
                        <input type="text" name="matricula" value=${matricula} readonly/>
                        <br>
                        <!-- Name -->
                        New Name: <br>
                        <input type="text" name="new_name" value=${oldName} />
                        <br>
                        <!-- Last Name -->
                        New Last Name: <br>
                        <input type="text" name="new_last_name" value=${oldLastName} />
                        <br>
                        <!-- Telephone -->
                        New Telephone: <br>
                        <input type="text" name="new_telephone" value=${oldTelephone} />
                        <br><br>
                        <!-- Submit -->
                        <input type="submit" name="submit" value="Submit">
                    </fieldset>
                </form>
                <br><br>
                <form action="http://localhost:4567" method="GET">
                    <!-- Cancel -->
                    <input type="submit" name="submit" value="Home">
                </form>
            </div>
        </div>
    </body>
</html>