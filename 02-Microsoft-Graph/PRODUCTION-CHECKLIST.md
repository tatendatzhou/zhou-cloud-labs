# PowerShell Production Checklist

Every production script must pass all 12 checks before it's considered done.

---

## The 12-Point Checklist

- [ ] **1. Everything inside functions**
  No top-level executable code except connection and function calls.

- [ ] **2. Idempotency on every create/write**
  Check state first. Safe to run twice.

- [ ] **3. `try/catch` INSIDE loops, not around them**
  One failure should not kill the batch.

- [ ] **4. Server-side filtering (`-Filter`) where possible**
  Push work to Graph, not PowerShell.

- [ ] **5. Verification after every bulk operation**
  Count what you did. Report it.

- [ ] **6. `[PSCustomObject]` output with consistent shape**
  Every function returns the same object shape, always.

- [ ] **7. `-WhatIf` support via `SupportsShouldProcess`**
  Users can preview changes without making them.

- [ ] **8. No hardcoded values**
  Environmental values must be parameters.

- [ ] **9. Consistent naming — no casing drift**
  `$MailNickname` and `$MailNickName` must not both appear.

- [ ] **10. Help block on every function**
  `Get-Help <function> -Full` should show useful info.

- [ ] **11. Connection check at the top**
  Fail loudly if not connected. Don't auto-connect.

- [ ] **12. `Write-Verbose` for step-by-step info**
  Users can enable with `-Verbose`. Use `Write-Verbose`, not `Write-Host`.

---

## Quick Reference — All 12 Items

| # | Item | What it protects against |
|---|------|--------------------------|
| 1 | Everything inside functions | Copy-paste sprawl |
| 2 | Idempotency on every create/write | Duplicate data, failed re-runs |
| 3 | `try/catch` inside loops | Whole-batch failure |
| 4 | Server-side filtering | Slow scripts, throttling |
| 5 | Verification after bulk ops | Silent partial success |
| 6 | `[PSCustomObject]` output | Inconsistent downstream handling |
| 7 | `-WhatIf` support | Accidental changes in production |
| 8 | No hardcoded values | Scripts that don't travel |
| 9 | Consistent naming | Bugs from case drift |
| 10 | Help blocks | Undocumented functions |
| 11 | Connection check | Silent failures mid-batch |
| 12 | `Write-Verbose` | Uncontrolled output |

---

## Script-by-Script Plan

| # | Script | Focus | Checklist items |
|---|--------|-------|-----------------|
| 1 | `Get-LxUser` | Read/Report | 1, 4, 6, 8, 9, 10, 11, 12 |
| 2 | `New-LxUser` | Create | 1, 2, 3, 6, 7, 8, 9, 10, 11, 12 |
| 3 | `New-LxGroup` + `Add-LxGroupMember` | Create + Bulk | ALL 12 |
| 4 | `Get-LxInactiveUser` | Report with logic | 1, 4, 6, 8, 9, 10, 11, 12 |
| 5 | `Export-LxUserReport` | File output | 1, 6, 8, 9, 10, 11, 12 |

Start with #1. Focus on its items only. Then move to #2.

---

## The Rule

> Depth beats breadth.
> Rewrite what you already have.
> Add discipline, not features.