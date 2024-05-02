@SignUp
Feature: Sign Up to the page

Background: Preconditions
    * def dataGenerator = Java.type('helpers.DataGenerator')
    * url apiUrl
Scenario: New user Sign up
    * def randomEmail = dataGenerator.getRandomEmail()
    * def randomUser = dataGenerator.getRandomUsername()

    Given path "users"
    # this is how to declare multi-line expressions 3 " at the top and bottom, and add the expressions there
    And request 
    """
        {
            "user": {
                "email": #(randomEmail),
                "password": "made_Up-pass",
                "username": #(randomUser)
            }
        }
    """
    When method Post
    Then status 201