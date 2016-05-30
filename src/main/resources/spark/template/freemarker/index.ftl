<!DOCTYPE html>
<html>
    <head>
        <title>AcademiaDB-HOME</title>
    </head>
    <body>
        <h1>${message}</h1>

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

        <div>
            <form action="http://localhost:4567/new" method="GET">
                <input type="submit" name="submit" value="Add New Student">
            </form>

            <form action="http://localhost:4567/modify" method="GET">
                <input type="submit" name="submit" value="Modify Student">
            </form>

            <form action="http://localhost:4567/delete" method="POST">
                <input type="submit" name="submit" value="Delete Student">
            </form>
        </div>

        <p>Created by Djidjelly P. Siclait</p>
    </body>
</html>