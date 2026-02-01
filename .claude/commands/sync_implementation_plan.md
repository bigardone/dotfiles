# Sync Implementation Plan

You are tasked with synchronizing an implementation plan with the actual codebase, identifying inconsistencies between the plan's code specifications and the implemented code, and updating the plan to reflect reality.

## Current State

Before starting, review the current git state to understand if differences may be due to in-progress work:

```
!git status --short
!git branch --show-current
```

## Initial Response

When this command is invoked:

1. **Check if $ARGUMENTS contains a plan path**:
   - If `$ARGUMENTS` contains a plan path, read `@$ARGUMENTS` immediately and FULLY
   - Begin the sync process

2. **If $ARGUMENTS is empty**, respond with:
```
I'll help you sync an implementation plan with the actual codebase.

Please provide the path to the implementation plan you want to sync.

Example: `/sync_implementation_plan thoughts/shared/plans/2025-01-15-user-auth-refactor.md`

Alternatively, if you've been working on a plan in this conversation, I can use that context.
```

Then wait for the user's input.

## Process Steps

### Step 1: Load and Parse the Implementation Plan

1. **Read the implementation plan FULLY**:
   - Use the Read tool WITHOUT limit/offset parameters
   - **CRITICAL**: Reading the full file ensures you capture all code blocks, file references, and success criteria accurately. Partial reads will cause sync mismatches.
   - Parse the plan structure to identify:
     - All file paths mentioned
     - Code blocks with specific implementations
     - Success criteria (both automated and manual)
     - Phase structure and dependencies

2. **Extract code specifications from the plan**:
   - Identify all code blocks with file path annotations
   - Note the expected file locations
   - Capture the expected code patterns/implementations
   - Track any specific line numbers referenced

3. **Create a sync todo list** to track your progress (use the TaskCreate tool if available, or maintain a mental checklist):
   - Files to check
   - Code blocks to compare
   - Success criteria to verify
   - Update this list as you progress through the sync

### Step 1.5: Create Code Block Inventory

**CRITICAL FOR DIFF DETECTION**: Before checking the codebase, create an explicit inventory of every code block in the plan:

For each code block with a file path annotation:
1. Record the file path
2. Record the line numbers (if specified)
3. Copy the EXACT code content (do not paraphrase)
4. Note what it's supposed to implement

Create a structured inventory:

```
| # | File Path | Lines | Code Block (first line) | Purpose |
|---|-----------|-------|------------------------|---------|
| 1 | lib/auth/token.ex | 45-52 | `def generate_token(user) do` | Token generation |
| 2 | lib/auth/session.ex | 10-30 | `defmodule Session do` | Session module |
```

**You will compare EACH of these against the actual codebase in Step 3.**

This inventory ensures:
- No code blocks are missed during comparison
- You have a systematic checklist to work through
- Differences are tracked consistently

### Step 2: Gather Current Codebase State

**IMPORTANT: For code block comparisons, read files directly - do not delegate to sub-agents.**

1. **Read all referenced files directly** (PRIMARY APPROACH):
   - Read each file mentioned in the plan FULLY using the Read tool
   - This is the primary method for code comparison - you must do this yourself
   - Do NOT delegate code block comparisons to sub-agents (they summarize rather than report exact diffs)

2. **Use sub-tasks only for auxiliary work**:
   - Finding files that may have moved or been renamed
   - Checking test coverage status
   - Verifying integration points across many files
   - **Do NOT use sub-agents for comparing code blocks** - this must be done directly

3. **Verify file existence**:
   - Check that each file in your Code Block Inventory exists
   - Note any files that are missing or have moved
   - Find any new files not in the plan

### Step 3: Perform Direct Code Comparisons

**PRIORITY ORDER**:
1. **FIRST**: Compare all code blocks (this is the primary purpose of sync)
2. **SECOND**: Check file existence/location
3. **THIRD**: Structural/phase inconsistencies

**For EACH code block in your inventory**:

1. Read the actual file at the specified path
2. Locate the corresponding code section (use line numbers if specified, otherwise search for function/module names)
3. Place the plan code and actual code side-by-side mentally
4. Check for differences systematically:
   - **Line-by-line**: Are the lines identical?
   - **Structural**: Are function/module names and signatures the same?
   - **Logic**: Does the implementation achieve the same outcome?
   - **Configuration**: Are values (timeouts, limits, etc.) identical?
5. Document ANY difference, no matter how small

**DO NOT**: Summarize, paraphrase, or describe code in prose
**DO**: Extract and show the actual code snippets in your findings

For code blocks larger than 50 lines:
- Compare function by function
- Note any functions added/removed
- Compare each function's signature, then body

---

**Think deeply about how the pieces fit together.** When you find differences between plan and implementation, consider:
- Was this an intentional design decision made during implementation?
- Did requirements change after the plan was written?
- Is this a bug or oversight that should be flagged?

Categorize findings into:

1. **File-Level Inconsistencies**:
   - Files that don't exist (planned but not created)
   - Files that exist but weren't in the plan (created but undocumented)
   - Files moved to different locations

2. **Code-Level Inconsistencies** (document the EXACT differences, line by line):
   - Implementation differs from plan's code blocks
   - Function signatures changed
   - Additional code added beyond plan scope
   - Code removed or refactored differently

3. **Structural Inconsistencies**:
   - Phase order changed during implementation
   - Features implemented in different phases than planned
   - Dependencies modified

4. **Success Criteria Status**:
   - Which automated criteria can be verified now
   - Which manual criteria have been completed
   - Which criteria are no longer applicable

### Step 4: Present Findings

**MANDATORY REQUIREMENT**: For every code inconsistency, you MUST include:
- The EXACT code block from the plan (copy-paste, not paraphrase)
- The EXACT code from the codebase (copy-paste, not paraphrase)
- Do NOT summarize - show the actual code so the user can see the diff

Present a summary of inconsistencies using this structured format:

```
## Sync Analysis for: [Plan Name]

### Code Block Inventory Checked: [N] blocks compared

### Files Status:
| File | Plan Status | Actual Status | Notes |
|------|-------------|---------------|-------|
| path/to/file.ex | Create | Exists | Matches plan |
| path/to/other.ex | Modify | Modified differently | See details |
| path/to/new.ex | Not in plan | Exists | Added during implementation |

### Code Inconsistencies Found:

#### Mismatch 1: [file_path:line_range]

**Issue in Phase [N]:**
- **Expected (from plan):** [what the plan says]
- **Found (in codebase):** [actual situation]
- **Why this matters:** [explanation of impact]

**Plan specified (EXACT code from plan):**
```elixir
# COPY-PASTE the exact code block from the plan here
# Do not paraphrase or summarize
def example_function(arg) do
  # actual code from plan
end
```

**Actually implemented (EXACT code from codebase):**
```elixir
# COPY-PASTE the exact code from the file here
# Do not paraphrase or summarize
def example_function(arg) do
  # actual code from implementation
end
```

**Line-by-line differences:**
- Line 1: [specific difference]
- Line 3: [specific difference]

**Analysis**: [Brief explanation of what changed and likely why - intentional decision vs oversight]

#### Mismatch 2: [Continue for each inconsistency...]

### Success Criteria Updates:
- [x] Criteria now met: [description]
- [ ] Criteria still pending: [description]
- [~] Criteria modified: [description]

### Questions:
- [Any clarifications needed about intentional vs accidental differences]
```

Update your progress tracking to mark comparison tasks complete.

### Step 5: Update the Plan

After user confirms which changes to incorporate:

1. **Update code blocks** to match actual implementation:
   - Replace outdated code with current implementation
   - Add comments noting when code was synced
   - Preserve the original intent description

2. **Update file references**:
   - Correct any changed file paths
   - Add newly created files to relevant phases
   - Mark removed files appropriately

3. **Update success criteria**:
   - Check off completed automated criteria
   - Note any criteria that need revision
   - Add new criteria discovered during implementation

4. **Add sync metadata** using the format defined in [Sync Metadata Format](#sync-metadata-format):
   - Add the YAML frontmatter block at the top of the plan
   - Note which phases have been implemented
   - Track overall progress

5. **Write the updated plan**:
   - Save to the same location (overwrite)
   - Or create a new version if requested

### Step 6: Present Results

```
## Plan Synced Successfully

**Plan**: [plan path]
**Last synced**: [timestamp]

### Changes Made:
1. Updated [N] code blocks to match implementation
2. Added [N] new files to plan
3. Marked [N] success criteria as complete
4. [Other changes...]

### Implementation Progress:
- Phase 1: [Status - Complete/In Progress/Not Started]
- Phase 2: [Status]
- Phase 3: [Status]

### Next Steps:
- [Remaining work based on updated plan]

Would you like to:
- Review the updated plan
- View a diff of plan changes
- Continue implementing the next phase
- Make additional adjustments
```

Mark all sync tasks complete in your progress tracking.

## Important Guidelines

1. **Preserve Intent**:
   - When updating code blocks, preserve the original explanations
   - Don't remove context about WHY something was planned
   - Add notes about implementation decisions that differed

2. **Be Non-Destructive**:
   - Ask before making significant changes to the plan
   - Offer to create a backup using the naming convention: `{original-name}.backup-{YYYY-MM-DD}.md`
   - Highlight potentially intentional deviations

3. **Track Progress Accurately**:
   - Only mark criteria complete if actually verified
   - Be conservative about phase completion status
   - Note partial implementations clearly
   - Maintain progress tracking throughout the sync process

4. **Maintain Plan Quality**:
   - Keep the same structure and formatting
   - Ensure updated code blocks are syntactically correct
   - Verify file paths are accurate

5. **Handle Edge Cases**:
   - If plan references deleted files, ask about intent
   - If major architectural changes occurred, suggest plan restructuring
   - If implementation scope expanded, capture the additions

6. **Verify Before Trusting**:
   - Always verify sub-task results by reading files yourself
   - If something seems wrong, investigate further
   - Cross-reference multiple sources when uncertain

## Sync Metadata Format

Add this YAML frontmatter block at the top of synced plans:

```yaml
---
last_synced: YYYY-MM-DD HH:MM
sync_status: in_progress | complete
implemented_phases: [1, 2]
pending_phases: [3, 4]
---
```

This metadata should be referenced when updating plans in Step 5.

## Example Interaction Flow

```
User: /sync_implementation_plan thoughts/shared/plans/2025-01-15-user-auth-refactor.md
Assistant: Let me read that plan file completely first...

[Reads the full plan file]

I have loaded the implementation plan for the user-auth-refactor. I found 5 code blocks to compare.

**Code Block Inventory:**
| # | File Path | Lines | Code Block (first line) | Purpose |
|---|-----------|-------|------------------------|---------|
| 1 | apps/core/lib/core/auth/token.ex | 45-52 | `def generate_token(user)` | Token generation |
| 2 | apps/core/lib/core/auth/session.ex | 10-30 | `defmodule Session` | Session module |
| ... | ... | ... | ... | ... |

Now let me read each file directly to compare against the plan...

[Reads apps/core/lib/core/auth/token.ex]
[Reads apps/core/lib/core/auth/session.ex]
[Reads other referenced files]

Based on my direct comparison of each code block, here is the sync report:

## Sync Analysis for: User Auth Refactor

### Files Status:
| File | Plan Status | Actual Status | Notes |
|------|-------------|---------------|-------|
| apps/core/lib/core/auth/session.ex | Create | Exists | Matches plan |
| apps/core/lib/core/auth/token.ex | Modify | Modified differently | See Mismatch 1 |
| apps/core/lib/core/auth/helpers.ex | Not in plan | Exists | Added during implementation |

### Code Inconsistencies Found:

#### Mismatch 1: apps/core/lib/core/auth/token.ex:45-52

**Issue in Phase 2:**
- **Expected (from plan):** Token expiry set to 24 hours
- **Found (in codebase):** Token expiry set to 1 hour
- **Why this matters:** Affects user session duration

**Plan specified (EXACT):**
```elixir
def generate_token(user) do
  Token.sign(%{user_id: user.id}, expires_in: 86400)  # 24 hours
end
```

**Actually implemented (EXACT):**
```elixir
def generate_token(user) do
  Token.sign(%{user_id: user.id}, expires_in: 3600)  # 1 hour
end
```

**Line-by-line differences:**
- Line 2: `expires_in: 86400` changed to `expires_in: 3600`

**Analysis:** Likely intentional security hardening - shorter token lifetime.

[... continues with detailed analysis ...]

Do you want me to update the plan with these findings?

User: Yes, update the plan to match the implementation
Assistant: I will update the plan now. Let me:
1. Update the token.ex code block to reflect the 1-hour expiry
2. Add the new helpers.ex file to Phase 2
3. Add sync metadata to the plan

[Updates the plan file]

## Plan Synced Successfully

**Plan**: thoughts/shared/plans/2025-01-15-user-auth-refactor.md
**Last synced**: 2025-01-20 14:30

### Changes Made:
1. Updated 1 code block to match implementation (token expiry)
2. Added 1 new file to plan (helpers.ex)
3. Marked 3 success criteria as complete

### Implementation Progress:
- Phase 1: Complete
- Phase 2: In Progress
- Phase 3: Not Started

Do you want to review the updated plan or continue with the next phase?
```

## Sub-task Spawning Best Practices

**CRITICAL: Code block comparisons must be done directly by YOU, not delegated to sub-agents.**

Sub-agents summarize findings rather than reporting exact diffs, which defeats the purpose of sync. Only use sub-tasks for auxiliary work.

When spawning research sub-tasks for sync:

1. **Use sub-tasks ONLY for**:
   - Finding files that may have moved or been renamed
   - Checking test coverage status
   - Verifying integration points across many files
   - Finding new files not mentioned in the plan

2. **NEVER delegate to sub-tasks**:
   - Code block comparisons (do this yourself by reading files)
   - Determining if code matches the plan (sub-agents will summarize, not diff)

3. **Example appropriate task prompts**:

```
# For codebase-locator (APPROPRIATE USE):
"Find all files in apps/core/lib/core/auth/ directory.
I need to know if any files have moved or if there are new files not in my list:
- apps/core/lib/core/auth/session.ex
- apps/core/lib/core/auth/token.ex
Just list the files found - I will compare code myself."

# For test coverage check (APPROPRIATE USE):
"Check if there are test files for the auth module.
Look for files matching apps/core/test/**/auth*_test.exs"
```

4. **After sub-tasks complete**, read the actual files yourself to perform code comparisons
5. **Never accept sub-agent summaries** as definitive for code differences
