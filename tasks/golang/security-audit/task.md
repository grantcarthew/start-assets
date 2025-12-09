# Security Audit

The primary goal of this security audit task is to identify vulnerabilities, security weaknesses, and potential attack vectors in the Go codebase.

Workflow:

- Read all the following documents if they exist:
  - README.md
  - docs/security.md
  - SECURITY.md
- Read all the *.go files (ignore the ./reference/ directory)
- Analyse the code using the security topics below

Outcome:

- Once the audit is complete, document all findings in a new document named PROJECT-security-audit-rectification.md
- This document is a stand-alone rectification project to be carried out at a later date
- Prioritise findings by severity: Critical, High, Medium, Low
- Include remediation recommendations for each finding

Notes:

- Focus on OWASP Top 10 vulnerabilities where applicable
- Consider both internal and external attack surfaces
- Flag any hardcoded secrets or credentials immediately

---

## 1. Input Validation and Injection

Check for vulnerabilities related to untrusted input.

- SQL Injection: Are database queries parameterized? Never use string concatenation for SQL.
- Command Injection: Is `os/exec` used safely? Are user inputs sanitized before shell execution?
- Path Traversal: Are file paths validated? Check for `../` sequences in user input.
- Template Injection: Are `html/template` and `text/template` used correctly?
- LDAP/XML Injection: If applicable, are inputs properly escaped?

---

## 2. Authentication and Authorization

Review access control mechanisms.

- Authentication: Are passwords hashed with bcrypt or argon2? Never use MD5/SHA1 for passwords.
- Session Management: Are session tokens cryptographically random? Check token expiry.
- Authorization: Is there proper access control on all endpoints? Check for IDOR vulnerabilities.
- JWT: If used, is the signature verified? Are algorithms restricted (no "none")?
- API Keys: Are they properly scoped and rotated?

---

## 3. Cryptography

Evaluate cryptographic implementations.

- TLS: Is TLS 1.2+ enforced? Are certificates validated?
- Random Numbers: Is `crypto/rand` used instead of `math/rand` for security purposes?
- Encryption: Are strong algorithms used (AES-256, ChaCha20)?
- Key Management: Are keys stored securely? Not hardcoded or in version control?
- Hashing: Are appropriate algorithms used for the purpose (bcrypt for passwords, SHA-256 for integrity)?

---

## 4. Sensitive Data Exposure

Check for data leakage risks.

- Logging: Are sensitive values (passwords, tokens, PII) excluded from logs?
- Error Messages: Do errors expose internal details to users?
- Memory: Are sensitive values zeroed after use? Check for secrets in core dumps.
- HTTP Headers: Are security headers set (X-Content-Type-Options, X-Frame-Options)?
- HTTPS: Is all sensitive data transmitted over TLS?

---

## 5. Dependency Vulnerabilities

Assess third-party package risks.

- Known Vulnerabilities: Run `govulncheck` or check against vulnerability databases.
- Outdated Dependencies: Are dependencies up to date?
- Minimal Dependencies: Are unnecessary dependencies included?
- License Compliance: Are dependency licenses compatible with the project?

---

## 6. Race Conditions and Concurrency

Identify thread-safety issues with security implications.

- Data Races: Could race conditions lead to security bypasses?
- TOCTOU: Are there time-of-check-time-of-use vulnerabilities in file operations?
- Mutex Usage: Are critical sections properly protected?
- Atomic Operations: Are shared counters and flags handled atomically?

---

## 7. Resource Management

Check for denial-of-service vulnerabilities.

- Rate Limiting: Are endpoints protected against abuse?
- Timeouts: Are all network operations bounded by timeouts?
- Memory Limits: Can user input cause excessive memory allocation?
- File Handles: Are resources properly closed to prevent exhaustion?
- Goroutine Leaks: Can attackers spawn unbounded goroutines?

---

## 8. Configuration and Deployment

Review security posture of configuration.

- Default Credentials: Are default passwords changed?
- Debug Mode: Is debug/development mode disabled in production?
- Environment Variables: Are secrets properly managed via environment or secret stores?
- File Permissions: Are config files appropriately restricted?
- CORS: Is Cross-Origin Resource Sharing properly configured?

---

## 9. Logging and Monitoring

Assess security observability.

- Audit Logging: Are security-relevant events logged (auth failures, privilege changes)?
- Log Integrity: Are logs protected from tampering?
- Alerting: Are critical security events triggering alerts?
- Log Retention: Are logs retained for incident investigation?

---

## 10. Go-Specific Security

Check for Go language-specific issues.

- unsafe Package: Is `unsafe` used? If so, is it justified and reviewed?
- cgo: Are C bindings introducing vulnerabilities?
- Reflection: Is `reflect` used safely without exposing internals?
- Integer Overflow: Are integer operations checked for overflow in security contexts?
- Nil Pointer: Could nil pointer dereferences cause security issues?
