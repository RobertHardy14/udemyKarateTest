

Feature: Tests for the homepage 

Background: Define URL
    Given url apiUrl

    Scenario: Get all tags
        Given path 'tags'
        When method Get
        Then status 200
        And match response.tags contains ['Git', 'Test', 'Coding']
        And match response.tags !contains 'Pug'
        And match response.tags contains any ['YouTube','Blog']
        And match response.tags == "#array"
        And match each response.tags == "#string"

    @homePage
    Scenario: Get 10 articles from the page
        Given path 'articles'
        Given params {limit: 10, offset: 0}
        When method Get
        Then status 200
        And match response.articles == '#[10]'
        And match response.articlesCount == 10
        And match response == {'articles': '#array', 'articlesCount': 10}
        And match each response..bio == '##string'