Meta:
@epic petstore

Scenario: Verify that allows creating a User
Given I am on the API page with URL '/user'
When I set request body
"""
{
  "id": 1,
  "username": "testuser",
  "firstName": "Test",
  "lastName": "User",
  "email": "testuser@example.com",
  "password": "testpass",
  "phone": "1234567890",
  "userStatus": 1
}
"""
And I submit request 'POST'
Then the response code should be 200

Scenario: Verify that allows login as a User
Given I am on the API page with URL '/user/login?username=testuser&password=testpass'
When I submit request 'GET'
Then the response code should be 200

Scenario: Verify that allows creating the list of Users
Given I am on the API page with URL '/user/createWithList'
When I set request body
"""
[
  {
    "id": 2,
    "username": "testuser2",
    "firstName": "Second",
    "lastName": "User",
    "email": "seconduser@example.com",
    "password": "secondpass",
    "phone": "0987654321",
    "userStatus": 2
  }
]
"""
And I submit request 'POST'
Then the response code should be 200

Scenario: Verify that allows Log out User
Given I am on the API page with URL '/user/logout'
When I submit request 'GET'
Then the response code should be 200

Scenario: Verify that allows adding a new Pet
Given I am on the API page with URL '/pet'
When I set request body
"""
{
  "id": 1,
  "category": {
    "id": 1,
    "name": "Dogs"
  },
  "name": "Rex",
  "photoUrls": [
    "http://example.com/photos/1"
  ],
  "tags": [
    {
      "id": 1,
      "name": "tag1"
    }
  ],
  "status": "available"
}
"""
And I submit request 'POST'
Then the response code should be 200

Scenario: Verify that allows updating Pet’s image
Given I am on the API page with URL '/pet/1'
When I set request body
"""
{
  "id": 1,
  "photoUrls": [
    "http://example.com/photos/updated"
  ]
}
"""
And I submit request 'PUT'
Then the response code should be 200

Scenario: Verify that allows updating Pet’s name and status
Given I am on the API page with URL '/pet'
When I set request body
"""
{
  "id": 1,
  "name": "UpdatedName",
  "status": "sold"
}
"""
And I submit request 'PUT'
Then the response code should be 200

Scenario: Verify that allows deleting Pet
Given I am on the API page with URL '/pet/1'
When I submit request 'DELETE'
Then the response code should be 200