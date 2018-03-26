# Explicit Semantic Analysis

## Introduction

Explicit Semantic Analysis (ESA) is an

## Algorithm

In ESA, the semantic interpretation of a term or text fragment t is represented by a
semantic interpretation vector,

    w_1, \ldots, w_n .

This represents the meaning of t in terms of the strength of its association
with a number of predefined concepts,

    C_1, \ldots, C_n .

Once semantic interpretation vectors are determined for terms or text fragments,
there are a number of operations that can be performed.
Semantic relatedness can be inferred by various distance metrics, common
interpretation can be defined through averaging, etc.

ESA requires the existence of a repository of concepts, defined through natural
language texts.
It is in this sense that the analysis is 'explicit', in that the concepts are explicit,
rather than arising latently as in LSA or other similar techniques.
In the seminal paper referenced, the titles of Wikipedia articles
are identified as concepts, with the texts of the articles defining the concepts.

In order to construct the semantic interpreter which translates text fragments
to semantic interpretations, one first constructs the matrix T, elements of
which are given by

    T_{t_i, d_j} = TF(t_i, d_j) . log \frac{n}{DF(t_i)} .

Here the term frequency of a term in a document is given by

    TF(t_i, d_j)
    =
    \begin{cases}
    1 + log \text{count}(t_i, d_j) & \text{count}(t_i, d_j) > 0
    0                       & \text{otherwise}
    \end{cases},

and the document frequency of a term is the number of documents in the collection
which contain the term.
Cosine normalisation is applied to each row of T to account for difference in document length,

    T(t_i, d_j) \to \frac{T(t_i, d_j)}{\sqrt{\sum_{k} T(t_k, d_j)}} .

The semantic interpretation of each term is given by the the appropriate row of T.

In practice, the construction of T first requires that the reference text (e.g. Wikipedia)
must first be preprocessed, to remove stop words, insufficiently-developed articles,
and to threshold zero weights, etc.

## Examples

## Discussion

## Extensions

### Second-Order Concepts

In some reference texts (i.e. Wikipedia) additional information on the relatedness
of concepts is provided by the links between different articles.
The second-order semantic interpretation vector of a text fragment is given by

    w_1', \ldots, w_2' ,

where the new weights are given by

    w_i' = w_i + \alpha \sum_{{j | \exists \link C_j \leftrightarrow C_i}} w_j .

and $\alpha = 0.5$ is chosen in the referenced paper as an arbitrary value for experimentation.
This gives link-related concepts additional weight in the interpretation vector.
This extension can be adjusted to only boost the weight of more 'general' concepts,
in the case where one wishes to only boost the relatedness of concepts
which more generally describe the input text fragment.
In the referenced paper, link-related concepts are only given additional weight
if their relative generality,

    \log_{10}(\frac{IL(C_i \log_{10})}{IL(C_j \log_{10})})

is greater than one. That is, if the number of incoming links is an order of magnitude
larger than the triggering concept.
