<!DOCTYPE html>
<html>
    <head>
        <title>Register Student</title>
    </head>
    <body>
        <h3>${message}</h3>
        <form>
            <!-- Matricula -->
            <label>Matricula: ${matricula}</label>
            <br>
            <!-- Name -->
            New Name: <input type="text" name="new_name" value=${oldName}>
            <br>
            <!-- Last Name -->
            New Last Name: <input type="text" name="new_last_name" value=${oldLastName}>
            <br>
            <!-- Telephone -->
            New Telephone: <input type="text" name="new_telephone" value=${oldTelephone}>
            <br>
            <!-- Cancel -->
            <input type="button" value="Cancel">
            <!-- Submit -->
            <input type="button" value="Submit">
        </form>
    </body>
</html>