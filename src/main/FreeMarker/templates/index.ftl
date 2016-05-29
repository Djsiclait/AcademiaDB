<!DOCTYPE html>
<html>
    <head>
        <title>AcademiaDB-HOME</title>
    </head>
    <body>
        <h1>Registered Students</h1>

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
                <#list Registry>
                    <#items as student>
                    <tr>
                        <td>
                            ${student.getMatricula()}
                        </td>
                        <td>
                            ${student.getName()}
                        </td>
                        <td>
                            ${student.getLastName()}
                        </td>
                        <td>
                            ${student.getTelephone()}
                        </td>
                    </tr>
                    </#items>
                </#list>
            </tbody>
        </table>
    </body>
</html>