# MongoDB Labs ~ NoSQL Fundamentals

## Initial Setup

- Login to your Virtual Machine
- On the desktop open: **Docker Desktop**

!!! warning "Wait for the Docker Engine to start"

Then open **Terminal** on your VM to get to a command prompt

---

## Lab 1: Getting Started with MongoDB

### Instructor Led Demo

**Start MongoDB Container**

```bash
# Start MongoDB 4.4 (compatible with VMs without AVX support)
docker run -d -p 27017:27017 --name mongodb mongo:4.4

# Verify it's running
docker ps
```

If MongoDB is running you should see something similar to the following:

```powershell
CONTAINER ID  IMAGE      COMMAND                 CREATED      STATUS      PORTS                     NAMES
868de3409690  mongo:4.4  "docker-entrypoint.s…"  20 secs ago  Up 16 secs  0.0.0.0:27017->27017/tcp  mongodb
```

**Connect to MongoDB**

```powershell
# Connect to MongoDB shell
docker exec -it mongodb mongo
```

You should see the MongoDB shell prompt: `>`

**Create a Database and Insert First Document**

```javascript
// Switch to (or create) the shop database
use shop
```

```javascript
// Insert a customer document
db.customers.insertOne({
  name: "Sarah Johnson",
  email: "sarah@example.com",
  age: 32,
  city: "London"
})
```

```javascript
// See what we created
db.customers.find()
```

!!! note 
    We didn't create a table structure first - just inserted data!

---

### Hands-On Practice ~ Learners

**Task 1: Insert Different Customer Structures**

Insert these three customers:

```javascript
// Customer 1: Basic info
db.customers.insertOne({
  name: "James Smith",
  email: "james@example.com",
  age: 28
})
```

```javascript
// Customer 2: Has additional phone and country fields
db.customers.insertOne({
  name: "Priya Patel",
  email: "priya@example.com",
  age: 35,
  phone: "020-1234-5678",
  country: "UK"
})
```

```javascript
// Customer 3: Completely different structure - business customer
db.customers.insertOne({
  companyName: "Tech Solutions Ltd",
  contactPerson: "Michael Chen",
  email: "michael@techsolutions.com",
  employees: 50,
  accountType: "business"
})
```
!!! note
    See how each customer has different fields - this is the power of flexible schema!


**Task 2: View All Customers**

```javascript
// Get all customers
db.customers.find()
```

```javascript
// Make it prettier (easier to read)
db.customers.find().pretty()
```

**Task 3: Explore What You Created**

```javascript
// See all databases
show dbs
```

```javascript
// See collections in current database
show collections
```

```javascript
// Count how many customers you have
db.customers.countDocuments({})
```

```javascript
// Rough count without scanning everything (for big collections)
db.customers.estimatedDocumentCount()
```

---

### Discussion

**Questions to explore:**

- What happens if you try to query for a field that doesn't exist in some documents?
- How is this different from SQL tables where every row must have the same columns?
- When might flexible schema be useful?

---

## Lab 2: Querying and Modifying Data

### Instructor Led Demo

**Finding Documents with Filters**

```javascript
// Find all customers
db.customers.find()
```

```javascript
// Find customers in London
db.customers.find({ "city": "London" })
```

```javascript
// Find customers in country UK (field town does not exist)
db.customers.find({ "town": "London Town" })
```

```javascript
// Find customers older than 30
db.customers.find({ "age": { $gt: 30 } })
```

```javascript
// Find customers with age between 25 and 35
db.customers.find({ "age": { $gte: 25, $lte: 35 } })
```

**Updating Documents**

```javascript
// Sarah's current details
db.customers.find({ "name": "Sarah Johnson" })
```

```javascript
// Update Sarah's city
db.customers.updateOne(
  { "name": "Sarah Johnson" },
  { $set: { "city": "Manchester" } }
)
```

```javascript
// Verify the update
db.customers.find({ "name": "Sarah Johnson" })
```

---

### Hands-On Practice ~ Learners

**Task 1: Practice Finding**

```javascript
// Find customer by name
db.customers.findOne({ "name": "James Smith" })
```

```javascript
// Find all customers who have a phone field
db.customers.find({ "phone": { $exists: true } })
```

```javascript
// Find business customers (accountType is "business")
db.customers.find({ "accountType": "business" })
```

**Task 2: Update Customer Information**

```javascript
// Add a phone number to James Smith
db.customers.updateOne(
  { "name": "James Smith" },
  { $set: { "phone": "020-9876-5432" } }
)
```

```javascript
// Add a new field "memberSince" to Priya
db.customers.updateOne(
  { name: "Priya Patel" },
  { $set: { "memberSince": "2024-01-15" } }
)
```

```javascript
// Check your updates
db.customers.find().pretty()
```

**Task 3: Delete Documents**

```javascript
// Delete Tech Solutions Ltd
db.customers.deleteOne({ "companyName": "Tech Solutions Ltd" })
```

```javascript
// Verify deletion
db.customers.countDocuments({})
```

---

### Discussion

**Key Observations:**

- What happened when you added a phone field to James? Did it affect other customers?
- MongoDB let you add fields that don't exist - is this good or bad?

---

## Lab 3: Embedded Documents

### Instructor Led Demo

**The Power of Embedding**

In traditional databases, you'd have a customers table and an orders table, then JOIN them.

In MongoDB, you can embed orders directly inside the customer document.

```javascript
// Insert a customer with embedded orders
db.customers.insertOne({
  name: "Emma Wilson",
  email: "emma@example.com",
  city: "Birmingham",
  orders: [
    {
      orderId: "ORD001",
      date: "2024-11-01",
      items: ["Laptop", "Mouse"],
      total: 899.99
    },
    {
      orderId: "ORD002",
      date: "2024-11-10",
      items: ["Keyboard"],
      total: 79.99
    }
  ]
})
```

**Query Embedded Data**

```javascript
// Find Emma and see all her orders
db.customers.find({ "name": "Emma Wilson" }).pretty()
```

```javascript
// Find customers who have orders
db.customers.find({ "orders": { $exists: true } }).pretty()
```

```javascript
// Find customers with orders over £500
db.customers.find({ "orders.total": { $gt: 500 } }).pretty()
```

---

### Hands-On Practice ~ Learners

**Task 1: Create Customer with Orders**

Create a new customer with their order history embedded:

```javascript
db.customers.insertOne({
  name: "David Thompson",
  email: "david@example.com",
  city: "Leeds",
  memberSince: "2023-06-15",
  orders: [
    {
      orderId: "ORD003",
      date: "2024-10-15",
      items: ["Monitor", "HDMI Cable"],
      total: 249.99
    },
    {
      orderId: "ORD004",
      date: "2024-11-05",
      items: ["Webcam"],
      total: 89.99
    },
    {
      orderId: "ORD005",
      date: "2024-11-12",
      items: ["Desk Lamp", "USB Hub"],
      total: 45.50
    }
  ]
})
```

**Task 2: Query Embedded Data**

```javascript
// Find David's complete record
db.customers.find({ "name": "David Thompson" }).pretty()
```

```javascript
// Find customers with more than 2 orders
db.customers.find({
  $expr: { $gt: [ { $size: "$orders" }, 2 ] }
})
```

```javascript
// Find customers who ordered in November 2024
db.customers.find({ "orders.date": { $regex: "2024-11" } })
```

**Task 3: Update Embedded Data**

```javascript
// Add a new order to Emma
db.customers.updateOne(
  { name: "Emma Wilson" },
  { 
    $push: { 
      orders: {
        orderId: "ORD006",
        date: "2024-11-14",
        items: ["Phone Case"],
        total: 15.99
      }
    }
  }
)
```

```javascript
// Check the update
db.customers.find({ "name": "Emma Wilson" }).pretty()
```

---

### Discussion

**When to Embed vs When to Reference?**

- Embedded orders work great here - why?
- What if a customer had 10,000 orders? Still embed?
- What if multiple customers could share the same order? (e.g., group orders)

!!! note
    MongoDB gives you flexibility - choose based on your query patterns and data size.

---

## Wrap-Up

### What We've Learned

1. **Flexible Schema**: Documents in the same collection can have different fields

2. **Easy CRUD**: Insert, find, update, delete - simple operations

3. **Embedding**: Store related data together without joins

4. **When to Use MongoDB**: 
    - Rapidly changing requirements
    - Varied data structures
    - Read-heavy workloads
    - Horizontal scaling needs

---

## Quick Reference Commands

```javascript
// Database operations
use <database>              // Switch to database
show dbs                    // List databases
db.dropDatabase()           // Delete current database

// Collection operations
show collections           // List collections
db.<collection>.drop()     // Delete collection

// CRUD operations
db.<collection>.insertOne({})                // Insert one document
db.<collection>.find()                       // Find all documents
db.<collection>.find({ field: value })       // Find with filter
db.<collection>.updateOne({}, { $set: {} })  // Update document
db.<collection>.deleteOne({})                // Delete document

// Useful queries
db.<collection>.countDocuments()           // Count documents
db.<collection>.find().pretty()            // Format output nicely
db.<collection>.find().limit(5)            // Limit results
db.<collection>.find().sort({ field: 1 })  // Sort (1=asc, -1=desc)
```

---

## Troubleshooting

**Container not starting?**
```bash
docker logs mongodb
```

**Can't connect to mongo shell?**
```bash
# Check container is running
docker ps

# Restart if needed
docker restart mongodb
```

**Want to start fresh?**
```bash
# Stop and remove container
docker stop mongodb
docker rm mongodb

# Start new container
docker run -d -p 27017:27017 --name mongodb mongo:4.4
```
