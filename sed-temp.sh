# 目标代码库(Fork demo-pipeline-argoevents-tekton)
# 批量替换ArgoCD监听的代码库地址为目标代码库地址
sed -i -e "s#https://github.com/lanbingcloud/demo-cicd-tekton-argocd.git#https://github.com/liujunhong5891/demo-cicd-tekton-argocd.git#g"  `grep https://github.com/lanbingcloud/demo-cicd-tekton-argocd.git -rl demo-cicd-tekton-argocd`
sed -i -e "s#https://github.com/lanbingcloud/demo-user-deployments.git#https://github.com/liujunhong5891/demo-user-deployments.git#g"  demo-cicd-tekton-argocd/runtimes/deployment1-runtime/production/user-test-app.yaml
# 批量替换宿主机IP、Vault服务端IP(这里Vault也安装在同一台宿主机)
sed -i -e "s#192.168.0.184#192.168.0.243#g"  `grep 192.168.0.184 -rl demo-cicd-tekton-argocd`
# 批量替换ArgoCD、pipeline的Ingress域名
sed -i -e "s#119-8-58-20#119-8-99-179#g"  `grep 119-8-58-20 -rl demo-cicd-tekton-argocd`
# 替换ArgoEvents中EventSource的repo，包括owner和names
sed -i -e "s#lanbingcloud#liujunhong5891#g"  demo-cicd-tekton-argocd/argo-events/overlays/production/eventsource.yaml
sed -i -e "s#demo-user-project#demo-user-project#g"  demo-cicd-tekton-argocd/argo-events/overlays/production/eventsource.yaml
#  替换ArgoEvents中init-pipeline的git-clone代码库地址
sed -i -e "s#https://github.com/lanbingcloud/demo-user-project.git#https://github.com/liujunhong5891/demo-user-project.git#g" demo-cicd-tekton-argocd/argo-events/overlays/production/init-pipeline.yaml
# 目标代码库(Fork demo-user-project)
# 替换pipeline中拉取代码、推送代码、镜像仓库的地址
sed -i -e "s#https://github.com/lanbingcloud/demo-user-project.git#https://github.com/liujunhong5891/demo-user-project.git#g" demo-user-project/pipelines/test-deployment-pipeline.yaml
sed -i -e "s#git@github.com:lanbingcloud/demo-user-deployments.git#git@github.com:liujunhong5891/demo-user-deployments.git#g" demo-user-project/pipelines/test-deployment-pipeline.yaml
# 替换镜像仓库地址(流水线新增deployment任务)
sed -i -e "s#ghcr.io/lanbingcloud#ghcr.io/liujunhong5891#g" demo-user-project/pipelines/test-deployment-pipeline.yaml
# 目标代码库(Fork demo-user-deployments)
# 替换image地址
sed -i -e "s#ghcr.io/lanbingcloud#ghcr.io/liujunhong5891#g"  demo-user-deployments/deployments/test/devops-sample.yaml 
# 替换应用的Ingress域名
sed -i -e "s#119-8-58-20#119-8-99-179#g"  demo-user-deployments/deployments/test/devops-sample-svc.yaml 