# The Project — XM_0059 Knowledge Representation (VU, 2026)

_Copied from the Canvas page [The Project](https://canvas.vu.nl/courses/90260/pages/the-project), last updated 2026-11-11, fetched 2026-11-14 (adds report structure and grading scheme)._

The project counts for 35% of the final grade and you need at least a 5.5 to pass the course. The aim is to apply what you have learned towards developing a knowledge-driven AI system, illustrating your achievement of various learning goals.

#### 
Important notes before you begin

Team work: The project should be done in teams of 3-4 people - register those teams on canvas. Working in a team is an important skill that is part of the learning goals of this course. To document your team work, each report should contain a short section in the appendix clarifying how each team member contributed to the project. It is possible that different team members obtain differing grades, but in general a good project should make efficient use of each team member.

Version history: you final submission should contain a screenshot of the version history of your project (report, knowledge base + code), and we might request to inspect this version history. Make therefore sure to use a version control system from the very beginning to document your progress, and make sure to commit frequently. For code, including the knowledge bases, we recommend github, for the report, we recommend latex either in overleaf or in github.  

 

#### The Aim of the Project

In this project, you will develop a knowledge base using the techniques learned in the lecture, about a domain of your choosing. You will model the knowledge base using two of the KR formalisms taught in the course: using OWL as one of the formalisms is mandatory, the second formalism is up to you, but it has to be a formalism covered in the course (e.g. classical logic or logic programming). Recommended is to use logic programming. In your report, you should compare the two formalizations, and discuss the advantages and limitations of the two formalisms for your use case. You should also make use of the expressivity covered in the lecture: use the different constructors covered in the lecture in an appropriate way, make use of discussed design patterns, and illustrate on an example, in your report, how reasoning is used in your project to make a useful inference (both formalisms).
For passing the course, a report and the two knowledge bases are sufficient. You are however free to integrate this into a little research project about these knowledge bases, where you answer some research questions. Creative ideas give extra points.  

 

#### Choosing a fitting domain

You are free in your choice for the domain you want to use for your project - I am curious to see what ideas you have! Just be aware that you should be able to formalize it with the formalisms discussed in the lecture, and that inferences made through logical reasoning are relevant. In particular, you will need to be able to show case how reasoning comes to a useful conclusion in your report. If you domain does not allow that, you will not be able to get full points. We are not discussing probabilistic or fuzzy domains in this course, and also other forms of quantitative reasoning are not central - make therefore sure that numerical calculations are not central to your project. Join the working groups in the first week to get some ideas about what other students choose and how well your idea would or would not be suited.

 

#### Knowledge Engineering Process

Roughly, the knowledge engineering process consists of the following steps:
1. Requirements analysis through competency questions
2. Collection of relevant terms (aim for around 50-100)
3. Formalization of the domain knowledge in the two formalisms
4. Evaluation of the knowledge base through appropriate formalizations of the competency questions where possible.

Steps 1+2 can be executed without knowledge of a particular formalism - some techniques are mentioned in the lectures and also applied in the working groups. For instance, in the first working groups in Week 1, we will develop sets of competency questions with the group. You may request to do this for one of your domains to get some set of questions to start with. You will not be able to answer all competency questions with your final product - this is fine, and worth discussing in the report.

You will submit two versions of the report: an initial version is published in the middle of the period and should already discuss the domain, competency questions, relevant terms, and formalization ideas, research question if applicable. You will receive feedback from your peers on this report - the more content you include, the more feedback you can get. The first version is not graded, but submission and review is required.

#### Time Line

Weeks 2-4: collection of initial research questions, initial modelling with one of the KR formalisms, first version of report 
Weeks 5+6:  Modelling with both KR formalisms, analysis of advantages and disadvantages, evaluation, final version of report

Deadlines:
20 November: Each team submits first version of report (link published later on canvas) 

27 November: Each student submits reviews of two reports

04 December: Each team submits knowledge bases and final version of report

11 December: Each student submits reviews of two final reports

#### Format

maximally 10 pages in LNCS format (see here), excluding references and possible appendices.

#### Orientation for report structure:


- Introduction

- introduce and motivate the domain, and how the knowledge base would be used in a greater AI system

- skope, goals, and competency questions

- if relevant: research questions




- Design Process

- Formalization in OWL

- overview and structure of ontology

- where definitions and partial definitions where used

- illustrate mechanics by explaining complex inference on an example




- Formalization in second formalism

- following similar structure




- Evaluation

- evaluation of the two formalizations in terms of competency questions (not all need to be answered), goals and reasoning times

- comparison of the two formalisms: what were the advantages, what the limitations, of using either of the two formalisms for formalizing the domain.




- Conclusion and Outlook


#### Grading Scheme

The following aspects will contribute to the grade:


- Based on the report:

- Presentation: structure, style, clarity

- Introduction and motivation

- Design process

- Competency questions

- Design decisions in the two formalisms

- Reasoning example

- Analysis (comparison of the two formalisms)

- Conclusions and Outlook






- Knowledge bases:

- basic requirements (consistent, coherent, reasonable reasoning time) 

-  minimal complexity (for full points, at least 50 names and 10 complex definitions)

- use of available operators of the formalisms (OWL ontology: all of ALC + 5 constructs beyond) 




-  use of design patterns from the lectures 

- "reasoning complexity" of relevant inferences (inferences that depend on several axioms and make sense)  




- Quality of Team Work

- Bonus points for:

-  creative ideas, research questions beyond the given task 





