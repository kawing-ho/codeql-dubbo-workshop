# CodeQL as an audit oracle: Dubbo Workshop

5th and 6th October 2021

## :new: 2025 UPDATE :cool:  

The repository has been updated to address several areas:
- Updated README.md and workshop.md to reflect changes in files.
- Updated exercise files to clearly differentiate between template files and solutions.
- Technical fixes include:
    - `MethodAccess` becoming [deprecated](https://codeql.github.com/codeql-standard-libraries/java/type.@methodaccess.html) in favour of `MethodCall`
    - `TaintTracking` and `DataFlow` syntax changes as per [here](https://github.blog/changelog/2023-08-13-new-dataflow-api-for-writing-custom-codeql-queries/).

## Preparation

For this workshop, you are invited to actively participate by writing CodeQL queries in Visual Studio Code. To do this, you will need to have Visual Studio Code up and running.

### Running locally

1. Install Visual Studio Code. 

2. Clone the repository (https://github.com/github/codeql-dubbo-workshop) locally. Make sure to get the submodules. For example with the command line

```
git clone --recursive https://github.com/github/codeql-dubbo-workshop.git
```
> [!IMPORTANT]
> It is crucial to keep the CodeQL standard libraries up to date with the CodeQL CLI binary, therefore you should update the `codeql` submodule to bump the versions as necessary.  
> This can be achieved by running `git submodule update --remote`


3. Open the repository folder in Visual Studio Code.

4. Install the CodeQL extension for Visual Studio Code, from the Visual Studio Code extensions marketplace. (Use the "Extensions" icon on the left of Visual Studio Code).

5. Click on the CodeQL icon on the left, dismiss the dialog if needed, then select "Add a CodeQL database/From an archive". Navigate to the `databases` folder and select `dubbo_2.7.8.zip`.

6. Go back to the CodeQL view (click on the CodeQL icon on the left if necessary). Hover over the database and select "Set Current Database".

7. Open the file `HelloWorld.ql` in VScode. (Use the Explorer icon on the left of Visual Studio Code, and locate the file in the root of the repository).

8. Right-click on the file, and select "CodeQL: Run query". You should see the "CodeQL Query Results" window on the right hand side.

9. Proceed to the [main content](workshop.md).


## :books: Resources
- For more advanced CodeQL development in future, you may wish to set up the [CodeQL starter workspace](https://codeql.github.com/docs/codeql-for-visual-studio-code/setting-up-codeql-in-visual-studio-code/#using-the-starter-workspace) for all languages.
- [CodeQL overview](https://codeql.github.com/docs/codeql-overview/)
- [CodeQL for Java](https://codeql.github.com/docs/codeql-language-guides/codeql-for-java/)
- [Analyzing data flow in Java](https://codeql.github.com/docs/codeql-language-guides/analyzing-data-flow-in-java/)
- [Using the CodeQL extension for VS Code](https://codeql.github.com/docs/codeql-for-visual-studio-code/)
- CodeQL on [GitHub Learning Lab](https://lab.github.com/search?q=codeql)
- CodeQL on [GitHub Security Lab](https://codeql.com)
