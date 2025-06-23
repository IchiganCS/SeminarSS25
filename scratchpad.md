Generally:

The slide for the topic selection stated

\begin{itemize}
    \item Safe interaction of processes in message passing systems
    \item Theoretical limits
    \item Use cases and performance implications
    \item Mailboxer Tool
\end{itemize}

\begin{itemize}
    \item We have 10-15 pages per participant, including figures, references, tables.
    \item Intended audience: Your peers!
    \item Present the problem and motivation of the work
    \item Summarize central definitions and notions
    \item Present approaches, ideas, solutions, ... from the literature
    \item Critically discuss these approaches
    \item Identify open problems and formulate research questions
\end{itemize}

An idea for the research questions:

\begin{itemize}
    \item Present and explain mailbox typing as presented by Fowler et al.\cite{fowlerSpecialDeliveryProgramming2023}.    
    \item Showcase advantages and shortcomings through case studies.
\end{itemize}

As the research questions do not quite convey why this topic is interesting, but only explain what is presented about the topic, I think that more context is required: why is this topic interesting and what is it that we are hoping for, what problems should be solved. I think that is at least as important as the solution itself.

The problems we are trying to solve should be appropriately explained (deadlock freedom, junk freedom, message count and order). Mention that we look at mailboxes (actor languages). That should be rather easy to understand given the background and those explanations can be rather short.

At this point, it probably makes sense to compare several algebras which are the foundation for the Pat language which is the main focus.


For the discussion and "findings" there is little to present. While there are several ideas, they are more a sequential evolution than anything else. We can compare Pat to erlang, but will only find obvious results.


# Abstract

    Give an abstract of your paper.
    \begin{itemize}
        \item What is the problem area and topic and question you're trying to address?
        \item Why is it a relevant problem ?
        \item How is it solved?
        \item Which results were obtained?
    \end{itemize}

# Introduction


What is the problem area and topic and question you’re trying to address?
Why is it a relevant problem ?
Identify the scope of your report (and the limitations)



Distributed systems important.

Difficult to write correct distributed systems. Type systems can help. Not channel- but actor-based. Mailbox types.

How good is this and what are the limitations? We will look at Fowler \cite{fowlerSpecialDeliveryProgramming2023} and use case-studies.

Historically, approach based on \cite{deliguoroMailboxTypesUnordered2018}.

# Background

Introduce the foundations of the topic
What is important to understand the report?
Establish terminology to be used in the thesis
Use figures and graphics!

Explain deadlocks, junk freedom.

Actor languages not needed? I don't think there's a benefit. Can be explained in introduction.

The word session type and behavioral type systems should definitely be mentioned here. Citations are missing here, but there is plenty of research for that. 

Maybe it is interesting to explain the multiparty ideas in \cite{neykovaMultipartySessionActors2017}?


\subsection{Explanation of other systems}
This section is between background and the topic-specific content. It explains the ideas of $\pi$ calculus from Amadio \cite{amadioBisimulationsAsynchronousPcalculus1998a} which was extended in Padovani \cite{padovaniTypeCheckingAlgorithm2018}.


# Topic-specific summary

Present the approaches, ideas, solutions, ... from the literature
Discuss their relation, compare them, etc.
Use examples, (if possible, your own examples!)
Use figures and graphics!
Split into different sections if necessary


\subsection{Explanation of Pat}
To explain the Pat language, we will probably only cover the declarative typing rules.

As most of that is quite easy to grasp and similar to other languages, we focus especially on pattern semantics and usage annotations.
Other topics explained are type combinations, subtyping.

When I first read the paper, I found the guard clause to be unclear just as well as the freeing and allocating of mailboxes. That will also be explained.

This entire section will be explained with a small example: The future example from the paper is nice, but it will probably be closer related to the case studies.

The type checking algorithm is not covered, it should be mentioned that the required algorithm currently is feasible for realtime.

\subsection{Case studies}

A case study for the sleeping barber is nice as that was not expressed in the benchmark suite from the savina benchmarks \cite{imamSavinaActorBenchmark2014}.

This is probably the heart piece of the report in the sense that it is the best what the discussion can rely on. Every other section is only repetition of excerpts from other papers. 




# Discussion
Compare your findings from the literature
Argue and convince the reader that the findings address the problems/questions from the introduction
Name open aspects and short-comings (but be careful and respectful!)

Obvious shortcomings: No generics.

nf automatons - regex not enough.

Performance can even increase (padovani2018)


\subsection{Open questions}

\begin{enumerate}
    \item Implementing tools to actually utilize the methods. Already in work. Design for those is an open question.
    \item Extend the expressability to cover more cases (missing benchmark). However, a logical system might have valid limitations and can still be successfull (all languages sometimes prohibit logically fine operations), as long as all scenarios can be modeled in some way. More types are absolutely necessary.
    \item Currently, the syntax is much more complex than other languages and seems very hard to migrate. How can migration of large and complex projects happen? If complete migration is unrealistic, how could such a code analyzer be added incrementally to a large project? Is an automatic migration tool feasible or can this simply not happen automatically?
    \item How many errors are solved by this? Are these methods necessary in practice or is testing more viable? There are several methods providing better statical analysis and while generally popular, there is a balance between effort to use the system and the advantages of said system.
\end{enumerate}

    


# Conclusion
    
Short Summary
What are your key conclusions drawn?
What are the open research questions?




Presented approach from Fowler is actively researched: idea works well and enables usage theoretically in a lot of scenarios. Definitely interesting for the sake of research, the practical aspect of it is still open.

