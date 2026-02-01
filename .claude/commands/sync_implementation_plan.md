---
description: Sync implementation plan with actual codebase, identify code inconsistencies, and update plan to reflect reality
argument-hint: <plan-file-path>
allowed-tools: [Read, Write, Edit, Grep, Glob, Task, TaskCreate, TaskUpdate, TaskList, TaskGet, Bash(git status:*), Bash(git branch:*)]
model: opus
---

<context>
Current git state:
!`git status --short`
Current branch:
!`git branch --show-current`
</context>

<objective>
Synchronize an implementation plan with the actual codebase by comparing every code block in the plan against implemented code, reporting exact diffs, and updating the plan after user confirmation.

If `$ARGUMENTS` is provided, treat it as the plan file path and read @$ARGUMENTS immediately.
If `$ARGUMENTS` is empty, ask the user for the plan file path.
</objective>

<process>

1. **Load and parse the plan FULLY** using Read without limit/offset. Extract:
   - All file paths mentioned
   - Code blocks with file path annotations
   - Success criteria (automated and manual)
   - Phase structure and dependencies

2. **Create a code block inventory** before checking the codebase. For each code block with a file path annotation, record: file path, line numbers, exact code content, and purpose. Track this as a structured list.

3. **Read all referenced files directly** - do NOT delegate code comparisons to sub-agents. Sub-agents summarize rather than report exact diffs. Only use sub-tasks for auxiliary work:
   - Finding files that may have moved or been renamed
   - Checking test coverage status
   - Verifying integration points across many files

4. **Compare each code block** against the actual codebase in priority order:
   - FIRST: Compare all code blocks line-by-line
   - SECOND: Check file existence/location
   - THIRD: Structural/phase inconsistencies
   - Categorize findings as: file-level, code-level, structural, or success criteria

5. **Present findings** with EXACT code from both plan and codebase (copy-paste, never paraphrase). Use this format for each mismatch:
   - File path and line range
   - Phase where it appears
   - Exact plan code block
   - Exact codebase code block
   - Line-by-line differences
   - Analysis: intentional decision vs oversight

6. **After user confirms changes**, update the plan:
   - Replace outdated code blocks with current implementation
   - Correct changed file paths and add new files
   - Update success criteria
   - Add sync metadata YAML frontmatter:
     ```yaml
     ---
     last_synced: YYYY-MM-DD HH:MM
     sync_status: in_progress | complete
     implemented_phases: [1, 2]
     pending_phases: [3, 4]
     ---
     ```
   - Present a summary of changes made and implementation progress

</process>

<guidelines>
- **Preserve intent**: Keep original explanations and context about WHY something was planned
- **Be non-destructive**: Ask before significant changes; offer backups as `{name}.backup-{YYYY-MM-DD}.md`
- **Track progress accurately**: Only mark criteria complete if verified; be conservative about phase completion
- **Handle edge cases**: Ask about deleted files, suggest restructuring for major architectural changes, capture scope expansions
- **Verify before trusting**: Always verify sub-task results by reading files yourself
</guidelines>

<success_criteria>
- Every code block in the plan has been compared against the actual codebase
- All differences are reported with exact code snippets (not summaries)
- User has confirmed which changes to incorporate
- Plan is updated with current implementation and sync metadata
</success_criteria>
