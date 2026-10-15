---
name: iac-09-verify-live
description: Verify explicitly authorised live behaviour against an actual deployment record.
agent: infrastructure-tester
---

Read `AGENTS.md`; require a separate live-check assignment, actual authorised
deployment record, approved candidate and expected results/network locations.
Reapply WV15 context confirmation and execute only authorised WV18-WV22 checks.
Record endpoint/TLS, private connectivity/DNS/public denial, effective access and
monitoring evidence; operational drills need their own explicit approval.
Report observed results and limitations, not blanket certification.
Do not provision resources, fix production configuration or perform unapproved
load/destructive/recovery tests. Missing deployment evidence means `BLOCKED`.
