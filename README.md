# Mathematical models for tumour response to chemotherapy drugs
Repository for the Bachelor thesis which focuses on the analysis of the evolution of a cancerous population subjected to chemotherapy drugs. It investigates the evolution of a phenotypic population state using a reaction–diffusion model and its analytical approximation via Euler methods.


## Repository Structure

### `functions`
The `functions` folder contains:
- `define_parameters.m` – Initializes all physical and simulation parameters (space, time, biological constants).
- `drug_schedule.m` – Defines the time profile of the administered drug.
- `PDE_solver.m` – Solves the main PDE describing the population dynamics under drug influence.
- `euler_solver.m` – Implements the explicit Euler method for analytical approximation of the key variables (f(t), μ(t), ρ(t)).
- `plot_results.m` – Generates figures comparing PDE and Euler solutions, density evolution and heatmaps.



## Requirements

- MATLAB R2021
- No additional toolboxes required


# Author 
Erika Spada – s318375@studenti.polito.it

