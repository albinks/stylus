<file name=0 path=/Users/allenamos-binks/Desktop/projects/cline/stylus/memory-bank/projectbrief.md># Project Brief: Stylus – Automated Comic Book Design Workflow

## Project Overview
Stylus is an open-source Python library that streamlines the creation of comic books from news articles or custom prompts.
It integrates AI-driven modules for character creation, story arc generation, panel layout, line art production, coloring, and final page composition to deliver a fully automated comic book design pipeline.
This system empowers creators to generate visually compelling and narratively coherent comics with minimal manual intervention.

## Project Goals
- **Enable Rapid Comic Production:** Provide artists, journalists, and storytellers a seamless toolchain to convert textual content into polished comic books.
- **Modular AI Pipeline:** Develop interchangeable agents for narrative generation, character design, panel composition, art generation, coloring, and layout.
- **Maintain Narrative & Visual Coherence:** Ensure story arcs and artwork maintain consistency across pages and styles.
- **Foster Community Contributions:** Build an approachable, extensible codebase (< 3 k LOC) suitable for open-source collaboration and hackathon participation.
- **Bridge Text-to-Visual AI:** Combine symbolic story planning with neural generative models for hybrid comic creation workflows.

## Workflow Architecture
- **Input Processing**
  - Accept news articles or custom story prompts as JSON or plain text.
  - Extract key story elements and themes.
- **Character Creation Agent**
  - Generate character profiles, designs, and expressions based on story context.
  - Output character JSON schemas with visual attributes.
- **Story Arc Generator**
  - Produce structured story outlines and dialogue scripts in markdown or JSON.
  - Support branching narratives and episode segmentation.
- **Panel Layout Planner**
  - Design comic page layouts specifying panel counts, positions, and transitions.
  - Export layout diagrams compatible with rendering engines.
- **Art Generation Module**
  - Create line art for characters and backgrounds using AI models.
  - Generate multiple style variants for artist selection.
- **Coloring Agent**
  - Apply color schemes and shading to line art based on mood and style guides.
  - Support automatic and manual refinement modes.
- **Final Layout Composer**
  - Assemble panels, text bubbles, and assets into final comic pages.
  - Export high-resolution images and PDFs ready for publishing.

## Input/Output Examples
- **Input Prompt:**
  ```json
  {
    "title": "The Rise of the Phoenix",
    "source": "Breaking news article about urban renewal",
    "characters": ["hero", "villain", "sidekick"],
    "style": "neo-noir"
  }
  ```
- **Outputs:**
  - `story_outline.json` – structured story arc with scenes and dialogue.
  - `characters.json` – character profiles with visual attributes.
  - `script.md` – formatted dialogue and narration script.
  - `page1.png`, `page2.png`, ... – rendered comic pages with panels, art, and colors.

## Test Dataset Plan
- **Synthetic Dataset:**
  - Curated news prompts and fictional story briefs with annotated expected comic outputs.
  - Style variations including noir, manga, superhero, and indie comics.
- **Evaluation Metrics:**
  - Narrative coherence scores based on story arc consistency.
  - Visual consistency metrics across panels and pages.
  - User preference surveys for style and readability.
  - Automated layout correctness and text bubble placement accuracy.

## Tech Stack & Standards

### Autodocumentation Specification
| Layer | Tooling | What It Does |
|-------|---------|--------------|
| **Docstrings** | **Google-style** with rich type hints | Human-readable + machine-parsable comments for every public symbol. |
| **Doc Builder** | **MkDocs + Material theme** | Lightweight, MarkDown-first, fast live-reload (`mkdocs serve`). |
| **Auto-Import** | **mkdocstrings-python** | Pulls signatures & docstrings directly from source; updates as soon as code changes. |
| **Notebook Docs** | **Jupyter-Book plugin** | Renders `.ipynb` demos showcasing comic generation and panel layout. |
| **Diagram Generation** | **mkdocs-mermaid2** | Auto-renders Mermaid graphs illustrating workflow pipelines and panel diagrams. |
| **CI Workflow** | `docs-build.yml` (GitHub Actions) | 1. Install deps → 2. `mkdocs build --strict` → 3. Upload artefact → 4. Deploy to `gh-pages` via `peaceiris/actions-gh-pages`. |
| **Badges** | `README.md` | ![CI](https://img.shields.io/github/actions/workflow/status/org/comicbook/ci.yml?branch=main) ![Docs](https://img.shields.io/github/actions/workflow/status/org/comicbook/docs-build.yml?label=docs&branch=main) |

### Code Quality & Automation
- `pre-commit` for running hooks on staged files.
- `Black` for deterministic code formatting.
- `mypy` for static type checking.
- Linting with `Ruff` (or similar).

### Packaging and Versioning
- Use Poetry for package management and dependency resolution.
- Provide instructions for creating and activating a virtual environment (`venv`) for development and deployment.
- Publish releases to PyPI and maintain versioning aligned with semantic versioning guidelines.
- Semantic Versioning (SemVer) is enforced.
- Conventional Commits are used.
- Commit hooks and automated release workflows ensure version and changelog consistency.

### CI/CD
- Automated testing and linting on GitHub Actions.
- Documentation builds and deployment to GitHub Pages on every push to `main`.
- Docker containerization for reproducible environment setups.

### Makefile Specifications
- `make install` for setting up the environment with Poetry.
- `make format` for running code formatting tools.
- `make lint` for running linting tools.
- `make typecheck` for running static type checks.
- `make test` for running tests.
- `make docs` for building project documentation.
- `make clean` for removing build artifacts and caches.

## Research Inspirations
- Text-to-image generation models (e.g., Stable Diffusion, DALL·E) for art creation.
- Symbolic story planning frameworks adapted for comic narrative arcs.
- Panel composition and graphic design principles from comic theory.
- Multi-agent AI workflows integrating neural and symbolic components.

## Next Steps
- Implement core agents for character creation and story arc generation.
- Develop prototype panel layout and art generation modules.
- Build demo notebooks illustrating end-to-end comic generation.
- Establish test datasets and evaluation pipelines.
- Launch community beta and gather feedback.

## Stakeholders
- **Allen Amos-Binks** – Project Lead & Core Maintainer
- **Creative AI Research Group** – Collaborators on narrative and art generation
- **Open Source Contributors** – Community developers and artists

## Resources
- **Languages & Frameworks:** Python 3.12, Pydantic, NetworkX, FastAPI
- **AI Models:** Stable Diffusion, GPT-4, custom style transfer networks
- **Doc Stack:** MkDocs-Material, mkdocstrings-python, mkdocs-mermaid2, Jupyter-Book
- **DevOps:** GitHub Actions, Poetry, Docker, Vercel (docs preview)

## Constraints
- **API Rate Limits:** Cache and batch calls to external AI services; fallback to streaming where supported.
- **Compute Budget:** Target laptop-class hardware; optional GPU acceleration for art generation.
- **Licensing:** MIT license to encourage open collaboration and commercial use.

---
*This brief serves as the single source of truth for the Stylus project scope and deliverables.*
</file>
