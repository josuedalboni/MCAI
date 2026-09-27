# MCAI: Multivariate Concavity Amplitude Index

MCAI is a quantitative morphometry method for continuous characterization of **Heschl’s gyrus shape** from 3D T1-weighted structural MRI. It measures concavities along the outline of an inflated representation of the gyrus, producing normalized shape descriptors by anatomical direction. The measurements are computed on 2D projections of the MRI-derived cortical surface.

The method is described in the peer-reviewed [NeuroImage paper](https://doi.org/10.1016/j.neuroimage.2023.120052). It operates on segmentations produced by [TASH](https://github.com/golestaniBLLab/TASH), the Toolbox for the Automated Segmentation of Heschl’s Gyrus, following FreeSurfer processing. Its outputs support quantitative analysis of individual differences in auditory cortex morphology.

## Repository contents

| File | Purpose |
| --- | --- |
| [MCAI.m](MCAI.m) | Entry point for loading TASH images, extracting gyrus boundaries, and collecting left- and right-hemisphere results. |
| [MCAI_directed.m](MCAI_directed.m) | Computes normalized concavity amplitudes, including direction-specific and orientation-independent measures. |
| [MCAI_UserManual.docx](MCAI_UserManual.docx) | Original usage instructions and output description. |

## Using the code

The implementation uses **MATLAB** and Image Processing Toolbox functions. The paper reports MATLAB R2022a. FreeSurfer and TASH preprocessing are performed separately; this repository contains the MCAI analysis component.

1. Add the repository and the required TASH functions to your MATLAB path. `MCAI.m` calls `TASH_DefineSubjects`, which is not included here; configure the subject list and input paths through your TASH workflow.
2. Set `D_load` to the directory containing the TASH images `HG_lh_cg1.tif` and `HG_rh_cg1.tif`. The current loader expects 600 × 600 RGB images with TASH’s label colors.
3. Run:

   ```matlab
   D_load = '/path/to/TASH/output';
   results = MCAI(D_load);
   ```

The returned structure contains matrices of concavity indices for each hemisphere and orientation. Each row has four columns, ordered from the largest to the fourth-largest concavity. Boundary plots are written to `MCAI_results` in the current working directory.

Before processing multiple subjects, check the subject configuration: the current loader reads the same filenames from `D_load` on each iteration and does not select subject-specific subdirectories automatically. See the user manual and paper for output interpretation and methodological details.

## Citation

Dalboni da Rocha, J. L., Kepinska, O., Schneider, P., Benner, J., Degano, G., Schneider, L., & Golestani, N. (2023). Multivariate Concavity Amplitude Index (MCAI) for characterizing Heschl’s gyrus shape. *NeuroImage, 272*, 120052. https://doi.org/10.1016/j.neuroimage.2023.120052

[Publisher article](https://www.sciencedirect.com/science/article/pii/S1053811923001982) · [PubMed](https://pubmed.ncbi.nlm.nih.gov/36965861/)
