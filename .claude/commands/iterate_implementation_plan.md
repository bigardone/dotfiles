---
description: Update existing implementation plans based on user feedback with skeptical research and precise edits
argument-hint: [plan-file-path] [feedback]
allowed-tools: Task, Read, Edit, Write, Glob, Grep, AskUserQuestion
model: opus
---

<objective>
Update an existing implementation plan at `$1` based on user feedback: $ARGUMENTS

Be skeptical, thorough, and ensure changes are grounded in actual codebase reality. Make surgical edits — not wholesale rewrites.
</objective>

<context>
Plan file: @$1
Recent plans: !`ls -lt thoughts/shared/plans/ 2>/dev/null | head -5`
</context>

<initial-response>
Handle input scenarios:

**If NO plan file provided ($1 is empty)**:
Ask: "Which plan would you like to update? Provide the path (e.g., `thoughts/shared/plans/2025-10-16-feature.md`). Tip: recent plans listed above."
Wait for user input, then continue.

**If plan file provided but NO feedback**:
Read the plan fully, then ask: "What changes would you like to make?" with examples:
- "Add a phase for migration handling"
- "Update success criteria to include performance tests"
- "Split Phase 2 into two separate phases"
Wait for user input.

**If BOTH plan file AND feedback provided**:
Proceed immediately to the process steps.
</initial-response>

<process>
## Step 1: Read and Understand Current Plan

1. Read the existing plan file COMPLETELY (no limit/offset parameters)
2. Understand current structure, phases, scope, and success criteria
3. Parse what the user wants to add/modify/remove
4. Determine if changes require codebase research

## Step 2: Research If Needed

Only spawn research tasks if changes require new technical understanding.

**Research IS needed when:**
- Adding new phases referencing unfamiliar code areas
- Changing technical approach
- User requests involve code not already covered in the plan
- Validating feasibility of significant scope changes

**Research is NOT needed when:**
- Rewording or clarifying existing content
- Splitting existing phases into smaller steps
- Updating scope with already-known components
- Fixing formatting or restructuring existing content

When research is needed, spawn parallel sub-tasks:

- `subagent_type: "codebase-locator"` — find relevant files
- `subagent_type: "codebase-analyzer"` — understand implementation details
- `subagent_type: "codebase-pattern-finder"` — find similar patterns
- `subagent_type: "thoughts-locator"` — find related research/decisions

Be EXTREMELY specific in prompts: include full path context, exactly what to search for, which directories to focus on, and request file:line references.

Wait for ALL sub-tasks to complete before proceeding.

## Step 3: Present Understanding and Approach

Before making changes, confirm understanding with the user:
- What you understand they want changed
- What research found (if any)
- What specific modifications you plan to make

Get user confirmation before proceeding.

## Step 4: Update the Plan

1. **Make focused, precise edits**:
   - Use Edit for surgical changes (single sections, small updates)
   - Use Write for larger restructuring (reordering phases, major rewrites)
   - Maintain existing structure unless explicitly changing it
   - Keep all file:line references accurate
   - Update success criteria if needed

2. **Ensure consistency**:
   - New phases follow existing patterns
   - Scope changes update "What We're NOT Doing" section
   - Approach changes update "Implementation Approach" section
   - Maintain automated vs manual success criteria distinction

3. **Preserve quality**:
   - Include specific file paths and line numbers
   - Write measurable success criteria
   - Use `make` commands for automated verification
   - Keep language clear and actionable

## Step 5: Present Changes

Show the user:
- What file was updated
- Specific changes made
- Key improvements to the plan
- Offer further adjustments
</process>

<constraints>
- **Be skeptical**: Don't blindly accept problematic requests. Question vague feedback. Verify technical feasibility. Point out conflicts with existing phases.
- **Be surgical**: Precise edits, not wholesale rewrites. Preserve good content. Only research what's necessary. Don't over-engineer.
- **Be interactive**: Confirm understanding before changes. Show planned modifications. Allow course corrections. Communicate during research.
- **No open questions**: If a change raises questions, ASK immediately. Do NOT update the plan with unresolved questions. Every change must be complete and actionable.
- **Handle problems**: If an update breaks coherence, revert and discuss. Don't compound errors. When unsure, show what went wrong and ask.
</constraints>

<success_criteria>
When updating success criteria in plans, maintain two categories:

1. **Automated Verification** (runnable by execution agents): commands like `make test`, file existence checks, compilation/type checking
2. **Manual Verification** (requires human): UI/UX, real-world performance, hard-to-automate edge cases, user acceptance
</success_criteria>
