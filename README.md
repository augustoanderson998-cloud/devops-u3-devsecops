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

## Auditoria e Rastreabilidade

O projeto mantém evidências das verificações de segurança no diretório [`auditoria/`](auditoria/):

- `auditoria/trivy-report.txt`: relatório gerado pelo Trivy em cada execução do workflow.
- `auditoria/deploy-audit.log`: registro do horário das execuções simuladas.
- `auditoria/log.md`: resumo manual das ações de segurança realizadas.

O workflow `.github/workflows/security-scan.yml` executa o Trivy após construir a imagem Docker. Depois da execução, o workflow usa `git add`, `git commit` e `git push` para versionar automaticamente os arquivos de auditoria no repositório.

Para consultar o histórico de execuções, acesse a aba **Actions** no GitHub e selecione **Security Scan DevSecOps**.
