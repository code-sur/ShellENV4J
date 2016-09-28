# Bootstrap a java + maven project

Set the dirname for your project:
```bash
PROJECT_NAME='your_project'  # <-- Edit this line!
```

...and cut and paste these lines:
```bash
git clone --depth 1 git@github.com:code-sur/setup-java-project.git $PROJECT_NAME
cd $PROJECT_NAME
git ci --amend -m "Initial commit (java+maven project)"
git remote remove origin
```

Congratulations, setup is done!
