# README

This is a basic CRUD API that could be used for an online game that needs to keep track of the items that each account has.

Made with Ruby on Rails.

# Instructions
To test the API you must have ruby and ruby on rails installed. 

1. Clone this repository
2. Run migrations using the command $ *rails db:migrate*
3. Start the local server with the command $ *rails s*
4. Test the API endpoints using Postman or your favorite API client.

# Endpoints

## Accounts 
### /api/accounts
**Type**: GET

**Description**: Returns all the accounts in the database


**Type**: POST

**Description**: Creates an account.

**Parameters**: 

  "username": The username of the account
  
  "level": The current level of the account
  
  
**Body example**:

{

    "account" : {
    
        "username": "ericbl3",
        
        "level": 33
        
    }
    
}

---

### /api/accounts/:id
**Type**: GET

**Description**: Returns the account with the given id.


**Type**: PUT

**Description**: Updates the account with the given id.

**Parameters**: 

  "username": The username of the account
  
  "level": The current level of the account
  
  
**Body example**:

{

    "account" : {
    
        "username": "ericbl3",
        
        "level": 35
        
    }
    
}


**Type**: DELETE

**Description**: Deletes the account with the given id as well as any items that the account had.

---

## Items 
### /api/accounts/:id/items
**Type**: GET

**Description**: Returns all the items of the account given by the id.


**Type**: POST

**Description**: Creates an item for the account of the given id.

**Parameters**: 

  "id": The id of the account
  
  "name": The name of the item
  
  "description": The description of the item
  
  
**Body example**:

{

    "id": 1,
    
    "item" : {
    
        "name": "Magic Potion",
        
        "description": "restores 50 MP."
        
    }
    
}

---

### /api/accounts/:account_id/items/:item_id
**Type**: GET

**Description**: Returns the item given by *item_id* of the account given by *account_id*.


**Type**: PUT

**Description**: Updates the item given by *item_id* of the account given by *account_id*.

**Parameters**: 

  "name": The name of the item
  
  "description": The description of the item
  
  
**Body example**:

{

    "item" : {
    
        "name": "Health Potion",
        
        "description": "restores 60 HP."
        
    }
    
}

**Type**: DELETE

**Description**: Deletes the item given by *item_id* of the account given by *account_id*.

