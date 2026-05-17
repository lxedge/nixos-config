---
name: diff-to-sop
description: Use when you want to convert a git diff into a step-by-step SOP including modified files, functions, and minimal code blocks for future integrations
---

# Diff to SOP Skill

## Overview
Transform a git diff into a short, actionable SOP. Captures files, functions, and code blocks. Enables future integrators to follow changes without reading all source code.

---

## When to Use
- After merging a new blockchain or service integration
- Want a reusable SOP for future integrations
- Do NOT use for generic diffs unrelated to operational steps

---

## Core Pattern

1. **Extract Modified Files**
- Identify all files with changes
- List file paths in the SOP

2. **Identify Changed Functions**
- Parse diff hunks to detect modified/added functions
- Include function signatures in SOP

3. **Include Minimal Code Blocks**
- For each modified function, include representative diff lines
- Keep code blocks short but enough to understand change
- Ignore `*.pb.go` files
- Ignore `Justfile` files

4. **Step-by-Step SOP Structure**
- Each step corresponds to a diff segment
- Include:
  - Section title (what changed)
  - Files affected
  - Functions changed
  - Minimal code block

---

## Quick Reference Template

```markdown
### <Step Name>
- Files modified:
\`\`\`text
<file_path>
\`\`\`
- Functions changed:
\`\`\`<language>
<function_signature>
\`\`\`
- Diff example:
\`\`\`diff
<diff_lines>
\`\`\`
