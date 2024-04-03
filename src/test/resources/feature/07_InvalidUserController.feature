

Feature: Validating Invalid data for User API's

  
Background: Admin sets Authorization  
Given Admin creates request with valid credentials
When Admin calls Post Https method  with valid endpoint
Then Admin receives 200 created with auto generated token

@02UserModule-PostInvalid        
 Scenario: Authorized admin is able to create a new user with valid url and request body with missing mandatory fields. 
 Given Authorized admin user create post request with invalid request body
 When Authorized admin user send valid post api request 
 Then Authorized admin user receive 400 status with message  
 
 @03UserModule-PostNoAuth  
 Scenario: Unauthorized admin user create post request with valid request body      
 Given Unauthorized admin user create post request with valid request body
 When Unauthorized admin user send valid post api request 
 Then Unauthorized admin user receive 401 status with message                          

Scenario: Admin is able to get all users with invalid endpoint
Given Users creates Get user request 
When Users sends https request with "allusers"
Then Users receives 404 

Scenario: Admin is able to get all admins with invalid endpoint
Given Users creates Get user request 
When Users sends https request with "allroles"
Then Users receives 404 

Scenario: Admin is able to get all active users with invalid endpoint
Given Users creates Get user request 
When Users sends https request with "allactiveusers"
Then Users receives 404

Scenario: Admin is able to get all active and inactive users with invalid endpoint
Given Users creates Get user request 
When Users sends https request with "countofactiveandinactive"
Then Users receives 404

Scenario: Admin is able to get user with invalid userId
Given Users creates Get user request 
When Users sends https request with "userbyuserId"
Then Users receives 404 

Scenario: Admin is able to get admin by invalid program batchId
Given Users creates Get user request 
When Users sends https request with "adminbyprogrambatchId"
Then Users receives 404

Scenario: Admin is able to get admin by invalid programId
Given Users creates Get user request 
When Users sends https request with "adminbyprogramId"
Then Users receives 404

Scenario: Admin is able to get admin by invalid roleId
Given Users creates Get user request 
When Users sends https request with "adminbyroleId"
Then Users receives 404 

Scenario: Admin is able to get admin with roles with invalid endpoint
Given Users creates Get user request 
When Users sends https request with "alluserswithroles"
Then Users receives 404 

Scenario: Admin is able to get users by roleId V2 with invalid endpoint
Given Users creates Get user request 
When Users sends https request with "usersbyroleIdV2"
Then Users receives 404

Scenario: Admin is able to update user with invalid roleId
Given Users creates request with valid response body "UserRoleId"
When Users sends https put request with "userroleId"
Then Users receives 404

Scenario: Admin is able to update user with existing roleId
Given Users creates request with valid response body "UserRoleId"
When Users sends https put request with "userroleId"
Then Users receives 404

Scenario: Admin is able to update user with invalid adminroleprogrambatch
Given Users creates request with valid response body "UserRoleProgramBatchInvalid"
When Users sends https put request with "userroleprogrambatch"
Then Users receives 404

Scenario: Admin is able to update user with existing adminroleprogrambatch
Given Users creates request with valid response body "UserRoleProgramBatchInvalid"
When Users sends https put request with "userroleprogrambatch"
Then Users receives 404

Scenario: Admin is able to update user with invalid userloginstatus
Given Users creates request with valid response body "UserLoginStatus"
When Users sends https put request with "userloginstatus"
Then Users receives 404