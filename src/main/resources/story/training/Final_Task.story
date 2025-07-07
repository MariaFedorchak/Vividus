Meta:
    @group Training
    @requirementId MyTask-Final


Scenario: Create a user
Given request body:
 {
      "id": 26042022,
      "username": "Mar",
      "firstName": "Mary",
      "lastName": "Fed",
      "email": "deserunt incididunt sunt",
      "password": "Taras",
      "phone": "sit deserunt sint quis",
      "userStatus": -76680916
    }
When I set request headers:
|name|value|
|accept|application/json|
|Content-Type|application/json|
When I execute HTTP POST request for resource with URL `https://petstore.swagger.io/v2/user`
Then `${response-code}` is equal to `200`


Scenario: Logs user into the system

When I set request headers:
|name|value|
|accept|application/json|
|Content-Type|application/json|
And I execute HTTP GET request for resource with URL `https://petstore.swagger.io/v2/user/login?username='S{myUserName}'&password='${userPassword}`
Then `${response-code}` is equal to `200`

Scenario: Add a new pet to the store
Given request body:
{
  "name": "Grim",
  "photoUrls": [
    "voluptate Duis consequat enim labore",
    "in Duis magna dolor"
  ],
  "id": 1321982,
  "category": {
    "id": 91604231,
    "name": "eiusmod pariatur Lorem"
  },
  "tags": [
    {
      "id": -44628133,
      "name": "pariatur enim voluptate id amet"
    },
    {
      "id": -1345485,
      "name": "Excepteur ad cillum"
    }
  ],
  "status": "pending"
}
When I set request headers:
|name|value|
|accept|application/json|
|Content-Type|application/json|
When I execute HTTP POST request for resource with URL `https://petstore.swagger.io/v2/pet`
Then `${response-code}` is equal to `200`




Scenario: Update an existing pet
Given request body:
{
  "name": "Gromyk",
  "photoUrls": [
    "esse aliquip culpa",
    "nisi ullamco"
  ],
  "id": 1321982,
  "category": {
    "id": -5190494,
    "name": "eiusmod et minim voluptate laboris"
  },
  "tags": [
    {
      "id": 36367848,
      "name": "eu officia exercitation nulla id"
    },
    {
      "id": -87595755,
      "name": "velit adipisic"
    }
  ],
  "status": "available"
}
When I set request headers:
|name|value|
|accept|application/json|
|Content-Type|application/json|
When I execute HTTP PUT request for resource with URL `https://petstore.swagger.io/v2/pet`
Then `${response-code}` is equal to `200`

Scenario:

When I set request headers:
|name|value|
|accept|application/json|
|Content-Type|application/json|
And I execute HTTP DELETE request for resource with URL `https://petstore.swagger.io/v2/pet/${petId}`
Then `${response-code}` is equal to `200`
