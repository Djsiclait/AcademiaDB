<!DOCTYPE html>
<html>
    <head>
        <title>Register Student</title>

        <style>
            body {
                background-color: lightblue;
            }

            form {
                display: inline-block;
            }

            table {
                width: 100%;
            }

            table tr {
                margin: auto;
                border: 1px solid darkblue;
                height: 10px;
            }

            table th {
                margin: auto;
                border: 1px solid darkblue;
            }

            table td {
                margin: auto;
                border: 1px solid darkblue;
            }

            tr.selected td
            {
                background-color: #d1db3e;
                color:#000;
            }

            h1 {
                margin: auto;
            }

            h3 {
                margin: auto;
            }

            p {
                margin: auto;
            }

            .box {
                margin: auto;

                width: 500px;

                text-align: center;
            }

            #container {
                border: 1px solid darkblue;
                border-radius: 5px;
            }

            #header {
                background-color: darkblue;
                color: white;
            }

            #registry {
                margin: auto;
                background-color: dodgerblue;
                height: 300px;
                overflow: auto;
            }

            #footer {
                background-color: darkblue;
                color: white;
                margin-bottom: 0px;
            }

        </style>

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
                <form action="/modify" method="POST">
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
                <form action="/" method="GET">
                    <!-- Cancel -->
                    <input type="submit" name="submit" value="Home">
                </form>
            </div>
        </div>
    </body>
</html>