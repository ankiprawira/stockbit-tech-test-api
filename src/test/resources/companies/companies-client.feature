Feature: Companies API client
  Background:
    * def baseUrl = karate.get('baseUrl')
  Scenario: Get companies
    * def q = {}

    * if (quantity) q._quantity = quantity
    * if (locale) q._locale = locale
    * if (seed) q._seed = seed

    Given url baseUrl + 'companies'
    And params q
    When method get
    Then status 200

    * def body = response
