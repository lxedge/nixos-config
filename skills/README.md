# Skills

Personal collection of Claude Code skills for work.

## Available Skills

### diff-to-sop
Convert git diffs into step-by-step SOPs with modified files, functions, and minimal code blocks for future integrations.

**When to use:**
- After merging a new blockchain or service integration
- Need a reusable SOP for future integrations
- Want to document changes without reading all source code

**How to use:**

Skills are invoked in Claude Code using the Skill tool or by mentioning them in conversation:
```
Use the diff-to-sop skill on the latest commit
```

Or pass the diff to Claude:
```
git diff -U10 master..feature | claude -p "Use diff-to-sop skill. Output with chinese into a markdown file"
```

Claude Code will automatically load the skill and execute its workflow.

**Known Issue:**

- The model maybe reject serve if the diff is too large.
