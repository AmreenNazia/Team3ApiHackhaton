@UserModule
Feature: Check Post request of user controller module.

Background: Admin sets Authorization  
Given Admin creates request with valid credentials
When Admin calls Post Https method  with valid endpoint
Then Admin receives 200 created with auto generated token

@01UserModule-PostValid
Scenario: Authorized admin is able to create a new user with valid url and request body with mandatory fields.
 Given Authorized Admin creates POST request with valid request body. 
 When Authorized admin send valid post api request
 Then Authorized admin receive 201 status with response body
     
 