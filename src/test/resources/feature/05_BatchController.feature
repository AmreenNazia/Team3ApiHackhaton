Feature: Batch Module

  Background: Admin sets Authorization
    Given Admin creates request with valid credentials
    When Admin calls Post Https method  with valid endpoint
    Then Admin receives 200 created with auto generated token

   
  @CreateBatchDuplicate
  Scenario: Check if admin able to create a Batch with valid endpoint and request body (existing value in Batch Name)
    Given User creates request for LMS API endpoint for batch "Create New Batch".
    When Admin sends HTTPS Request with endpoint.
    Then Admin receives 400 Bad Request Status with message and boolean success details

  @CreateBatchMissingMandatory
  Scenario: Check if admin able to create a Batch missing mandatory fields in request body
     Given User creates request for LMS API endpoint for batch "Create Missing Mandatory".
   When Admin sends HTTPS Request with endpoint.
    Then Admin receives 400 Bad Request Status with message and boolean success details

  @CreateBatchInvalidEndpoint
  Scenario: Check if admin able to create a batch with invalid endpoint
    Given Admin creates POST Request "Create New Batch"
    When Admin sends HTTPS Request with invalid endpoint
    Then Admin receives 404 not found  Status

   
  @CreateBatchInvalidData
  Scenario: Check if admin able to create a batch with invalid data in request body
    Given User creates request for LMS API endpoint for batch "Invalid Data".
   When Admin sends HTTPS Request with endpoint.
    Then Admin receives 400 Bad Request Status with message and boolean success details

  @CreateBatchInactiveProgramId
  Scenario: Check if admin able to create a batch  with inactive program ID
     Given User creates request for LMS API endpoint for batch "Inactive programID".
   When Admin sends HTTPS Request with endpoint.
    Then Admin receives 400 Bad Request Status with message and boolean success details

  @CreateBatchNoAuth
  Scenario: Check if admin able to create a Batch with valid endpoint and request body without authorization.
    Given User creates request for LMS API endpoint for batch "Create New Batch".
   When Admin sends HTTPS Request with endpoint.
    Then Admin receives 401 Unauthorized

   

  @GetInvalidEndpoint
  Scenario: Check if admin able to retrieve all batches with invalid Endpoint
    Given Admin creates GET Request.
    When Admin sends HTTPS Request with invalid endpoint
    Then Admin receives 404 status with error message Not Found .

   
  @GetAllBatchesNoAuth
  Scenario: Check if admin able to retrieve all batches without Authorization
    Given Admin creates GET Request with no auth
    When Admin sends "HTTPS Request" with endpoint.
    Then Admin receives 401 status with error message Unauthorized.

  @GetBatchNoAuth
  Scenario: Check if admin able to retrieve a batch with batch ID without authorization
    Given Admin creates GET Request with no auth
    When Admin sends "HTTPS" Request with endpoint
    Then Admin receives 401 status with error message Unauthorized.

   
  @GetBatchInvalidBatchId
  Scenario: Check if admin able to retrieve a batch with invalid BATCH ID
    Given Admin creates GET Request with invalid Batch ID
    When Admin sends HTTPS Request with endpoint "invalid"
    Then Admin receives 404 Not Found Status with message and boolean success details

  @GetBatchInvalidEndpoint
  Scenario: Check if admin able to retrieve a batch with invalid endpoint
    Given Admin creates GET Request with invalid Batch ID
    When Admin sends HTTPS Request with "invalid endpoint"
    Then Admin receives 404 not found  Status

  @GetBatchNameNoAuth
  Scenario: Check if admin able to retrieve a batch without authorization
    Given Admin creates GET Request with no auth
    When Admin sends HTTPS Request with batchName endpoint
    Then Admin receives 401 status with error message Unauthorized.

   
  @GetBatchByInvalidBatchname
  Scenario: Check if admin able to retrieve a batch with invalid BATCH NAME
    Given Admin creates GET Request with invalid Batch Name
    When Admin sends HTTPS Request with endpoint invalid BatchName
    Then Admin receives 404 Not Found Status with message and boolean success details

  @GetBatchInvalidEndpoint
  Scenario: Check if admin able to retrieve a batch with invalid endpoint
    Given Admin creates GET Request with invalid Batch Name
    When Admin sends HTTPS Request with invalid endpoint batchName
    Then Admin receives 404 Not Found Status with message and boolean success details
#
  @GetBatchByPgmIdNoAuth
  Scenario: Check if admin able to retrieve a batch without authorization
    Given Admin creates GET Request with no auth
    When Admin sends HTTPS Request with the endpoint for programId.
    Then Admin receives 401 status with error message Unauthorized.

   
  @GetBatchByInvalidPgmId
  Scenario: Check if admin able to retrieve a batch with invalid Program Id
    Given Admin creates GET Request with program id for batch.
    When Admin sends HTTPS Request with invalid programId endpoint
    Then Admin receives 404 Not Found Status with message and boolean success details

  @GetBatchByPgmIdInvalidEndpoint
  Scenario: Check if admin able to retrieve a batch with invalid endpoint
    Given Admin creates GET Request with program id for batch.
    When Admin sends HTTPS Request with invalid endpoint for get batch
    Then Admin receives 404 Not Found Status with message and boolean success details

  @UpdateBatchNoAuth
  Scenario: Check if admin able to update a Batch with valid batchID and mandatory fields in request body without authorization
    Given Admin creates PUT Request with valid BatchId and "Update Valid Data"
    When Admin sends HTTPS Request  with update endpoint.
    Then Admin receives 401 status with error message Unauthorized.

   
  @UpdateBatchInvalid
  Scenario: Check if admin able to update a Batch with invalid batchID and mandatory fields in request body
    Given Admin creates PUT Request with auth, valid BatchId and Update Valid Data.
    When Admin sends HTTPS Request  with endpoint invalid batch
    Then Admin receives 404 Not Found Status with message and boolean success details

  @UpdateMissingMandatory
  Scenario: Check if admin able to update a Batch with valid batchID and missing mandatory fields request body
    Given Admin creates PUT Request with auth,BatchId and "Missing mandatory Update"
    When Admin sends HTTPS Request  with update endpoint.
    Then Admin receives 400 Bad Request Status with message and boolean success details

  @UpdateInvalidData
  Scenario: Check if admin able to update a batch with invalid data
    Given Admin creates PUT Request with "Invalid Data"
    When Admin sends HTTPS Request  with update endpoint.
    Then Admin receives 400 Bad Request Status with message and boolean success details

  @UpdateInvalidEndpoint
  Scenario: Check if admin able to update a Batch with invalid enpoint
    Given Admin creates PUT Request with auth, valid BatchId and Update Valid Data.
    When Admin sends HTTPS put Request  with invalid endpoint
    Then Admin receives 404 Not Found Status with message and boolean success details
  
  @UpdateBatchwithDeletedProgramId
  Scenario: Check if admin able to update a Batch with a valid batchID and deleted programID field
            in the request body with other mandatory fields

    Given Admin creates PUT Request with Valid batch Id and Deleted programID.
    When Admin sends HTTPS Request  with update endpoint and deleted programID.
    Then Admin receives 400 Bad Request Status with message and boolean success details
    
     
    @DeleteBatchwithInvalidEndpoint
    Scenario: Check if admin able to delete a Batch with invalid endpoint
    Given Admin creates DELETE Request with valid BatchId.
    When Admin sends HTTPS Request  with invalid delete batch endpoint
    Then Admin receives 404 Not Found Status with message and boolean success details
    
    @DeleteBatchwithInvalidBatchId
    Scenario: Check if admin able to delete a Batch with invalid Batch ID
    Given Admin creates DELETE Request with invalid BatchId
    When Admin sends HTTPS Request  with endpoint invalid batchID
    Then Admin receives 404 Not Found Status with message and boolean success details
    
    @DeleteBatchWithNoAuth
    Scenario: Check if admin able to delete a Batch without authorization
    Given Admin creates DELETE Request with valid BatchId no auth
    When Admin sends HTTPS Request  with endpoint for batch.
    Then Admin receives 401 status with error message Unauthorized.
    
    @GetBatchbyProgramIdAfterDelete
    Scenario: Check if admin able to retrive a batch after the programID is deleted
    Given Admin creates GET Request with program id for batch.
    When Admin sends HTTPS Request with endpoint. 
    Then Admin receives 404 Not Found Status with message and boolean success details
    
    @GetBatchAfterDeletById
    Scenario: Check if admin able to retrive a batch after deleting the batch 
    Given Admin creates GET Request with valid Batch ID.
    When Admin sends HTTPS get Request with endpoint.
    Then Admin receives 200 OK Status with  batchStatus field "Inactive" in the response body.
    
    @GetBatchAfterDeleteByName
    Scenario: Check if admin able to retrive a deleted batch  using batch name 
    Given Admin creates GET Request with invalid Batch Name
    When Admin sends HTTPS Request with endpoint invalid BatchName
    Then Admin receives 200 OK Status with  batchStatus field "Inactive" in the response body.
    
    @UpdatewithDeletedBatchId
    Scenario: Check if admin able to update a Batch with a deleted batchID in the endpoint
    Given Admin creates PUT Request with auth, valid BatchId and Update Valid Data.
    When Admin sends HTTPS Request  with endpoint and deleted batchID
    Then Admin receives 200 Ok status with message for update
    
    