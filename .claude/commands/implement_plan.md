---
description: Implement approved technical plans from thoughts/shared/plans/ with phase-by-phase execution
allowed-tools: Read, Grep, Glob, Edit, Write, Bash, Task, TodoWrite, TodoRead
argument-hint: "[path/to/plan.md]"
---

# Implement Plan

You are tasked with implementing an approved technical plan from `thoughts/shared/plans/`. These plans contain phases with specific changes and success criteria.

## Dynamic Context

- Current branch: `!git branch --show-current`
- Git status: `!git status --short`
- Current directory: `!pwd`

## Getting Started

When invoked with a plan path (`$ARGUMENTS`):
- Read the plan at `$ARGUMENTS` completely and check for any existing checkmarks (- [x])
- Read the original ticket and all files mentioned in the plan
- **Read files fully** - never use limit/offset parameters, you need complete context
- Think deeply about how the pieces fit together
- Create a todo list to track your progress
- Start implementing if you understand what needs to be done

If `$ARGUMENTS` is empty, respond with:
```
Please provide the path to the implementation plan:
`/implement_plan thoughts/shared/plans/YYYY-MM-DD-plan-name.md`
```

## Implementation Philosophy

Plans are carefully designed, but reality can be messy. Your job is to:
- Follow the plan's intent while adapting to what you find
- Implement each phase fully before moving to the next
- Verify your work makes sense in the broader codebase context
- Update checkboxes in the plan as you complete sections

When things don't match the plan exactly, think about why and communicate clearly. The plan is your guide, but your judgment matters too.

If you encounter a mismatch:
- STOP and think deeply about why the plan can't be followed
- Present the issue clearly:
  ```
  Issue in Phase [N]:
  Expected: [what the plan says]
  Found: [actual situation]
  Why this matters: [explanation]

  How should I proceed?
  ```

## Verification Approach

After implementing a phase:
- Run `mix check` to verify success criteria
- Fix any issues before proceeding
- Update your progress in both the plan and your todos
- Check off completed items in the plan file:
  - Find the relevant line with `- [ ]`
  - Use Edit to change it to `- [x]`

Don't let verification interrupt your flow - batch it at natural stopping points.

## Sub-task Usage

Use Task agents sparingly:
- When debugging complex failures that require deep investigation
- When exploring unfamiliar code territory mentioned in the plan
- For targeted research on implementation questions

Do NOT spawn sub-tasks for:
- Routine file edits described in the plan
- Standard test execution
- Simple code changes

## If You Get Stuck

When something isn't working as expected:
- First, make sure you've read and understood all the relevant code
- Consider if the codebase has evolved since the plan was written
- Present the mismatch clearly and ask for guidance

## Resuming Work

If the plan has existing checkmarks:
- Trust that completed work is done
- Pick up from the first unchecked item
- Verify previous work only if something seems off

## Command Completion

This command is complete when:
- All phases in the plan have checkmarks (- [x])
- All success criteria have been verified
- Todo list is marked complete
- Final verification: `mix check` passes

Remember: You're implementing a solution, not just checking boxes. Keep the end goal in mind and maintain forward momentum.
