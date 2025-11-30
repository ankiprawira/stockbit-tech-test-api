# Stockbit Tech Test API Automation

This repository contains the **API automation test project** for the Stockbit technical test.  
The project uses **Java**, **Maven**, and **Karate Framework** for testing RESTful APIs.

---

## 📦 Tech Stack & Tools Required

Before running the project, ensure the following tools are installed:

### 1. **Java Development Kit (JDK) 11+**
Check installation:
```bash
java -version
```

### 2. **Apache Maven**
Check installation:
```bash
mvn -version
```

### 3. **Karate Framework**
Karate will be fetched automatically through Maven dependencies.

---

## 📁 Project Structure

```
src
└── test
    ├── java
    │   └── runners
    │       ├── TestRunner.java
    │       ├── karate-config.js
    └── resources
        └── companies
            ├── companies-client.feature
            ├── companies-tests.feature
            └── schema
```

---

## ⚙️ Project Setup

### 1. Clone the repository
```bash
git clone https://github.com/ankiprawira/stockbit-tech-test-api.git
cd stockbit-tech-test-api
```

### 2. Install Maven dependencies
```bash
mvn clean install
```

---

## ▶️ Running the Tests

Run all tests:
```bash
mvn test
```
---

## 📄 Test Reports

After execution, reports will be generated in:

```
target/karate-reports/
```

Open the HTML report:
```
target/karate-reports/karate-summary.html
```

---

## 🧪 Test Scenario

This API automation covers:

1. **Default request**
   - Validates `status`, `code`, and that `total` equals the number of returned items
   - Validates the structure of the first item using:
     - `company-schema.json`
     - `address-schema.json`
     - `contact-schema.json`
     - `contact-address-schema.json`

2. **Quantity parameter**
   - Confirms `_quantity` controls the number of results
   - Tested with: **1**, **5**, **10**
   - First item validated with `company-schema.json`

3. **Locale parameter**
   - Ensures the `locale` value is reflected in the response
   - Validates structure of the first item

4. **Seed parameter**
   - Verifies deterministic results for the same `seed`
   - Checks that the first object is identical across different quantities
   - Validates structure of the first item using all related schemas

---
