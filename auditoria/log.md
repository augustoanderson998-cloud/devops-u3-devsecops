# Registro Manual de Ações de Segurança

## 26/11/2026

- Foi configurado o workflow `security-scan.yml` para analisar a imagem Docker com Trivy.
- A análise foi configurada para detectar vulnerabilidades `HIGH` e `CRITICAL`.
- O Trivy bloqueou execuções ao encontrar vulnerabilidades. O relatório registrado mostrou:
  - 138 vulnerabilidades no sistema operacional: 132 HIGH e 6 CRITICAL.
  - 10 vulnerabilidades HIGH em pacotes Python.
- Foram registrados resultados do Trivy em `auditoria/trivy-report.txt`.
- Foram criados arquivos de RBAC em `rbac/`:
  - `rbac/role.yaml`
  - `rbac/rolebinding.yaml`
  - `rbac/pod.yaml`
- Foram configurados registros de execução com timestamp UTC em `auditoria/deploy-audit.log`.
- O workflow foi configurado para versionar os arquivos de auditoria automaticamente com `git add`, `git commit` e `git push`.
- Foram identificadas vulnerabilidades em componentes como OpenSSL, Perl, libsqlite3 e pacotes Python, incluindo `urllib3`, `wheel` e `jaraco.context`.
- Foram realizadas melhorias na rastreabilidade por meio da seção “Auditoria e Rastreabilidade” no `README.md`.

## Próximas validações

- Atualizar a base da imagem Docker e os pacotes Python afetados.
- Executar novamente o Trivy e confirmar a redução das vulnerabilidades.
- Testar explicitamente as permissões do RBAC para verificar os acessos concedidos e negados.
- Confirmar a publicação automática dos relatórios em todas as execuções, inclusive nas que forem bloqueadas.
