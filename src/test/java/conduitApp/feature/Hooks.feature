@hook
Feature: Hooks

#Before Hook:
Background: Hooks
    # * def result = call read('classpath:helpers/Dummy.feature')
    # * def username = result.username

    #After Hooks
    * configure afterScenario = function(){ karate.call('classpath:helpers/Dummy.feature') }

Scenario: First Scenario
    * print username
    * print 'This is the first scenario'
    
Scenario: Second Scenario
    * print username
    * print 'This is the second scenario'