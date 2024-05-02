@do_article
Feature:  Article

Background: Define URL
    Given url apiUrl

Scenario: Create a new article
    Given path 'articles'
    And request {"article": {"title": "Karate Title RM2","description": "Just a test","body": "Text","tagList": []}}
    When method Post
    Then status 201
    And match response.article.title == 'Karate Title RM2'

@create_delete
Scenario: Delete created Article
    Given path 'articles'
    And request {"article": {"title": "Karate Title2","description": "Just a test","body": "Text","tagList": []}}
    When method Post
    Then status 201
    And match response.article.title == 'Karate Title2'
    * def toDelete = response.article.slug
    
    Given path 'articles',toDelete
    When method Delete
    Then status 204