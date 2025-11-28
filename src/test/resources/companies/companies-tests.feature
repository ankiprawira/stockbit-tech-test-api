Feature: FakerAPI Companies - Happy Path Validation

  Background:
    * def client = read('classpath:companies/companies-client.feature')

    * def companySchema = read('classpath:companies/schema/company-schema.json')
    * def addressSchema = read('classpath:companies/schema/address-schema.json')
    * def contactSchema = read('classpath:companies/schema/contact-schema.json')
    * def contactAddrSchema = read('classpath:companies/schema/contact-address-schema.json')


  Scenario: Default request returns default quantity and valid structure
    * def res = call client { quantity: null, locale: null }
    * def body = res.body

    Then match body.status == 'OK'
    And match body.code == 200
    And match body.total == body.data.length

    * def first = body.data[0]

    And match first == companySchema
    And match each first.addresses == addressSchema
    And match first.contact == contactSchema
    And match first.contact.address == contactAddrSchema


  Scenario Outline: Quantity parameter controls number of results
    * def res = call client { quantity: <quantity>, locale: null }
    * def body = res.body

    Then match body.status == 'OK'
    And match body.code == 200
    And match body.total == <quantity>
    And match body.data == '#[<quantity>]'

    * def first = body.data[0]
    And match first == companySchema

    Examples:
      | quantity |
      | 1        |
      | 5        |
      | 10       |


  Scenario: Locale parameter is reflected in response
    * def res = call client { quantity: 3, locale: 'id_ID' }
    * def body = res.body

    Then match body.status == 'OK'
    And match body.code == 200
    And match body.locale == 'id_ID'
    And match body.data == '#[3]'

    * def first = body.data[0]
    And match first == companySchema
