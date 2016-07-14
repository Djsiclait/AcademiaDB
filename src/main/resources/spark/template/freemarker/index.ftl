<!DOCTYPE html>
<html>
    <head>
        <title>AcademiaDB-HOME</title>
        <link type="text/css" rel="stylesheet" href="css/index.css" />
    </head>
    <body>
        <div class="box" id="container">
            <!-- Header -->
            <div class="box" id="header">
                <h1>${message}</h1>
            </div>

            <br>

            <!-- Registry -->
            <div class="box" id="registry">
                <table>
                    <thead>
                        <tr>
                            <th colspan="4">Student Registry</th>
                        </tr>
                        <tr>
                            <th>Matricula</th>
                            <th>Name</th>
                            <th>Last Name</th>
                            <th>Telephone</th>
                        </tr>
                    </thead>
                    <tbody>
                        <#list Registry?sort_by("matricula") as student>
                            <tr>
                                <td>${student.getMatricula()}</td>
                                <td>${student.getName()}</td>
                                <td>${student.getLastName()}</td>
                                <td>${student.getTelephone()}</td>
                            </tr>
                        </#list>
                    </tbody>
                </table>
            </div>

            <br>

            <!-- Buttons -->
            <div class="box" id="buttons">
                <form action="http://localhost:4567/new" method="GET">
                    <input type="submit" name="submit" value="Add New Student">
                </form>
                <br>
                <form action="http://localhost:4567/modify" method="GET">
                    Modify: <input type="text" name="matricula">
                    <input type="submit" name="submit" value="Modify Student">
                </form>
                <br>
                <form action="http://localhost:4567/delete" method="POST">
                    Delete: <input type="text" name="matricula">
                    <input type="submit" name="submit" value="Delete Student">
                </form>
            </div>

            <br>

            <!-- Footer -->
            <div class="box" id="footer">
                <p>Copyrighted &copy; by Djidjelly P. Siclait</p>
            </div>
        </div>
    </body>
</html>