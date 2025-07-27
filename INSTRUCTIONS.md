# Instructions: Setting Up a VM-like QA Codespace for Bash Scripts

Follow these steps to create and use your own QA Codespace that acts like a lightweight Linux VM for running and testing Bash scripts.

---

## 1. **Create a New Repository**

1. Go to [GitHub](https://github.com/) and create a new repository (e.g., `qa-bash-codespace`).
2. Clone the repository to your local machine **or** use the GitHub web interface.

---

## 2. **Add the Repository Structure**

Create the following directory and file structure in your repo:

```
/
├── .devcontainer/
│   └── devcontainer.json
├── scripts/
│   └── hello.sh
├── README.md
├── INSTRUCTIONS.md
```

---

## 3. **Add the Dev Container Configuration**

Create `.devcontainer/devcontainer.json` with the following content:

```json
{
  "name": "VM-like Bash QA",
  "image": "mcr.microsoft.com/devcontainers/base:ubuntu",
  "features": {
    "ghcr.io/devcontainers/features/bash:1": {},
    "ghcr.io/devcontainers/features/git:1": {}
  },
  "postCreateCommand": "apt-get update && apt-get install -y jq curl sudo"
}
```

---

## 4. **Add Example Bash Script**

Create `scripts/hello.sh` with:

```bash
#!/bin/bash
echo "Hello from your Codespace VM!"
```

Make it executable (Codespaces terminal):

```bash
chmod +x scripts/hello.sh
```

---

## 5. **Add README and Instructions File**

Add a `README.md` (see the provided file in this repo) and this `INSTRUCTIONS.md` file for future reference.

---

## 6. **Push to GitHub**

If working locally, push your changes:

```bash
git add .
git commit -m "Initial VM-like QA Codespace setup"
git push origin main
```

---

## 7. **Open in Codespaces**

1. On GitHub, click the green **Code** button, then **Create codespace on main**.
2. Wait for the Codespace to initialize (it will use your `.devcontainer` settings).

---

## 8. **Using Your Codespace**

- Place any Bash scripts you want to test inside the `scripts/` directory.
- Run them from the Codespace terminal, e.g.:
  ```bash
  ./scripts/hello.sh
  ```
- Install any other packages you need using `sudo apt-get install <package>`.

---

## 9. **Tips**

- This setup is isolated from your machine, acting like a VM.
- You can customize the devcontainer for additional tools as needed.

---

You're ready to QA your Bash scripts in a safe, VM-like environment!
