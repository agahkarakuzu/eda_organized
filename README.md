[![codecov](https://codecov.io/gh/agahkarakuzu/eda_organized/branch/master/graph/badge.svg)](https://codecov.io/gh/agahkarakuzu/eda_organized) [![matlab](https://img.shields.io/badge/MATLAB-CI%20&%20Code%20Complexity-orange?logo=data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACgAAAAoCAYAAACM/rhtAAAABmJLR0QA/wD/AP+gvaeTAAAD30lEQVRYhe3XW4iVVRTA8X1s0tHSJq9UJETJqBSVEIGapBWmqBlFKERIRFBpQhfTjDAyiR7sQgUW1UMUIvSQUlZKWhKlUpYJCV3MrMxMyya76Oivh71kPk/nnHEa7RC4nr5v7bX3999r7bXW/lI6Lselc4Kp+BnrMLrePIcJRuIgtuJZ/Ilh9eZKKaWEBvyA39AbffAKPqg3W0opJcwJ783GeMzCELRibL3hBuEv/I6TsQArYuwlvF5PuC54F3vwWOjWRKgbMCq8eEa9AO9BS4S3Gd3whyzDUMLnmF0PuJHYh3cKIR2uTWaE7j5s/q/hhmJnoZxMDP2sAuDi0J2JAxjR3rpdjgJYD9ycUnovpbQqpbQ9pfRNSum1MClCjEwppVKptC2ltDKlNK2z368F1oh78Qt+iufuUftuCZsSfnS4DIyx66PDdDsWcL3xPrbjRnQP/U3YhZPifbB/ytQY64m9uPpowzViLT5G/4K+K7bggYJuegXAJwvji7HkaAM+h21FuNDPwG40FXRLKwBuKIxfJRfzXp2F6orrsFousnPLxnvF2bu7bM6vFQBbcUrBZjdu+LdgAzE/zloLFuFx7MdTaAy7R/HFoffQXVoB7pBcUbB7Bss7AtUF4yI8rdiE24phkNvVt/gobPdhQtk6C2oAzivYjY4ND2gPrAkz8aXc6JfgcpSq2PfDm3GGllUY31gDcEXBriQn18xacHPl6r9Fvib1r2p8+Lz75To4sEzfXAOOfFwaCvYLsL7Wh66JScvbdXXbnPERmmurgLcnFxbsh4RucK0PDpL/G3ZgXDtwI2JDD1YZ//QIAKeXzVmP+e15pQHz5ORYhB4VbCbIHeBpFc6nfGmoJZvkkF5SNu92fI8Ta0KG8WX4Tu4WQ0NXkovxfoUsrDD3xSpgO+W22AUXYArGaGuLfeSEm9wuYEzoi1fDWw/JCdSKZZU8G3MmyteocvlKTpzzsCp0u+XE3IU7wgEv4I0jAix89Fa57LSEd76Wr/SNZXZTYjOV4E7DlbHG0kJUGuUauyecMSo2eHZHIXsWnk+XO8vCeJ+Et6uEdQfOwVi5mFdLqubY+Gp8hic6BFhhwakR7mb5cFeSvbgYF4XnamZobHxjeLAFp3YWciVejjBtK4NrxWScJV8inlelI5Wt2RRehDmdBRweuz0XdxbgDmKanJWb8ZYjKR1t63bDQjzSKcBYbI18P2yS/3tb5Vt1k1x4N+jsXa+TgJPk2tVb/icZEWdpHT5Bv7rBBeAJkX13xfsYuRusRd+6wh0S+Sa0Vb56HcDDHTlzx1wwAB/KP+zn15vnuPzv5G86r/3yYy92ewAAAABJRU5ErkJggg==)](https://dev.azure.com/neuropoly/BrainHack%20Global/_build?definitionId=12) [![Build Status](https://dev.azure.com/neuropoly/BrainHack%20Global/_apis/build/status/agahkarakuzu.eda_organized?branchName=master)](https://dev.azure.com/neuropoly/BrainHack%20Global/_build?definitionId=12) [![](https://img.shields.io/badge/Octave-CI-blue?logo=Octave&logoColor=white)](https://github.com/agahkarakuzu/eda_organized/actions) ![CI](https://github.com/agahkarakuzu/eda_organized/workflows/CI/badge.svg) 

[![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/agahkarakuzu/eda_organized/master) [![](http://img.shields.io/badge/Zenodo-Presentation-orange?style=flat&logo=microsoft%20powerpoint)](https://zenodo.org/record/3891498#.XuOHY2pKg1I) [![](http://img.shields.io/badge/OSF-Data%20repository-blue?style=flat)](https://zenodo.org/record/3891498#.XuOHY2pKg1I) 

<img src="banner.png" style="width:900px;"></img>

🧠 [BrainHack 2020](https://ohbm.github.io/hackathon2020/), Good coding practices in MATLAB and Octave.

You can see the [refactoring notes](https://github.com/agahkarakuzu/eda_organized/blob/master/REFACTORING.md) Eda took to divide and conques Jim's 🍝 matlab code! 
*** 

<center> <h1> ⚠️ </h1> <center>
<center> <h3 style="color:purple;"> Scripts in this repository are NOT intended for research use! </h3></center>

*** 

## How to clone this repo to your local? 

```
git clone --recursive https://github.com/agahkarakuzu/eda_organized.git
```

You need to pass `--recursive` argument as the repo contains submodules in the
`external` folder.

## 📥 Installation instructions 

<details><summary> <b>💻 Install locally</b> </font> </summary>

### MATLAB

You can execute the scripts in this repository in MATLAB > `R2016b`. Tested in `R2018b`.

Required toolboxes: 
- Image processing toolbox

### Octave

The scripts in this repository are Octave >`v4.0.3` compatible. Tested in `v4.2.2.`. 
Required packages:
- Image 

#### Octave installation instructions 

##### OSX 

1. Open your terminal. Skip steps 2 and 3 if you have  [`Homebrew`](https://brew.sh/) 
installed already.
2. `sudo xcode-select --install`
3. Follow [Homebrew's installation instructions](https://brew.sh/).
4. Ensure that the `brew` is up to date:
   `brew update`
5. Install Octave 
   `brew install octave` 

If you prefer other package managers such as MacPorts or Spack, please visit 
[Octave's official wiki page](http://wiki.octave.org/Octave_for_macOS) for instructions.

##### Ubuntu 

You can simply install Octave by 

```
sudo apt-add-repository ppa:octave/stable
sudo apt-get update
sudo apt-get install octave
```

Detailed instructions are available at [Octave's official wiki page](https://wiki.octave.org/Octave_for_Debian_systems).

##### Windows

Please follow the instructions on [Octave's official wiki page](https://wiki.octave.org/Octave_for_Microsoft_Windows#:~:text=Installers%20for%20Microsoft%20Windows,html%20under%20the%20Windows%20tab.).

#### To use Octave in Jupyter Notebooks 

1. Make sure that you have Octave installed. 
2. If you have Conda/Jupyter/pip installed, go to step 4.
3. Download the [Anaconda Installer](https://www.anaconda.com/products/individual) and install it.
4. Install [Octave kernel](https://pypi.org/project/octave-kernel/): 
   ```
   pip install octave_kernel
   ```
5. Run `jupyter notebook` in your terminal. `Octave` should appear on the list
   for creating a new notebook. 

#### To use MATLAB in Jupyter Notebooks 

1. If you dont have Anaconda installed, please download the [Anaconda Installer](https://www.anaconda.com/products/individual) and install it.
2. Setup the MATLAB Engine API for Python 
   * Open a terminal 
   * Navigate to your MATLAB root folder. To find out the root dir, you can run 
     `matlabroot` command in MATLAB. 
   * In the MATLAB root directory:
     ```
     cd extern/engines/python
     python setup.py install
     ```
3. In terminal run:
   
   ```
   pip install imatlab
   python -mimatlab install
   ```
4. Run `jupyter notebook` in your terminal. `MATLAB` should appear on the list
   for creating a new notebook. 

</details>

<details><summary> <b>🐳 Use with Docker</b> </font> </summary>

If you have Docker installed on your computer and running, you can run the code 
in the same environment described in this repository. 

### Option-1: Use `repo2docker` 

1. Simply install `repo2docker` from pyPI: 
```
pip install jupyter-repo2docker
```
2. Run the following command in your terminal:
```
jupyter-repo2docker https://github.com/agahkarakuzu/eda_organized
```

After building (it might take a while!), it should output in your terminal 
something like:

```
Copy/paste this URL into your browser when you connect for the first time,
    to login with a token:
        http://0.0.0.0:36511/?token=f94f8fabb92e22f5bfab116c382b4707fc2cade56ad1ace0
```

This should start a Jupyter session on your browser and make all the resources 
you see when you [launch a Binder](https://mybinder.org/v2/gh/agahkarakuzu/eda_organized/master) for this repository. 

To re-use your container built by repo2docker, do the following: 

1. Run `docker images` command and copy the `IMAGE ID` to your clipboard 
2. Run the following command to start the container:
```
docker run -it --rm -p 8888:8888 `PASTE IMAGE ID HERE` jupyter notebook --ip 0.0.0.0
```

### Use Docker

This repository builds and pushes its own Docker images on every release! 

You can see the available versions [here](https://hub.docker.com/r/agahkarakuzu/brainhack20). I will give the instructions for the 
latest version: 

1. Pull the docker image
```
docker pull agahkarakuzu/brainhack20:latest
```
2. Start the container
```
docker run -it --rm -p 8888:8888 agahkarakuzu/brainhack20:latest
```

</details>

<details><summary> <b>☁️ Execute online</b> </font> </summary>

[![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/agahkarakuzu/eda_organized/master)

</details>


## 🎦 Videos 

I splitted my video (beginning from 23:00) into 12 parts by content. You can  find them expanding the section below: 

<details><summary> <b> Divide and conquer m-scripts: 12 Video clips </b> </font> </summary>

1. [Moving on with inspecting Jim's code](https://www.loom.com/share/2428ab688f5f4382a4195f011d740f94)
2. [Creating a git repository](https://www.loom.com/share/439e1109f7bc4cf988a3624eea3949ae)
3. [Plan of attack: Taking notes for refactoring](https://www.loom.com/share/6a6536f933ad48078138259109881745)
4. [Writing `getData.m`: Use `inputParser`](https://www.loom.com/share/716c95cf632b4b6abf70f67364083fcc)
5. [`getData`: Exploring `inputParser`](https://www.loom.com/share/bd8abf69adc943da8d788010d296cf85)
6. [`getData`: Ready to go!](https://www.loom.com/share/5c6c06a10593470eb9c88f964a47c333)
7. [Git submodules and some MATLAB tips](https://www.loom.com/share/4f93884adfff4b88b84f974dde6042ef)
8. [FUN, implicit expansion & speed](https://www.loom.com/share/0c07b829dd6543a196d404c7ff677880)
9. [Writing unit Tests!](https://www.loom.com/share/4049b85b179649678e32ab90fa075856)
10. [`CI` using GitHub Actions and Azure](https://www.loom.com/share/6793335d75704e229355006b9aa470ce)
11. [Jupyter Notebook & Binder: Execute your m-code online!](https://www.loom.com/share/b2e30a074f9e4329aa863e3365e86e62)
12. [Running the notebook! Bonus: Interactive plots](https://www.loom.com/share/c4bfe285b1454b148d4d7317e2a818d4)
</details>

## ⌨️ Exercises  

Some of the exercises below will encourage you to fork this repository, improve it 
and make a pull request. Improvement can be anything, even fixing a typo! 

If you fork this repository, open the `Actions` tab and click that green button
to enable `CI` running for your fork! This way, you can ensure that your changes 
will not break something and help you make a PR with mind at peace 😌. 

Other exercises will ask you to work with [Aurina's repository](https://github.com/AurinaBMH/OHBMpractical). Thank you @AurinaBMH! 

| Icon | Difficulty level |
|:------|:----|
|💚| Easy|
|💛| Medium|
|🧡| Upper-intermediate|
|❤️ |A bit difficult (relatively)|
|😎 |PRO|

<details><summary> <b> 💚 Add comments to the <a src="https://github.com/agahkarakuzu/eda_organized/tree/master/src">functions</a> in this repo </b> </font> </summary>

I did not add any header comments to the functions I wrote for this 
course on purpose. 
1. Fork this repository 
2. Create a header comment for one of the functions you choose and make a
pull request to this repository!

By the way, it does not have to be a header comment! You can make a pull request 
for anything that improves readibility of the code, such as adding inline 
comments, changing variable names, or even fixing a typo. 

Hint: You can find a header comment template in [`getData.m](https://github.com/agahkarakuzu/eda_organized/blob/master/src/getData.m).

</details>

<details><summary> <b> 💚 Improve community profile of this repo </b> </font> </summary>


This repository is missing some important <a src="https://help.github.com/en/github/building-a-strong-community/about-community-profiles-for-public-repositories">community profile</a> information.

Such a shame! See how this project compares to <a src="https://opensource.guide/">recommended community standards</a> and make pull requests to improve it! 

I just created a nice <a src="https://github.com/agahkarakuzu/eda_organized/blob/master/CHANGELOG.md">CHANGELOG template</a> for you, but it does not have much to do with community standards 👀.

</details>

<details><summary> <b> 💛 Improve <a src="https://github.com/agahkarakuzu/eda_organized/tree/master/Test">tests in this repo</a> </b> </font> </summary>


Improvements can include adding comments to the [test scripts](https://github.com/agahkarakuzu/eda_organized/tree/master/Test), improving testing steps or even writing a new 
one! 

Fork this repository, do your changes and make a PR! 

</details>

<details><summary> <b> 🧡 Do performance improvements in this repo</b> </font> </summary>

Remember that the `plotSlice` function was running slowly for no reason? See the
instructions [here](https://github.com/agahkarakuzu/eda_organized/blob/20184bfaa2db2be4088b38f239623881b45a0e85/src/plotSlice.m#L40-L63) and try to replace
that nested `for` loop with something faster! 

Note that it is not the only part that slows down the code. There are some other 
parts in the function written without thinking too much about computational 
overhead. You are more than welcome to find and replace them with something better.

Do not forget to make a pull request once you complete it! 

</details>

<details><summary> <b> 💛 Write tests for <a src="https://github.com/AurinaBMH/OHBMpractical">Auirina's repository</a> </b> </font> </summary>

1. Clone @AurinaBMH's repository <br>
<code> git clone https://github.com/AurinaBMH/OHBMpractical.git </code>

2. Setup <code>MOxUnit</code> <br>
<code> git clone https://github.com/MOxUnit/MOxUnit.git </code>

Note: Do not clone MOxUnit in the OHBMpractical folder. 

3. Add <code>MOxUnit</code> to MATLAB/Octave's search path (in Octave or MATLAB)<br>
<code> addpath('directory_to_MOxUNit');</code>

4. Create a new folder <code>Test</code> in the <code>OHBMpractical</code> repo you cloned 

5. Write tests for the <a src="https://github.com/AurinaBMH/OHBMpractical/tree/master/code/functions">functions</a> and add them to the <code>Test</code> folder 

6. In MATLAB/Octave, navigate to the <code>Test</code> folder and run <code> moxunit_run_tests </code>
function. See if your tests passes! 

</details>

<details><summary> <b> 🧡 Set up CI for <a src="https://github.com/AurinaBMH/OHBMpractical">Auirina's repository</a> </b> </font> </summary>

1. It does not make much sense to set up a CI without tests right? Make sure that 
you completed the previous exercise and have your tests ready in the <code>Test</code> folder. 

2. To work with it Aurina's repo just like any other github repo you have you can either:
    - Create a new repository in your GitHub and copy <code>YOUR_NEW_REPO_URL</code>
    - Navigate to the OHBMpractical repo you modified <code>cd OHBMpractical</code>
    - Run <code>git remote rename origin upstream</code>
    - Then run <code>git remote add origin YOUR_NEW_REPO_URL</code>
    - Then run <code>git push origin master</code>
  or simply:
    - Fork the repo on GitHub
    - Clone the fork to your local

3. Create <code>.github/workflows/build.yml</code> and configure it to run 
   MOxUnit tests each time you push a commit to master using <a src="https://github.com/agahkarakuzu/moxunit-action"> <code>agahkarakuzu/moxunit-action</code> </a>, similar to 
   <a src="https://github.com/agahkarakuzu/eda_organized/blob/master/.github/workflows/moxunit.yml">how I did in this repo</a>.

4. Login to <a src="https://codecov.io">codecov.io</a> with your GitHub account. You will 
   be asked to authorize codecov to integrate with your GitHub account.

5. Now you can add code coverage! Note that you don't have to add a <code>token</code>
   as I did    <a src="https://github.com/agahkarakuzu/eda_organized/blob/master/.github/workflows/moxunit.yml">here</a>. 

</details>

<details><summary> <b> 🧡 Create a notebook for <a src="https://github.com/AurinaBMH/OHBMpractical">Auirina's repository</a> and Binderize it </b> </font> </summary>

1. To work with it Aurina's repo just like any other github repo you have you can either:
    - Create a new repository in your GitHub and copy <code>YOUR_NEW_REPO_URL</code>
    - Navigate to the OHBMpractical repo you modified <code>cd OHBMpractical</code>
    - Run <code>git remote rename origin upstream</code>
    - Then run <code>git remote add origin YOUR_NEW_REPO_URL</code>
    - Then run <code>git push origin master</code>
 or simply:
    - Fork the repo on GitHub
    - Clone the fork to your local

2. You need to have Octave, Jupyter Notebook and Octave kernel installed to develop
   an Octave based Jupyter Notebook. You can find the instructions under Installation instructions in this readme. 

3. Create a Jupyter Notebook that does something similar to <a src="https://github.com/AurinaBMH/OHBMpractical/blob/master/code/visualise_geneExpression.m"> this main function </a> and push it to your version of Aurina's respository. 

4. Create a folder with the name <code>binder</code> in your version of Aurina's repo.

5. Add <a src="https://github.com/agahkarakuzu/eda_organized/blob/master/binder/Dockerfile"> this <code>Dockerfile</code> </a> to the <code>binder</code> folder. 
   - You can get rid of the instructions in line 16-17. They were specific to this repo. 

6. Commit and push your changes to your version of Aurina's repo. 

7. Visit <a src=https://mybinder.org>mybinder</a> and paste the URL of your repo. 

8. Wait until the build is completed, and see if it works! 

</details>

<details><summary> <b> ❤️ Set up Docker actions for <a src="https://github.com/AurinaBMH/OHBMpractical"><u>Auirina's repository</u></a> </b> </font> </summary>

This repository builds and pushes its own Docker images to DockerHub each time 
I release it. To do this for Aurina's repo:

1. 1. To work with it Aurina's repo just like any other github repo you have you can either:
    - Create a new repository in your GitHub and copy <code>YOUR_NEW_REPO_URL</code>
    - Navigate to the OHBMpractical repo you modified <code>cd OHBMpractical</code>
    - Run <code>git remote rename origin upstream</code>
    - Then run <code>git remote add origin YOUR_NEW_REPO_URL</code>
    - Then run <code>git push origin master</code>
 or simply:
    - Fork the repo on GitHub
    - Clone the fork to your local

2. Create a DockerHub account 

3. <a src="https://docs.docker.com/docker-hub/access-tokens/">Create a DockerHub access token</a>
   Warning: Do not share this publicly! 

4. <a src="https://help.github.com/en/actions/configuring-and-managing-workflows/creating-and-storing-encrypted-secrets#:~:text=On%20GitHub%2C%20navigate%20to%20the,Click%20Add%20a%20new%20secret.">Add 2 secrets to your version of Aurina's repository on Github:</a>
    - NAME: DOCKER_USER | VALUE: Your DockerHub username
    - NAME: DOCKER_PASS | VALUE: Access token from step 3

5. Copy <code>Deploy</code> folder from this repo to your version of Aurina's 
   repository. Do the following changes in its contents: 
   - <code>build.sh</code> lines 31-35 change username to your DockerHub username and 
     (if you want) change the name of the <code>IMAGE</code>. Change folder name (L35) 
     if you renamed BRAINHACK20 folder into something else.
   - Modify the <code>RUN</code> instructions in the <code>Dockerfile</code> to make it 
     work for your version of Aurina's repository. 

6. Add a <coder>version.txt</code> file at the base of your repo. The file should
   written <code>v1.0</code> in it. 

7. Add <code>.github/workflows/buildDocker.yml</code> file to the base of your version of 
   Aurina's repository (keep the same folder structure).

8. Push your changes

9. Make release with tag <code>v1.0</code>

10. See if it succeeds and build & push a Docker image to your DockerHub account! 

</details>

<details><summary> <b> 😎 Tag Docker images you build for <a src="https://github.com/AurinaBMH/OHBMpractical">Auirina's repository</a> using information from GitHub actions </b> </font> </summary>

You need to complete the previous exercise first. There, we use <code>version.txt</code>
to tag Docker images we build and push. 

Your challenge is to tag Docker images without reading the info from <code>version.txt</code>.

</details>


# 🚀 How to set up your own MATLAB CI server? 

![](https://qmrlab.org/assets/images/p13-1.jpeg)

### Take me down to the open-source city where the code is clean and the runtime is free!

Making your MATLAB code Octave compatible is always a good idea. Yet, sometimes it is not easily possible. As you are making your code Octave compatible, you may sacrifice some features (e.g. GUI) or performance. How do we get the best of both MATLAB and Octave? 

Don’t worry, you won’t have to sell your soul to the devil to do it :) All it takes is to set up an Azure self-hosted agent.

### Good news: I wrote a [blog post](https://qmrlab.org/2020/06/16/matlab-ci.html) to explain how to do that! 
