 (cd "$(git rev-parse --show-toplevel)" && git apply --3way <<'EOF' 
diff --git a/README.md b/README.md
index f04e60eed444ddcdb49e3a5fa4bfe7e735fd23c2..3ed2527c2afd91461f2dd867a692b9d533173952 100644
--- a/README.md
+++ b/README.md
@@ -1 +1,91 @@
-# hack-code
\ No newline at end of file
+# Dual-Mode Encrypted Messenger (Working Prototype)
+
+This repository includes runnable code for a dual-mode encrypted messenger prototype:
+
+- **Cloud mode**: central server routes encrypted packets.
+- **Mesh mode**: messages hop across nearby peers (A -> C -> B) without server transport.
+
+## What is implemented
+
+- Signup with `name + email` and server-issued permanent **6-digit code**.
+- Device-side X25519 keypair generation.
+- Public key directory stored on server; private key stays on node.
+- Add contact using 6-digit code (resolves public key).
+- End-to-end encrypted payloads using X25519 + HKDF + ChaCha20-Poly1305.
+- Cloud send/receive flow.
+- Mesh multi-hop forwarding with TTL and duplicate suppression.
+- Relay cache model for temporary storage behavior.
+
+## 1) Open terminal in the project folder
+
+> Important: `/workspace/hack-code` is the container path used by this environment.
+> On your own laptop, use your **actual local folder path**.
+
+### Windows (PowerShell)
+
+If you cloned into `C:\Users\japle\Documents\hack-code`, run:
+
+```powershell
+cd C:\Users\japle\Documents\hack-code
+```
+
+If you are not sure where the folder is, search first:
+
+```powershell
+Get-ChildItem -Path C:\ -Directory -Filter hack-code -Recurse -ErrorAction SilentlyContinue
+```
+
+### macOS/Linux
+
+```bash
+cd /path/to/hack-code
+```
+
+## 2) Create and activate virtual environment
+
+### Windows (PowerShell)
+
+```powershell
+python -m venv .venv
+.\.venv\Scripts\Activate.ps1
+```
+
+### macOS/Linux
+
+```bash
+python -m venv .venv
+source .venv/bin/activate
+```
+
+## 3) Install dependencies
+
+```bash
+pip install -r requirements.txt
+```
+
+## 4) Run the app demo
+
+```bash
+python src/dual_mode_app.py
+```
+
+Expected output shows:
+- assigned 6-digit codes,
+- cloud delivery to recipient,
+- mesh delivery via relay node.
+
+## 5) Run tests
+
+```bash
+pytest -q
+```
+
+## Project files
+
+- `src/dual_mode_app.py` — core prototype logic (directory server, chat nodes, mesh transport, demo).
+- `tests/test_dual_mode_app.py` — cloud, mesh multi-hop, and duplicate-drop tests.
+
+## Notes
+
+- This is a **functional prototype**, not a production mobile app yet.
+- Next step is wiring this protocol engine into Android/iOS clients (Flutter/React Native + native BLE/Wi-Fi modules).
 
EOF
)
