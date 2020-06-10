## Refactoring notes

This repository fefactors the code from [Jim's MTR analysis](https://osf.io/pkqts/).

The main code `jim_mtr.m` navigates through subfolders that contain code and
data. Looks like `jim_analyze.m` is responsible for processing at a single 
subject level. 

The following section outlines the refactoring process of `jim_analyze.m`

### MATLAB Code Reports about `jim_analyze.m` 

Dependency report listed the following: 
- `ChangePtsCorsis.m`
- `idsw3dInterp.m`
- `load_untouch_nii` [UNKNOWN]
- `trk_plot.m` 
- `trk_read.m`
- `cline.m` 

Code analyzer listed the following:
```
3 Using CLEAR ALL usually decreases code performance and is often unnecessary. 
53 DISP(SPRINTF(...)) can usually be replaced by FPRINTF(...\n). 
180 The value assigned to variable 'trcks_fa' might be unused. 
224 The variable 'tmp' appears to change size on every loop iteration. Consider preallocating for speed.
```

Help report:
```
No description line
No help
No examples
No See Also line
No copyright line
```
### [The McCabe complexity score](https://github.com/Remi-Gau)

| :exclamation:  **24** for `jim_analyze.m`|
|---------------------------------------|

### Observations about JIM's `"repo"` 🙄 

1. The source code is copy-pasted in each subject folder.
2. The scripts have no comments.
3. There is not even a `README.md` that can hint something about the code. 
4. Looks like Jim used some functions saved to his `search path` but did not 
   include them inside the code: `load_untouch_nii`. 
5. It also appears that some functions are scraped from other repositories 
   such as `trk_plot` and `trk_read`.
6. No version controlling. 
7. No tests. 
8. No modularity.
9. No information about runtime compatibility. 

### Zooming into the `jim_analyze.m` 🔎

Below, I listed i/o and processes associated with this script. 

### Inputs 📥
- `mtOn.nii` or `mtOn.nii.gz` 
- `mtOff.nii` or `mtOff.nii.gz` 
- `difFa.nii` !!! Only in `/S2/jim_analyze.m`
    - Do `diff` between `/S1` and `/S2` `jim_analyze.m` 🤦‍♂️
- `*.trk` ot `*.trk.gz` 
    - For the files listed about there are convoluted format checks whether 
      to `gunzip` or not. Highly verbose and prone to unexpected behaviour.
    - 🐞🐞🐞🐞🐞🐞🐞🐞🐞🐞
- `transform.txt` or `transform.mat` 

### Outputs 📤
- `jim_mtr.m` saves some `png` files plotted by `jim_analyze.m`. 
- No other outputs are saved. 
- Surface plots with streamlines including: 
    - A single slice axial `mtOn` image & fibers after transformation
    - Only for `S2`, same plot on `FA` image ** screams internally **. 
    - Fibers with `MTR` values as scalar on `mtOn` image. 

### Processes 

- Loading input data. 
- Transformation between `ijk` <--> `xyz` (`image` <--> `real world`) coordinates
- Reading an affine transformation matrix 
- Transforming fibers with `some` information from this affine transformation.
- Plotting a single slice in `xyz` coordinates. 
- Calculating MTR
- Interpolating MTR values along fiber nodes

## DIVIDE 

I will write the following m-files to the `src` directory: 
- `getData.m` to load input data **properly**. 
- `changeCoordSys.m` to perform `ijk` <--> `xyz` transformation. 
- `getMTR.m` to calculate MTR. 
- `plotSlice.m` to create a surface plot of a given slice in `world` coords. 
- `readTransformation.m` to reas `transform.txt` 
- `transformFibers.m` to transform fibers using **part of the** affine transformation
   stored in `transform.txt`. 
-  Currently `idw3dInterp` returns indexes and interpolation weights. It should 
   return streamlines with interpolated scalar (MTR) values.

> An algorithm must be seen to be believed. - Donald Knuth 

I will create a GitHub repo named `eda_organized`. 
- Add LICENSE
- Add README.md  
- Add CONTRIBUTING.md 

I will add following repos as `submodules` to the `external` directory: 
- Check my code: https://github.com/Remi-Gau/check_my_code.git
- Tract manipulation: https://github.com/johncolby/along-tract-stats.git
- Reading NIFTI: https://github.com/agahkarakuzu/MOnifti.git

## CONQUER

- Create test data 
- Upload test data to OSF and write a small script to download it. 
- Write tests per function and ensure that they perform assertion checks.
- Tests will be placed in a folder named `Test` 
- Configure a GitHub Action to run tests with coverage in Octave.
    - Use [agahkarakuzu/moxunit-action](https://github.com/agahkarakuzu/moxunit-action)
- Use [`azure self-hosted`](https://qmrlab.org) solution to run tests in MATLAB. 
- Create a Jupyter Notebook to showcase the main functionality.
- Create a `Dockerfile` that is based on `qmrlab:octjn` to easily Binderize repo. 
- Create an `initEnv.m` script to do sanity check about runtime versions and
  to add project to the path. 