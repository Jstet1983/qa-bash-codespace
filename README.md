# VM-like QA Codespace for Bash Scripts

This Codespace acts like a lightweight Linux VM for running and testing Bash scripts.

## How to Use

1. Start a Codespace from this repository.
2. Place your `.sh` scripts in the `scripts/` folder.
3. Make scripts executable if needed:
   ```bash
   chmod +x scripts/hello.sh
   ```
4. Run them:
   ```bash
   ./scripts/hello.sh
   ```

## Notes

- The Codespace container is isolated from your local machine, similar to a VM.
- You can install additional packages as needed:
  ```bash
  sudo apt-get install <package-name>
  ```
