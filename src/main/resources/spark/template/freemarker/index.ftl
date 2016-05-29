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
            <p><a href=${url1}>Add Student</a></p>

            <p><a href=${url2}>Modify Student</a></p>

            <p>Remove Student</p>
        </div>

        <p>Created by Djidjelly P. Siclait</p>
    </body>
</html>