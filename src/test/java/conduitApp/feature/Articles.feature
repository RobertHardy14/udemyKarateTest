
Feature:  Article

Background: Define URL
    Given url 'https://conduit-api.bondaracademy.com/api/'
    Given path 'users/login'
    And request {"user": { "email": "wohawi4248@buzblox.com", "password": "XMn!MX:NBmnKrx9"}}
    When method POST
    Then status 200
    * def token = response.user.token

Scenario: Create a new article
    Given header Authorization = 'Token ' + token
    Given path 'articles'
    And request {  "article": {"title": "Karate Post","description": "Just a test","body": "Text","tagList": []}}
    When method Post
    Then status 201
    And match response.article.title == 'Karate Post'