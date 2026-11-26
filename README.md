![Security Scan DevSecOps](https://github.com/augustoanderson998-cloud/devops-u3-devsecops/actions/workflows/security-scan.yml/badge.svg)

# DevSecOps – Unidade 3

Projeto de demonstração de práticas de segurança em DevOps.

## Estrutura

- `.github/workflows/security-scan.yml` – workflow de análise de segurança com Trivy.
- `auditoria/` – relatórios e registros de auditoria.
- `rbac/` – exemplos de RBAC no Kubernetes.
- `Dockerfile` – imagem da aplicação.
- `app.py` – aplicação Flask de exemplo.

## Executar localmente

```bash
pip install flask
python app.py
```

A aplicação ficará disponível em `http://localhost:5000`.
