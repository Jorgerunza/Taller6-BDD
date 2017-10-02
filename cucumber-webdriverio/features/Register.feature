Feature: Register a new user into losestudiantes
    As a user I want to register an account on losestudiantes.com

Scenario Outline: register a new account

  Given I go to losestudiantes home screen
    When I open the login screen
    And I fill with <nombre>, <apellido> , <correo> , selected a <idDepartamento> , fill my <password> and check the <acepta>
    And I try to register
    Then I expect to see <error>

    Examples:
      | nombre | apellido | correo                    | idDepartamento | password           | acepta | error                                           |
      | Jorge  | Runza    |                           |       3        | Pruebas2017MisoJR  |   1    | Ingresa un correo valido                        |
      | Jorge  | Runza    | jd.runza                  |       3        |                    |   1    | Ingresa un correo valido                        | 
      | Jorge  | Runza    | jd.runza@uniandes.edu.co  |       3        |                    |   1    | Ingresa una contraseña                          |
      | Jorge  | Runza    | jd.runza@uniandes.edu.co  |       3        | falsa              |   1    | La contraseña debe ser al menos de 8 caracteres | 
      | Jorge  | Runza    | jd.runza@uniandes.edu.co  |       3        | Pruebas2017MisoJR  |        | Debes aceptar los términos y condiciones        |
      | Jorge  | Runza    | jd.runza@uniandes.edu.co  |       3        | Pruebas2017MisoJR  |   1    |                                                 |
      | Jorge  | Runza    | jd.runza@uniandes.edu.co  |                | Pruebas2017MisoJR  |   1    |                                                 |
