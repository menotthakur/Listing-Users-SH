# GitHub API Integration with Shell Scripting

## Table of Contents

- [Overview](#overview)
- [Bullet Points Summary](#bullet-points-summary)
- [Tabular Representation](#tabular-representation)
- [Mind Map](#mind-map)
- [Section Summaries](#section-summaries)
- [Commands Used](#commands-used)
- [Key Terms and Definitions](#key-terms-and-definitions)

---

## Overview

This project covers a practical shell scripting task to automate GitHub repository access monitoring using GitHub API integration. The script lists all users who have access to a GitHub repo, which is a common task in DevOps roles.

---

## Bullet Points Summary

- **Main Project Goal**: Automate GitHub repo access audit using Shell Script and GitHub API.
- **Use Case**: Identify users with access to a repo, especially when revoking access for resigning employees.
- **Why API**: APIs allow programmatic access to GitHub data, unlike manual browser methods.
- **API vs CLI**: GitHub can be accessed via CLI or API, but APIs are more flexible and script-friendly.
- **Shell Script Components**:
  - Uses curl for API calls.
  - Uses JQ for parsing JSON.
  - Reads GitHub username and token from environment variables.
  - Accepts repo owner and repo name as arguments.
  - Filters and displays users who are not admins.
- **Execution Steps**:
  - Export GitHub username and token.
  - Provide organization and repository name as command-line arguments.
  - Run the script.
- **Improvement Suggestions**:
  - Add script description and metadata.
  - Add helper function for argument validation.

---

## Tabular Representation

| Component               | Description                                                   |
| ----------------------- | ------------------------------------------------------------- |
| Tool                    | Shell Script                                                  |
| Language                | Bash                                                          |
| Module Used             | curl, jq                                                      |
| Input Parameters        | GitHub username, token, repo owner, repo name                 |
| Output                  | List of users with read/write access to the repo (non-admins) |
| Use Case                | Audit repository collaborators, automate access reviews       |
| API Endpoint Format     | `https://api.github.com/repos/{owner}/{repo}/collaborators`   |
| GitHub Auth Requirement | Personal Access Token (PAT)                                   |

---

## Mind Map

```
GitHub API Shell Script Project
├── Purpose
│   ├── List repo users
│   └── Automate access management
├── Concepts
│   ├── API
│   ├── CLI vs API
│   ├── JSON parsing
├── Tools
│   ├── curl
│   ├── jq
├── Steps
│   ├── Export credentials
│   ├── Run script
│   ├── View output
├── Improvements
│   ├── Add metadata
│   └── Add argument check helper
```

---

## Section Summaries

### DevOps Context

As a DevOps Engineer, you're expected to manage multiple repositories and ensure only authorized users have access. Instead of manual checks, a script can automate this.

### Why Use GitHub API

- GUI access is not always available or efficient.
- APIs allow for scripting and automation.
- APIs can be used with tools like curl (shell) or requests (Python).

### Authentication and API Tokens

- GUI login uses username/password.
- API access uses tokens (PATs).
- Tokens should be kept private and exported as environment variables.

### Using the Script

- The shell script uses curl to fetch collaborator data.
- JSON data returned is filtered using jq.
- Only users with non-admin access (read/write) are displayed.

### Practicing the Project

- You can create your own GitHub org and repos to test.
- Use API tokens with limited access.

### Script Breakdown

- Starts with shebang (`#!/bin/bash`).
- Reads user inputs (repo owner and name).
- Forms API URL.
- Authenticates using curl.
- Filters JSON using jq to show non-admin users.

### Suggested Improvements

- Add metadata block (description, inputs, usage).
- Add helper function to validate arguments.

---

## Commands Used

```bash
# Export GitHub username
export username=your_github_username

# Export GitHub token
export token=your_github_token

# Make the script executable
chmod 777 list_users.sh

# Install jq (JSON parser)
sudo apt install jq -y

# Run the shell script with org and repo as arguments
./list_users.sh org_name repo_name
```

---

## Key Terms and Definitions

| Term            | Definition                                                                      |
| --------------- | ------------------------------------------------------------------------------- |
| API             | Application Programming Interface. Allows programmatic communication with apps. |
| CLI             | Command Line Interface. Text-based interface to run commands.                   |
| curl            | Command-line tool to transfer data from or to a server.                         |
| jq              | Command-line JSON processor.                                                    |
| JSON            | JavaScript Object Notation - standard format for API data.                      |
| PAT             | Personal Access Token for authenticating GitHub API requests.                   |
| Collaborator    | A user with permission to access a GitHub repository.                           |
| Admin           | A user with full control over a repository.                                     |
| Environment Var | A variable that stores information used by the operating system or scripts.     |
| Shebang         | `#!/bin/bash` - defines the interpreter for script execution.                   |

---

**End of Notes**

