# R Programming and Data Analysis Coursework

Completed coursework and reference material from the Data Science master's programme at Dalarna University, Sweden. The collection covers R programming, data manipulation, exploratory analysis, visualisation and analytical reporting.

## Start here

- [Diamonds analysis](diamonds-dataset-project-seminar-1/diamonds_analysis.R): examines price and clarity using data cleaning, grouped summaries and visual comparisons. A restricted subset compares price per carat within selected carat, cut and colour ranges, illustrating why aggregate comparisons need context.
- [R Lab 1 submission](r-lab1-assignment/student_Al_Amin_Alif.Rmd): my named R Markdown submission for student-score analysis, covering functions, data validation, missing values, transformations and summary reporting.
- [Environmental Disclosure Analysis](https://github.com/iamalif/environmental-disclosure-analysis): the related group seminar project, published separately with its Python notebook, report and presentation.

## Repository guide

| Folder | Contents |
|---|---|
| [diamonds-dataset-project-seminar-1](diamonds-dataset-project-seminar-1/) | Seminar analysis script and a diamonds CSV; the script itself uses the dataset supplied by ggplot2 |
| [r-lab1-assignment](r-lab1-assignment/) | Named submission, original assignment template and student-score data |
| [lab2](lab2/) | R and Python lab solution material, text-analysis datasets and image examples |
| [misc-practice](misc-practice/) | R programming, data manipulation, plotting, mtcars analysis and R Markdown practice |
| [r-crash-course](r-crash-course/) | Introductory R exercises |
| [r-workshop-main](r-workshop-main/) | Supplied workshop exercises, answers, rendered examples and CSV/RDS practice |

The Lab 1 file `student_r_assignment.Rmd` is the original template. Use `student_Al_Amin_Alif.Rmd` to read my submission. Lab and workshop solution materials are retained as learning references, not presented as entirely original implementations.

## Working with the files

Use R, with RStudio as a convenient editor for scripts and R Markdown documents. This collection has no single application entry point.

### Diamonds analysis

Install its main dependencies in R:

```r
install.packages(c("ggplot2", "dplyr", "scales"))
```

Open `diamonds_analysis.R` and run its sections in an interactive R session to inspect the plots. The script loads `ggplot2::diamonds`; its analysis does not depend on reading the accompanying CSV.

### R Markdown assignment

Install the reporting and assignment packages:

```r
install.packages(c("rmarkdown", "knitr", "testthat"))
```

Open `r-lab1-assignment/student_Al_Amin_Alif.Rmd` in RStudio and use **Knit** to render the document. Keep `student_scores.csv` beside it. Rendering requires Pandoc, which is bundled with RStudio.

### Other exercises

Consult each file's package imports and the workshop README. Some lab examples retain machine-specific paths or require additional packages and external resources. Adjust paths to your own environment before running those sections. The Python notebook in `lab2/` requires a Python notebook environment and its own dependencies.

## Skills demonstrated

R programming, functions, data structures, data cleaning, dplyr, ggplot2, exploratory data analysis, grouped summaries, visual communication and R Markdown reporting. Supporting practice includes correlation, linear regression, text analysis and image-processing examples.

## Attribution and status

The coursework is complete. Repository maintenance may continue to improve documentation and organisation.

This collection includes my coursework alongside supplied assignment templates, lab solutions and teaching examples. Original datasets and teaching materials remain attributed to their respective creators. Preserve the workshop's licence and credits when reusing its material.

## Further coursework

[Statistical Learning MSc](https://github.com/iamalif/statistical-learning-msc) extends this foundational work with wine-quality regression, classification, ensemble methods, support vector machines, PCA and clustering.
