

A pipe expression passes, or pipes, the result of the left-hand side expression lhs to the right-hand side expression rhs.

If the rhs expression is a call, then the lhs is inserted as the first argument in the call. So x |> f(y) is interpreted as f(x, y).

To avoid ambiguities, functions in rhs calls may not be syntactically special, such as + or if.

Pipe notation allows a nested sequence of calls to be written in a way that may make the sequence of processing steps easier to follow.

Currently, pipe operations are implemented as syntax transformations. So an expression written as x |> f(y) is parsed as f(x, y). It is worth emphasizing that while the code in a pipeline is written sequentially, regular R semantics for evaluation apply and so piped expressions will be evaluated only when first used in the rhs expression.



library(tidyverse)
library(utf8)
data(penguins, package = "palmerpenguins")
penguins %>% group_by(species) %>% summarize(avg_body_mass_g = mean(body_mass_g, na.rm = TRUE))
penguins |> group_by(species) |> summarize(avg_body_mass_g = mean(body_mass_g, na.rm = TRUE))

penguins %>% lm(bill_length_mm ~ body_mass_g, data = .)

penguins |> (\(d) lm(bill_length_mm ~ body_mass_g, data = d))()

penguins |> (\(d) lm(bill_length_mm ~ ., data = d))()

penguins %>% nrow
penguins |> nrow()
