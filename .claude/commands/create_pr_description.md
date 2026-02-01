# Create PR description

You are tasked with generating a pull request description for the current branch changes using the provided template format. The output should be copy-pasteable and ready for immediate use.

## Initial Response

When this command is invoked, if the prompt is empty respond with:
```
I'll generate a PR description for your current branch changes. Let me analyze the changes and gather context from related research and implementation plans.
```

Then immediately begin the analysis process.

## Process Steps

### Step 1: Analyze Current Changes

1. **Get current git status and changes**:
   - Run `git status` to see staged/unstaged changes
   - Run `git diff --cached` to see staged changes
   - Run `git diff` to see unstaged changes
   - Run `git diff --name-only --cached` and `git diff --name-only` to list changed files quickly
   - Run `git log --oneline -10` to see recent commits
   - Run `git branch --show-current` to get current branch name
   - **Note**: You do not need to cd into the project since you are already in it

2. **Identify changed files and their types**:
   - Categorize changes (new features, bug fixes, refactoring, dependencies, tests, etc.)
   - Note file paths and line counts
   - Identify any new files, deleted files, or major modifications

### Step 2: Gather Context from Thoughts Directory

1. **Search for related research and plans**:
   - Look for research documents in `thoughts/shared/research/` that might be related to these changes
   - Look for implementation plans in `thoughts/shared/plans/` that might be related
   - Check for any recent work that might provide context

2. **Read relevant context files**:
   - Read any research documents that seem related to the changes
   - Read any implementation plans that might be relevant

### Step 3: Analyze Changes in Detail

1. **For each significant change**:
   - Understand what was added, modified, or removed
   - Identify the purpose and impact
   - Note any patterns or conventions followed
   - Check for test coverage or documentation updates

2. **Categorize changes by type**:
   - New features or functionality
   - Bug fixes or improvements
   - Refactoring or code cleanup
   - Dependency updates
   - Test enhancements
   - Documentation updates
   - Configuration changes

### Step 4: Generate PR Description

1. **Use this template format** 

```markdown
### What?

1. [Brief description of change 1];
2. [Brief description of change 2];
3. [Brief description of change 3];
4. [Brief description of change 4].

### Why?

- (1) [Reason for change 1];
- (2) [Reason for change 2];
- (3) [Reason for change 3];
- (4) [Reason for change 4].

### How

- [ ] [Specific implementation detail 1];
- [ ] [Specific implementation detail 2];
- [ ] [Specific implementation detail 3].
```

2. **Fill in the template with actual changes**:
   - **What?**: List the main changes in numbered format
   - **Why?**: Provide business context and reasoning, including Basecamp links if found in research/plans
   - **How?**: List specific implementation details and technical changes
   - **Screenshots & Demo**: Keep the placeholder or replace with actual screenshots if available

3. **Ensure the description is**:
   - Concise but informative
   - Technically accurate
   - Ready for copy-paste
   - Follows the template format exactly

### Step 5: Output Only the PR Description

**CRITICAL**: Output ONLY the formatted PR description and nothing else. No explanations, no additional text, and do not wrap it in code fences. The output should be directly copy‑pasteable into a GitHub PR description field.
## Important Guidelines

1. **Be Accurate**:
   - Base descriptions on actual code changes, not assumptions
   - Verify technical details by examining the actual changes
   - Use specific file names and change types

2. **Be Concise**:
   - Keep descriptions brief but informative
   - Focus on the most important changes
   - Avoid unnecessary technical jargon

3. **Be Consistent**:
   - Follow the template format exactly
   - Use consistent numbering and formatting
   - Match the style of the provided template

4. **Include Context**:
   - Reference Basecamp tickets or research documents when available
   - Provide business reasoning for changes
   - Link to related work when possible

5. **Output Format**:
   - Output ONLY the PR description
   - No additional commentary or explanations
   - Ready for immediate copy-paste use

## Template Reference

The command uses the template from `.github/PULL_REQUEST_TEMPLATE.md` which includes:

- **:fish: What?** - List of changes
- **:fishing_pole_and_fish: Why?** - Business context and reasoning
- **:fish_cake: How** - Implementation details
- **:whale: Screenshots & Demo** - Visual evidence

## Example Output

```markdown
### :fish: What?

1. Added user authentication middleware;
2. Updated database schema for user profiles;
3. Enhanced error handling in API endpoints;
4. Added comprehensive test coverage.

### :fishing_pole_and_fish: Why?

- (1) Part of [To-do 1234](https://3.basecamp.com/4038495/buckets/XXXX/todos/1234);
- (2) Part of [Requirements 5678](https://3.basecamp.com/4038495/buckets/XXXX/messages/5678);
- (3) and (4) are QoL improvements.

### :fish_cake: How

- [ ] added JWT token validation in auth middleware;
- [ ] created user_profiles table migration;
- [ ] implemented error response standardization;
- [ ] added unit tests for all new functionality.
```

IMPORTANT: remember to include the markdown quotes in the output, since the output client lets us easily copy the quote as a snippet.
