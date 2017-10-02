Feature: Opening the help screen

  Scenario: As a user I want to be able to open the help screen from the side menu the first time I open the app
    Given I press "Paraderos"               
    #button to remove the splash screen
    When I swipe left
    #to open te menu
    And I press "Ayuda"
    Then I should see "Calcular ruta con horario"

  Scenario: I want to check information about my route
    Given I press "Rutas de buses"
    When I press "Portal El Dorado » Universidades"
    Then I wait for 2 seconds

  Scenario: As a user I want to search a Specific Bus routes
    Given I press "Rutas de buses"
    When I press "Search"
    Then I enter text "Portal Norte" into field with id "search_src_text"
    When I press "Portal 80 » Portal Norte"
    Then I wait for 5 seconds
  
  Scenario: As a user I want to search for my bus stops
    Given I press "Paraderos"
    When I press "Search"
    Then I enter text "Avenida Calle 26" into field with id "search_src_text"
    Then I press the enter button
    Then I wait for 2 seconds
  
  Scenario: As a user I want to know the News
    Given I press "Noticias"
    Then I wait for 2 seconds
