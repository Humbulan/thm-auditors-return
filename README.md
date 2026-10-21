# The Auditor's Return

You are a security auditor for Humbu Wandeme Trading Enterprise. 
The previous auditor was fired after claiming they "fixed" the company's vulnerable web app (DSVW). 

You have been given access to two servers:
- **Target (Vulnerable):** `http://<IP>:65412`
- **Secure (Patched):** `http://<IP>:65413`

Your mission is to prove the old auditor wrong by exploiting the original server, and prove the new patches work by testing the secure server.

## Challenges

### 1. The File Reader (Easy)
The `path` parameter on the vulnerable server allows reading files. 
**Task:** Read the `/etc/passwd` file from the vulnerable server (Port 65412).
**Task 2:** Try the exact same payload on the secure server (Port 65413). Does it work?

### 2. The Login Bypass (Medium)
The `/login` endpoint on the vulnerable server is susceptible to SQL Injection in the password field.
**Task:** Bypass the login and find the hidden `THM{...}` flag in the response.
**Task 2:** Why does the secure server reject the same payload?

### 3. The XPath Leak (Medium)
The `name` parameter uses XPath. The vulnerable server concatenates the input directly into the query.
**Task:** Extract the surname of the hidden user.
