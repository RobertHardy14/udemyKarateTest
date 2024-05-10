@SignUp
Feature: Sign Up to the page

Background: Preconditions
    * def dataGenerator = Java.type('helpers.DataGenerator')
    * url apiUrl
    * def randomEmail = dataGenerator.getRandomEmail()
    * def randomUser = dataGenerator.getRandomUsername()
Scenario: New user Sign up

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
@validateError
Scenario Outline: Validate error messages:

    Given path "users"
    And request 
    """
        {
            "user": {
                "email": "<email>",
                "password": "<password>",
                "username": "<username>"
            }
        }
    """
    When method Post
    Then status 422
    And match response == <errorResponse>

    Examples: 
        | email                  | password     | username      | errorResponse                                       |
        | #(randomEmail)         | made_Up-pass | SuspiciousPug | {"errors":{"username": ["has already been taken"]}} |
        | wohawi4248@buzblox.com | made_uP-pAss | #(randomUser) | {"errors":{"email":["has already been taken"]}}