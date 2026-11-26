# Registro de Auditoria e Rastreabilidade – DevSecOps

**Data de referência:** 26/11/2026  
**Repositório:** `devops-u3-devsecops`

---

## 1. Varredura de Vulnerabilidades no Pipeline CI/CD (Passo 1)
- Configurado o workflow `.github/workflows/security-scan.yml` no GitHub Actions para realizar o *checkout* do código, o *build* da imagem Docker local (`teste-sec`) e a análise de vulnerabilidades com o **Trivy** (`--severity HIGH,CRITICAL`).
- O pipeline foi configurado para bloquear execuções/avanços quando vulnerabilidades críticas ou altas são identificadas, reforçando a prevenção automatizada antes do *deploy*.
- Na análise registrada em `auditoria/trivy-report.txt`, foram identificadas:
  - **Sistema operacional:** 138 vulnerabilidades (132 **HIGH** e 6 **CRITICAL**), incluindo componentes como OpenSSL, Perl e `libsqlite3`.
  - **Pacotes Python:** 10 vulnerabilidades **HIGH**, envolvendo dependências como `urllib3`, `wheel` e `jaraco.context`.

---

## 2. Controle de Acesso Baseado em Papéis – RBAC no Kubernetes (Passo 2)
- Criados os manifestos em `rbac/` para aplicar o princípio do menor privilégio no namespace `default`:
  - `rbac/role.yaml`: define a `Role` com permissão restrita de leitura (`get`, `list`, `watch`) sobre o recurso `pods`, sem ações de alteração ou exclusão (`create`, `update`, `delete`).
  - `rbac/rolebinding.yaml`: cria o `ServiceAccount` `leitor-app` e o vincula à `Role` configurada.
  - `rbac/pod.yaml`: implanta um pod de teste associado ao `ServiceAccount` `leitor-app`.
- Nos testes de validação no cluster Kubernetes, o acesso interno ao serviço na porta `8080` foi permitido (`HTTP: 200`), enquanto a tentativa de exclusão de pod (`delete`) sob a identidade `leitor-app` foi bloqueada (`Error from server (Forbidden)`).

---

## 3. Evidências Automatizadas e Governança (Passo 3)
- Configurado o workflow `security-scan.yml` para gerar registros com *timestamp* UTC em `auditoria/deploy-audit.log` e salvar a saída do scanner em `auditoria/trivy-report.txt`.
- Habilitado o versionamento automático dos arquivos de auditoria no repositório por meio de `git add`, `git commit` e `git push` (incluindo execuções com falha/bloqueio).
- Documentada a estratégia de evidências e onde consultá-las na seção **“Auditoria e Rastreabilidade”** do `README.md`.

---

## 4. Melhorias e Próximos Passos
- Atualizar a imagem base do container e os pacotes Python com falhas conhecidas (`urllib3`, `wheel`, `jaraco.context` etc.) e reexecutar o workflow para validar a redução das vulnerabilidades.
- Manter o monitoramento contínuo das execuções no GitHub Actions e a atualização periódica deste log a cada nova mudança relevante de segurança ou acesso.
