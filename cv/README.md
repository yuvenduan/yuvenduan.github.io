# CV sources

| File | What | Output |
|---|---|---|
| `cv_academic.tex` | General academic CV (also for TA applications) | `build/cv_academic.pdf`, copied to `../assets/files/CV.pdf` (linked from the website) |
| `resume_neurotech.tex` | Internship resume for neurotech / BCI roles | `build/resume_neurotech.pdf` |
| `resume_aiml.tex` | Internship resume for AI/ML (post-training, generative models) | `build/resume_aiml.pdf` |
| `clean_cv.cls` | Shared class (`\documentclass[resume]{clean_cv}` for the denser resume layout) | |
| `shared/publications.tex` | All publications, defined once and reused by each document | |
| `shared/common.tex` | Contact line, honors, skills | |

Build: `cd cv && make` (needs a TeX distribution with `latexmk`; `make clean` removes build files).

Each document sets `\reviewvenue` before loading the publication list: the public academic CV says
"Under review"; the resumes read the venue from `../private/reviewvenue.tex` (gitignored) if it exists.
