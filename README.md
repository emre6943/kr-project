# KR Project — Group 40

Practical assignment for **XM_0059 Knowledge Representation** (VU Amsterdam, MSc AI, 2026 P2),
lecturer Dr. Patrick Koopmann. Worth 35% of the course grade; at least a 5.5 is needed to pass.

**Team (Canvas "Project Groups 40"):** Emre Özkan, Wiktoria Popko, Anshul Rao, Manisha Venkatesha.

## Domain

**Food** (chosen 2026-11-14, replacing diseases): ingredients and their categories, dishes,
and people's likes, dislikes and restrictions, used to suggest what a person or a group might
enjoy.

## Repository layout

| Path | What |
|---|---|
| [`ontology/food.omn`](ontology/food.omn) | the OWL ontology (Manchester syntax); design notes and what the reasoner infers in [`ontology/README.md`](ontology/README.md) |
| [`competency-questions.md`](competency-questions.md) | competency questions, one section per scope owner |
| [`AI_USE.md`](AI_USE.md) | log of every GenAI use, for the report's disclosure |
| [`assignment/`](assignment/) | the project spec and the course rules, copied from Canvas |

## Tools

- **Protégé 5.6.9** with the bundled **HermiT** reasoner, the tool used in the lectures. Download
  it from the [Protégé releases on GitHub](https://github.com/protegeproject/protege-distribution/releases)
  (the Homebrew cask is disabled). On macOS the app is unsigned: right-click → Open the first
  time.
- Datalog with **Nemo** for the second formalism (lectures 8–9).

## The task

Build a knowledge base about a domain of our choice in **two** course formalisms (**OWL is
mandatory**; logic programming, i.e. datalog with Nemo, is recommended as the second), then write
a report comparing them and showing a useful inference in each. Full spec:
[`assignment/the-project.md`](assignment/the-project.md). Rules on GenAI and version history:
[`assignment/course-rules.md`](assignment/course-rules.md).

Process: competency questions → 50–100 terms → formalise in both formalisms → evaluate by
formalising the competency questions.

## Deadlines

| Date | What |
|---|---|
| 2026-11-20 | Initial report (ungraded, required) |
| 2026-11-27 | Each student reviews two initial reports |
| 2026-12-04 | Knowledge bases + final report |
| 2026-12-11 | Each student reviews two final reports |

## House rules

- **No GenAI text in the report.** GenAI may help with code and scripts; log every use in
  [`AI_USE.md`](AI_USE.md) so the report can disclose it.
- **Commit early and often.** The final submission needs a screenshot of the version history.
- Record who did what as we go; the report's appendix needs each member's contribution.
