# Test Generation

The primary goal of this task is to generate tests for the Go codebase based on the custom instructions provided.

Workflow:

- Read the README.md for project context
- Read the relevant *.go files specified in the custom instructions
- Understand the functions and types that need tests
- Write tests following Go testing conventions and project patterns

Outcome:

- Create or update *_test.go files with new tests
- Ensure all tests pass with `go test ./...`
- Run tests with race detector: `go test -race ./...`
- Aim for meaningful coverage of the specified code

Notes:

- Follow existing test patterns in the project
- Focus on behavior, not implementation details
- Include both positive and negative test cases
- Use table-driven tests where appropriate

---

## 1. Unit Tests

Write focused tests for individual functions.

- Function Coverage: Test each exported function.
- Input Validation: Test with valid and invalid inputs.
- Edge Cases: Test boundary conditions and edge cases.
- Error Paths: Test error conditions and error messages.
- Zero Values: Test behavior with zero values and nil.

---

## 2. Table-Driven Tests

Use table-driven tests for functions with multiple scenarios.

- Test Cases: Define clear test case structs.
- Naming: Give each test case a descriptive name.
- Inputs and Outputs: Clearly separate inputs from expected outputs.
- Subtests: Use `t.Run()` for each test case.
- Parallel: Consider `t.Parallel()` for independent tests.

Example structure:

```go
tests := []struct {
    name    string
    input   InputType
    want    OutputType
    wantErr bool
}{
    {"valid input", validInput, expectedOutput, false},
    {"empty input", emptyInput, zeroOutput, true},
}

for _, tt := range tests {
    t.Run(tt.name, func(t *testing.T) {
        got, err := FunctionUnderTest(tt.input)
        // assertions
    })
}
```

---

## 3. Integration Tests

Test interactions between components.

- Component Interaction: Test how units work together.
- Real Dependencies: Use real implementations where practical.
- Database Tests: Use test databases or transactions that rollback.
- API Tests: Test HTTP handlers with httptest.
- Build Tags: Use build tags to separate integration tests if needed.

---

## 4. Test Fixtures and Helpers

Create reusable test utilities.

- Test Helpers: Create helper functions for common setup.
- t.Helper(): Mark helper functions with `t.Helper()`.
- Fixtures: Use testdata/ directory for test files.
- Cleanup: Use `t.Cleanup()` for resource cleanup.
- Temporary Files: Use `t.TempDir()` for temp directories.

---

## 5. Mocking and Fakes

Create test doubles for dependencies.

- Interfaces: Mock interface implementations.
- Minimal Mocks: Only implement methods needed for the test.
- Fake Implementations: Create simple in-memory fakes for complex dependencies.
- Avoid Over-Mocking: Prefer real implementations when practical.
- Generated Mocks: Consider tools like gomock or mockery for complex interfaces.

---

## 6. Error Testing

Thoroughly test error conditions.

- Error Returns: Verify errors are returned when expected.
- Error Types: Use `errors.Is()` and `errors.As()` for checking.
- Error Messages: Verify error messages are helpful.
- Wrapped Errors: Check error chains are preserved.
- Panic Recovery: Test panic conditions if applicable.

---

## 7. Concurrency Tests

Test concurrent behavior.

- Race Detector: Run all tests with `-race`.
- Goroutine Safety: Test concurrent access to shared state.
- Channel Behavior: Test channel send/receive patterns.
- Deadlock Detection: Ensure tests don't hang.
- Stress Testing: Consider high-concurrency scenarios.

---

## 8. Benchmark Tests

Write performance benchmarks for critical code.

- Benchmark Functions: Use `func BenchmarkXxx(b *testing.B)`.
- Reset Timer: Use `b.ResetTimer()` after setup.
- Report Allocations: Use `b.ReportAllocs()` for memory analysis.
- Sub-Benchmarks: Use `b.Run()` for benchmark variations.
- Realistic Data: Benchmark with realistic data sizes.

---

## 9. Example Tests

Create executable documentation.

- Example Functions: Use `func ExampleXxx()`.
- Output Comments: Include `// Output:` for verification.
- Documentation: Examples appear in godoc.
- Working Code: Ensure examples compile and run.
- Progressive Complexity: Start simple, add complex examples.

---

## 10. Test Quality

Ensure tests are maintainable.

- Clear Assertions: Use clear, specific assertions.
- One Concept Per Test: Test one thing at a time.
- Test Names: Use descriptive test names.
- No Test Logic: Avoid complex logic in tests.
- Deterministic: Tests should not be flaky.
- Fast: Unit tests should run quickly.
