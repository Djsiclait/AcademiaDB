<!DOCTYPE html>
<html>
    <head>
        <title>Register Student</title>
    </head>
    <body>
        <h3>${message}</h3>
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
        <br>
        <form action="http://localhost:4567" method="GET">
            <!-- Cancel -->
            <input type="submit" name="submit" value="Home">
        </form>
    </body>
</html>