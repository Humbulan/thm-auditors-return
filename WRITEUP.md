# The Auditor's Return - Official Write-up

## Task 1: The File Reader
The vulnerable server (DSVW) uses the `path` parameter to read files but fails to validate URI schemes.
By passing a `file://` scheme to the path, we can bypass the directory restriction and read local files.

**Payload:** `https://auditor.humbuskim.dpdns.org/?path=file:///etc/passwd`
*(If using the local machine: `http://MACHINE_IP:65412/?path=file:///etc/passwd`)*

**Answer 1:** `root`
**Answer 2:** `N` (The secure server DSSW blocks this by returning "Scheme not allowed").

## Task 2: The Login Bypass
The vulnerable server uses string concatenation for the login query, making it susceptible to SQL Injection in the password field.

**Payload:** 
Navigate to the `/login` endpoint and use:
Username: `admin`
Password: `' OR '1'='1`

This evaluates the query to TRUE, bypassing authentication. The response contains the flag.

**Answer:** `THM{sqli_in_password_field}`

## Task 3: The XPath Leak
The `name` parameter is vulnerable to XPath injection because user input is concatenated directly into the query: `.//user[name/text()='%s']`.

We can inject a logical OR condition to target the hidden user named 'previous'.

**Payload:** `https://auditor.humbuskim.dpdns.org/?name=admin' or name/text()='previous`

This extracts the surname of the hidden user, which contains the flag.

**Answer:** `THM{xpath_needs_variable_binding}`
