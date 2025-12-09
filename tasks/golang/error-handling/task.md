# Error Handling Audit

The primary goal of this error handling audit is to review and improve error handling patterns throughout the Go codebase.

Workflow:

- Read the README.md for project context
- Read all *.go files (ignore the ./reference/ directory)
- Analyse error handling using the criteria below
- Focus on consistency and best practices

Outcome:

- Once the audit is complete, document all findings in a new document named PROJECT-error-handling-rectification.md
- This document is a stand-alone rectification project to be carried out at a later date
- Prioritise findings by impact: Critical, High, Medium, Low
- Include specific code examples and fix recommendations

Notes:

- Go's explicit error handling is a feature, not a burden
- Good error handling helps with debugging and user experience
- Consistency in patterns makes code easier to maintain

---

## 1. Unchecked Errors

Find errors that are ignored or discarded.

- Blank Identifier: Find uses of `_ = FunctionReturningError()`.
- Missing Checks: Find calls where error return is not captured.
- Deferred Errors: Are errors from deferred Close() calls handled?
- Critical vs Non-Critical: Some ignored errors may be intentional; assess context.
- Linter Alignment: Results should align with `errcheck` linter.

---

## 2. Error Wrapping

Review how errors are wrapped with context.

- Context Addition: Are errors wrapped with `fmt.Errorf("context: %w", err)`?
- Meaningful Context: Does the context help identify where the error occurred?
- Chain Preservation: Is the original error preserved for `errors.Is/As`?
- Over-Wrapping: Are errors wrapped too many times, creating noise?
- Consistent Pattern: Is the wrapping style consistent throughout?

---

## 3. Error Creation

Review how errors are created.

- Sentinel Errors: Are reusable errors defined as package-level variables?
- Error Naming: Do error variables follow `ErrXxx` convention?
- Custom Types: Are custom error types used where appropriate?
- Error Messages: Are messages clear, lowercase, and without punctuation?
- Actionable: Do error messages help users understand what to do?

---

## 4. Error Checking

Review how errors are checked.

- errors.Is(): Used for sentinel error comparison (not `==`).
- errors.As(): Used for type assertion on wrapped errors.
- String Matching: Avoid checking error strings; use Is/As instead.
- Nil Checks: Is `err != nil` used consistently?
- Early Returns: Are error checks followed by early returns?

---

## 5. Panic Usage

Review use of panic in the codebase.

- Appropriate Use: Panic should only be for truly unrecoverable situations.
- Initialization: Panics during init may be acceptable for configuration errors.
- Public API: Public functions should return errors, not panic.
- Recovery: Is recover() used appropriately where panics might occur?
- Documentation: Are panic conditions documented?

---

## 6. Error Types

Review custom error types.

- Error Interface: Do custom types implement `Error() string`?
- Unwrap Method: Do wrapped errors implement `Unwrap() error`?
- Is Method: Is `Is(target error) bool` implemented where needed?
- As Support: Are types compatible with `errors.As()`?
- Additional Context: Do custom types carry useful additional data?

---

## 7. Error Handling in Goroutines

Review error handling in concurrent code.

- Channel Errors: Are errors communicated via channels or result structs?
- Error Groups: Is `errgroup` used for managing goroutine errors?
- Lost Errors: Are errors from goroutines captured and not lost?
- Panic Recovery: Are panics in goroutines recovered?
- Context Cancellation: Are context errors handled appropriately?

---

## 8. HTTP and API Errors

Review error handling in HTTP handlers.

- Status Codes: Are appropriate HTTP status codes returned?
- Error Responses: Are error responses consistent and structured?
- Internal Errors: Are internal details hidden from external users?
- Logging: Are server errors logged with sufficient context?
- Client Errors: Are 4xx vs 5xx errors distinguished correctly?

---

## 9. Resource Cleanup on Error

Review cleanup in error paths.

- Defer Usage: Are cleanup functions deferred immediately after resource acquisition?
- Partial Cleanup: Is cleanup correct when errors occur mid-function?
- Transaction Rollback: Are database transactions rolled back on error?
- File Handles: Are files closed on all error paths?
- Connection Cleanup: Are network connections properly closed?

---

## 10. Error Logging

Review how errors are logged.

- Log Once: Are errors logged only once, not at every level?
- Context in Logs: Do logs include enough context to debug?
- Structured Logging: Are errors logged with structured fields?
- Log Levels: Are appropriate log levels used (error vs warn)?
- Stack Traces: Are stack traces available for unexpected errors?
